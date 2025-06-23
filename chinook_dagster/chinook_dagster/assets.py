from dagster import AssetExecutionContext
from dagster_dbt import DbtCliResource, dbt_assets

from .project import uv_dag_dbt_bq_project


@dbt_assets(manifest=uv_dag_dbt_bq_project.manifest_path)
def uv_dag_dbt_bq_dbt_assets(context: AssetExecutionContext, dbt: DbtCliResource):
    yield from dbt.cli(["build"], context=context).stream()
    