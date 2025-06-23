from dagster import Definitions
from dagster_dbt import DbtCliResource
from .assets import uv_dag_dbt_bq_dbt_assets
from .project import uv_dag_dbt_bq_project
from .schedules import schedules

defs = Definitions(
    assets=[uv_dag_dbt_bq_dbt_assets],
    schedules=schedules,
    resources={
        "dbt": DbtCliResource(project_dir=uv_dag_dbt_bq_project),
    },
)