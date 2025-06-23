from pathlib import Path

from dagster_dbt import DbtProject

uv_dag_dbt_bq_project = DbtProject(
    project_dir=Path(__file__).joinpath("..", "..", "..", "uv_dag_dbt_bq").resolve(),
    packaged_project_dir=Path(__file__).joinpath("..", "..", "dbt-project").resolve(),
)
uv_dag_dbt_bq_project.prepare_if_dev()