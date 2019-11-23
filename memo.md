# メモ

## 起動手順
以下は、certsディレクトリが残っている場合は消してから実行すること

```bash
$ docker-compose -f create-certs.yml up
 certsディレクトリと各サーバの証明書が出来上がる。
$ docker-compose up -d
 サービス起動。割と遅いので3分くらい待つ
```

### 参考ページ
- https://www.elastic.co/guide/en/elasticsearch/reference/6.8/configuring-tls-docker.html
- https://www.elastic.co/guide/en/kibana/6.8/configuring-tls.html
- https://www.elastic.co/guide/en/elasticsearch/reference/6.8/configuring-security.html
- https://www.elastic.co/guide/en/kibana/6.8/settings.html
- https://www.elastic.co/guide/en/x-pack/current/setting-up-authentication.html#set-built-in-user-passwords

## デフォルトのセキュリティ設定の確認
```json
GET _security/role

{
  "kibana_dashboard_only_user" : {
    "cluster" : [ ],
    "indices" : [
      {
        "names" : [
          ".kibana*"
        ],
        "privileges" : [
          "read",
          "view_index_metadata"
        ],
        "allow_restricted_indices" : false
      }
    ],
    "applications" : [
      {
        "application" : "kibana-.kibana",
        "privileges" : [
          "read"
        ],
        "resources" : [
          "*"
        ]
      }
    ],
    "run_as" : [ ],
    "metadata" : {
      "_reserved" : true
    },
    "transient_metadata" : {
      "enabled" : true
    }
  },
  "apm_system" : {
    "cluster" : [
      "monitor",
      "cluster:admin/xpack/monitoring/bulk"
    ],
    "indices" : [ ],
    "applications" : [ ],
    "run_as" : [ ],
    "metadata" : {
      "_reserved" : true
    },
    "transient_metadata" : {
      "enabled" : true
    }
  },
  "watcher_admin" : {
    "cluster" : [
      "manage_watcher"
    ],
    "indices" : [
      {
        "names" : [
          ".watches",
          ".triggered_watches",
          ".watcher-history-*"
        ],
        "privileges" : [
          "read"
        ],
        "allow_restricted_indices" : false
      }
    ],
    "applications" : [ ],
    "run_as" : [ ],
    "metadata" : {
      "_reserved" : true
    },
    "transient_metadata" : {
      "enabled" : true
    }
  },
  "logstash_system" : {
    "cluster" : [
      "monitor",
      "cluster:admin/xpack/monitoring/bulk"
    ],
    "indices" : [ ],
    "applications" : [ ],
    "run_as" : [ ],
    "metadata" : {
      "_reserved" : true
    },
    "transient_metadata" : {
      "enabled" : true
    }
  },
  "rollup_user" : {
    "cluster" : [
      "monitor_rollup"
    ],
    "indices" : [ ],
    "applications" : [ ],
    "run_as" : [ ],
    "metadata" : {
      "_reserved" : true
    },
    "transient_metadata" : {
      "enabled" : true
    }
  },
  "kibana_user" : {
    "cluster" : [ ],
    "indices" : [
      {
        "names" : [
          ".kibana*"
        ],
        "privileges" : [
          "manage",
          "read",
          "index",
          "delete"
        ],
        "allow_restricted_indices" : false
      }
    ],
    "applications" : [
      {
        "application" : "kibana-.kibana",
        "privileges" : [
          "all"
        ],
        "resources" : [
          "*"
        ]
      }
    ],
    "run_as" : [ ],
    "metadata" : {
      "_reserved" : true
    },
    "transient_metadata" : {
      "enabled" : true
    }
  },
  "machine_learning_user" : {
    "cluster" : [
      "monitor_ml"
    ],
    "indices" : [
      {
        "names" : [
          ".ml-anomalies*",
          ".ml-notifications*"
        ],
        "privileges" : [
          "view_index_metadata",
          "read"
        ],
        "allow_restricted_indices" : false
      },
      {
        "names" : [
          ".ml-annotations*"
        ],
        "privileges" : [
          "view_index_metadata",
          "read",
          "write"
        ],
        "allow_restricted_indices" : false
      }
    ],
    "applications" : [ ],
    "run_as" : [ ],
    "metadata" : {
      "_reserved" : true
    },
    "transient_metadata" : {
      "enabled" : true
    }
  },
  "beats_admin" : {
    "cluster" : [ ],
    "indices" : [
      {
        "names" : [
          ".management-beats"
        ],
        "privileges" : [
          "all"
        ],
        "allow_restricted_indices" : false
      }
    ],
    "applications" : [ ],
    "run_as" : [ ],
    "metadata" : {
      "_reserved" : true
    },
    "transient_metadata" : {
      "enabled" : true
    }
  },
  "remote_monitoring_agent" : {
    "cluster" : [
      "manage_index_templates",
      "manage_ingest_pipelines",
      "monitor",
      "cluster:monitor/xpack/watcher/watch/get",
      "cluster:admin/xpack/watcher/watch/put",
      "cluster:admin/xpack/watcher/watch/delete"
    ],
    "indices" : [
      {
        "names" : [
          ".monitoring-*"
        ],
        "privileges" : [
          "all"
        ],
        "allow_restricted_indices" : false
      },
      {
        "names" : [
          "metricbeat-*"
        ],
        "privileges" : [
          "index",
          "create_index"
        ],
        "allow_restricted_indices" : false
      }
    ],
    "applications" : [ ],
    "run_as" : [ ],
    "metadata" : {
      "_reserved" : true
    },
    "transient_metadata" : {
      "enabled" : true
    }
  },
  "machine_learning_admin" : {
    "cluster" : [
      "manage_ml"
    ],
    "indices" : [
      {
        "names" : [
          ".ml-anomalies*",
          ".ml-notifications*",
          ".ml-state*",
          ".ml-meta*"
        ],
        "privileges" : [
          "view_index_metadata",
          "read"
        ],
        "allow_restricted_indices" : false
      },
      {
        "names" : [
          ".ml-annotations*"
        ],
        "privileges" : [
          "view_index_metadata",
          "read",
          "write"
        ],
        "allow_restricted_indices" : false
      }
    ],
    "applications" : [ ],
    "run_as" : [ ],
    "metadata" : {
      "_reserved" : true
    },
    "transient_metadata" : {
      "enabled" : true
    }
  },
  "watcher_user" : {
    "cluster" : [
      "monitor_watcher"
    ],
    "indices" : [
      {
        "names" : [
          ".watches"
        ],
        "privileges" : [
          "read"
        ],
        "allow_restricted_indices" : false
      },
      {
        "names" : [
          ".watcher-history-*"
        ],
        "privileges" : [
          "read"
        ],
        "allow_restricted_indices" : false
      }
    ],
    "applications" : [ ],
    "run_as" : [ ],
    "metadata" : {
      "_reserved" : true
    },
    "transient_metadata" : {
      "enabled" : true
    }
  },
  "rollup_admin" : {
    "cluster" : [
      "manage_rollup"
    ],
    "indices" : [ ],
    "applications" : [ ],
    "run_as" : [ ],
    "metadata" : {
      "_reserved" : true
    },
    "transient_metadata" : {
      "enabled" : true
    }
  },
  "snapshot_user" : {
    "cluster" : [
      "create_snapshot",
      "cluster:admin/repository/get"
    ],
    "indices" : [
      {
        "names" : [
          "*"
        ],
        "privileges" : [
          "view_index_metadata"
        ],
        "allow_restricted_indices" : true
      }
    ],
    "applications" : [ ],
    "run_as" : [ ],
    "metadata" : {
      "_reserved" : true
    },
    "transient_metadata" : {
      "enabled" : true
    }
  },
  "monitoring_user" : {
    "cluster" : [
      "cluster:monitor/main",
      "cluster:monitor/xpack/info"
    ],
    "indices" : [
      {
        "names" : [
          ".monitoring-*"
        ],
        "privileges" : [
          "read",
          "read_cross_cluster"
        ],
        "allow_restricted_indices" : false
      }
    ],
    "applications" : [ ],
    "run_as" : [ ],
    "metadata" : {
      "_reserved" : true
    },
    "transient_metadata" : {
      "enabled" : true
    }
  },
  "beats_system" : {
    "cluster" : [
      "monitor",
      "cluster:admin/xpack/monitoring/bulk"
    ],
    "indices" : [ ],
    "applications" : [ ],
    "run_as" : [ ],
    "metadata" : {
      "_reserved" : true
    },
    "transient_metadata" : {
      "enabled" : true
    }
  },
  "reporting_user" : {
    "cluster" : [ ],
    "indices" : [ ],
    "applications" : [ ],
    "run_as" : [ ],
    "metadata" : {
      "_reserved" : true
    },
    "transient_metadata" : {
      "enabled" : true
    }
  },
  "kibana_system" : {
    "cluster" : [
      "monitor",
      "manage_index_templates",
      "cluster:admin/xpack/monitoring/bulk",
      "manage_saml",
      "manage_token"
    ],
    "global" : {
      "application" : {
        "manage" : {
          "applications" : [
            "kibana-*"
          ]
        }
      }
    },
    "indices" : [
      {
        "names" : [
          ".kibana*",
          ".reporting-*"
        ],
        "privileges" : [
          "all"
        ],
        "allow_restricted_indices" : false
      },
      {
        "names" : [
          ".monitoring-*"
        ],
        "privileges" : [
          "read",
          "read_cross_cluster"
        ],
        "allow_restricted_indices" : false
      },
      {
        "names" : [
          ".management-beats"
        ],
        "privileges" : [
          "create_index",
          "read",
          "write"
        ],
        "allow_restricted_indices" : false
      }
    ],
    "applications" : [ ],
    "run_as" : [ ],
    "metadata" : {
      "_reserved" : true
    },
    "transient_metadata" : {
      "enabled" : true
    }
  },
  "logstash_admin" : {
    "cluster" : [ ],
    "indices" : [
      {
        "names" : [
          ".logstash*"
        ],
        "privileges" : [
          "create",
          "delete",
          "index",
          "manage",
          "read"
        ],
        "allow_restricted_indices" : false
      }
    ],
    "applications" : [ ],
    "run_as" : [ ],
    "metadata" : {
      "_reserved" : true
    },
    "transient_metadata" : {
      "enabled" : true
    }
  },
  "transport_client" : {
    "cluster" : [
      "transport_client"
    ],
    "indices" : [ ],
    "applications" : [ ],
    "run_as" : [ ],
    "metadata" : {
      "_reserved" : true
    },
    "transient_metadata" : {
      "enabled" : true
    }
  },
  "remote_monitoring_collector" : {
    "cluster" : [
      "monitor"
    ],
    "indices" : [
      {
        "names" : [
          "*"
        ],
        "privileges" : [
          "monitor"
        ],
        "allow_restricted_indices" : true
      },
      {
        "names" : [
          ".kibana*"
        ],
        "privileges" : [
          "read"
        ],
        "allow_restricted_indices" : false
      }
    ],
    "applications" : [ ],
    "run_as" : [ ],
    "metadata" : {
      "_reserved" : true
    },
    "transient_metadata" : {
      "enabled" : true
    }
  },
  "superuser" : {
    "cluster" : [
      "all"
    ],
    "indices" : [
      {
        "names" : [
          "*"
        ],
        "privileges" : [
          "all"
        ],
        "allow_restricted_indices" : true
      }
    ],
    "applications" : [
      {
        "application" : "*",
        "privileges" : [
          "*"
        ],
        "resources" : [
          "*"
        ]
      }
    ],
    "run_as" : [
      "*"
    ],
    "metadata" : {
      "_reserved" : true
    },
    "transient_metadata" : { }
  },
  "ingest_admin" : {
    "cluster" : [
      "manage_index_templates",
      "manage_pipeline"
    ],
    "indices" : [ ],
    "applications" : [ ],
    "run_as" : [ ],
    "metadata" : {
      "_reserved" : true
    },
    "transient_metadata" : {
      "enabled" : true
    }
  },
  "logstash_write_role" : {
    "cluster" : [
      "monitor",
      "manage_index_templates"
    ],
    "indices" : [
      {
        "names" : [
          "logstash*",
          "semc_item_master*"
        ],
        "privileges" : [
          "write",
          "create_index"
        ],
        "field_security" : {
          "grant" : [
            "*"
          ]
        },
        "allow_restricted_indices" : false
      }
    ],
    "applications" : [ ],
    "run_as" : [ ],
    "metadata" : { },
    "transient_metadata" : {
      "enabled" : true
    }
  }
}


GET _security/role_mapping

{ } 

GET _security/user

{
  "elastic" : {
    "username" : "elastic",
    "roles" : [
      "superuser"
    ],
    "full_name" : null,
    "email" : null,
    "metadata" : {
      "_reserved" : true
    },
    "enabled" : true
  },
  "kibana" : {
    "username" : "kibana",
    "roles" : [
      "kibana_system"
    ],
    "full_name" : null,
    "email" : null,
    "metadata" : {
      "_reserved" : true
    },
    "enabled" : true
  },
  "logstash_system" : {
    "username" : "logstash_system",
    "roles" : [
      "logstash_system"
    ],
    "full_name" : null,
    "email" : null,
    "metadata" : {
      "_reserved" : true
    },
    "enabled" : true
  },
  "beats_system" : {
    "username" : "beats_system",
    "roles" : [
      "beats_system"
    ],
    "full_name" : null,
    "email" : null,
    "metadata" : {
      "_reserved" : true
    },
    "enabled" : true
  },
  "apm_system" : {
    "username" : "apm_system",
    "roles" : [
      "apm_system"
    ],
    "full_name" : null,
    "email" : null,
    "metadata" : {
      "_reserved" : true
    },
    "enabled" : true
  },
  "remote_monitoring_user" : {
    "username" : "remote_monitoring_user",
    "roles" : [
      "remote_monitoring_collector",
      "remote_monitoring_agent"
    ],
    "full_name" : null,
    "email" : null,
    "metadata" : {
      "_reserved" : true
    },
    "enabled" : true
  },
  "logstash_writer" : {
    "username" : "logstash_writer",
    "roles" : [
      "logstash_write_role"
    ],
    "full_name" : null,
    "email" : null,
    "metadata" : { },
    "enabled" : true
  }
}
```

`elastic`ユーザは最強の権限である`superuser`ロールを持っていた。
デフォルトでAPMやLogstash、Kibana用のユーザも登録されている。

mappingには何もはいっていなかった。おそらくLDAPグループとかのグループとの紐付けで利用するのでは無いかと思った。

## Privilagesの一覧
https://www.elastic.co/guide/en/elasticsearch/reference/7.4/security-privileges.html

バージョンはそれぞれ適当に変更して。

## 起動後にリクエストを投げてRBACしてみた
```json
POST _security/user/logstash_writer
{
  "username": "logstash_writer",
  "roles": [],
  "full_name": null,
  "email": null,
  "password": "logstash",
  "enabled": true
}

POST _security/role/logstash_write_role
{
  "cluster": [
    "monitor",
    "manage_index_templates"
  ],
  "indices": [
    {
      "names": [
        "logstash*",
        "semc_item_master*"
      ],
      "privileges": [
        "write",
        "create_index"
      ],
      "field_security": {
        "grant": [
          "*"
        ]
      }
    }
  ],
  "run_as": [],
  "metadata": {},
  "transient_metadata": {
    "enabled": true
  }
}

POST _security/user/logstash_writer
{
  "roles": ["logstash_write_role"]
}
```
この設定で`logstash_writer`ユーザを利用して、ロールに従った指定の名前のインデックスの作成と書き込みが可能。
