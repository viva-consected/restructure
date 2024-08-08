SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: dynamic; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA dynamic;


--
-- Name: extra_app; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA extra_app;


--
-- Name: ml_app; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA ml_app;


--
-- Name: redcap; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA redcap;


--
-- Name: ref_data; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA ref_data;


--
-- Name: log_activity_log_project_assignment_simple_tests_update(); Type: FUNCTION; Schema: dynamic; Owner: -
--

CREATE FUNCTION dynamic.log_activity_log_project_assignment_simple_tests_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO activity_log_project_assignment_simple_test_history (
    master_id,
    project_assignment_id,
    created_by_user_id, next_step, status, event_time, disabled, notes,
    extra_log_type,
    user_id,
    created_at,
    updated_at,
    activity_log_project_assignment_simple_test_id)
  SELECT
    NEW.master_id,
    NEW.project_assignment_id,
    NEW.created_by_user_id, NEW.next_step, NEW.status, NEW.event_time, NEW.disabled, NEW.notes,
    NEW.extra_log_type,
    NEW.user_id,
    NEW.created_at,
    NEW.updated_at,
    NEW.id;
  RETURN NEW;
END;
$$;


--
-- Name: log_project_imports_update(); Type: FUNCTION; Schema: dynamic; Owner: -
--

CREATE FUNCTION dynamic.log_project_imports_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO project_import_history (
    master_id,
    approval_status, ap_title, investigator_name, investigator_name2, co_i_mentor, ap_presentation_date, meeting_ap_presented, sci_approval_status, irb_title, irb_status, cv, citi_equiv, ack, data_ready, data_update_date, meeting_data_update, data_update2_date, meeting_data_update2, grant_association, publication_1, publication_2, notes, orig_id, import_status,
    user_id,
    created_at,
    updated_at,
    project_import_id)
  SELECT
    NEW.master_id,
    NEW.approval_status, NEW.ap_title, NEW.investigator_name, NEW.investigator_name2, NEW.co_i_mentor, NEW.ap_presentation_date, NEW.meeting_ap_presented, NEW.sci_approval_status, NEW.irb_title, NEW.irb_status, NEW.cv, NEW.citi_equiv, NEW.ack, NEW.data_ready, NEW.data_update_date, NEW.meeting_data_update, NEW.data_update2_date, NEW.meeting_data_update2, NEW.grant_association, NEW.publication_1, NEW.publication_2, NEW.notes, NEW.orig_id, NEW.import_status,
    NEW.user_id,
    NEW.created_at,
    NEW.updated_at,
    NEW.id;
  RETURN NEW;
END;
$$;


--
-- Name: log_test_fields_update(); Type: FUNCTION; Schema: dynamic; Owner: -
--

CREATE FUNCTION dynamic.log_test_fields_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO test_field_history (
    master_id,
    test_id, test_boolean, test_integer, test_float, test_decimal, test_date, test_datetime, test_at, test_yes_no, test_no_yes, tag_select_record_id_from_dynamic_model__test_field, tag_select_record_from_dynamic_model__test_field, select_record_from_dynamic_model__test_field, select_record_from_table_dynamic_model__test_field,
    user_id,
    created_at,
    updated_at,
    test_field_id)
  SELECT
    NEW.master_id,
    NEW.test_id, NEW.test_boolean, NEW.test_integer, NEW.test_float, NEW.test_decimal, NEW.test_date, NEW.test_datetime, NEW.test_at, NEW.test_yes_no, NEW.test_no_yes, NEW.tag_select_record_id_from_dynamic_model__test_field, NEW.tag_select_record_from_dynamic_model__test_field, NEW.select_record_from_dynamic_model__test_field, NEW.select_record_from_table_dynamic_model__test_field,
    NEW.user_id,
    NEW.created_at,
    NEW.updated_at,
    NEW.id;
  RETURN NEW;
END;
$$;


--
-- Name: log_test_model_b_embed_recs_update(); Type: FUNCTION; Schema: dynamic; Owner: -
--

CREATE FUNCTION dynamic.log_test_model_b_embed_recs_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO test_model_b_embed_rec_history (
    master_id,
    street_address, city,
    user_id,
    created_at,
    updated_at,
    test_model_b_embed_rec_id)
  SELECT
    NEW.master_id,
    NEW.street_address, NEW.city,
    NEW.user_id,
    NEW.created_at,
    NEW.updated_at,
    NEW.id;
  RETURN NEW;
END;
$$;


--
-- Name: log_test_model_b_embeds_update(); Type: FUNCTION; Schema: dynamic; Owner: -
--

CREATE FUNCTION dynamic.log_test_model_b_embeds_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO test_model_b_embed_history (
    master_id,
    first_name, last_name, embed_resource_name, embed_resource_id,
    user_id,
    created_at,
    updated_at,
    test_model_b_embed_id)
  SELECT
    NEW.master_id,
    NEW.first_name, NEW.last_name, NEW.embed_resource_name, NEW.embed_resource_id,
    NEW.user_id,
    NEW.created_at,
    NEW.updated_at,
    NEW.id;
  RETURN NEW;
END;
$$;


--
-- Name: log_test_model_c_embed_recs_update(); Type: FUNCTION; Schema: dynamic; Owner: -
--

CREATE FUNCTION dynamic.log_test_model_c_embed_recs_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO test_model_c_embed_rec_history (
    master_id,
    street_address, city, test_model_c_embed_id,
    user_id,
    created_at,
    updated_at,
    test_model_c_embed_rec_id)
  SELECT
    NEW.master_id,
    NEW.street_address, NEW.city, NEW.test_model_c_embed_id,
    NEW.user_id,
    NEW.created_at,
    NEW.updated_at,
    NEW.id;
  RETURN NEW;
END;
$$;


--
-- Name: log_test_model_c_embeds_update(); Type: FUNCTION; Schema: dynamic; Owner: -
--

CREATE FUNCTION dynamic.log_test_model_c_embeds_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO test_model_c_embed_history (
    master_id,
    first_name, last_name,
    user_id,
    created_at,
    updated_at,
    test_model_c_embed_id)
  SELECT
    NEW.master_id,
    NEW.first_name, NEW.last_name,
    NEW.user_id,
    NEW.created_at,
    NEW.updated_at,
    NEW.id;
  RETURN NEW;
END;
$$;


--
-- Name: log_test_model_embed_recs_update(); Type: FUNCTION; Schema: dynamic; Owner: -
--

CREATE FUNCTION dynamic.log_test_model_embed_recs_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO test_model_embed_rec_history (
    master_id,
    street_address, city, test_model_embed_id,
    user_id,
    created_at,
    updated_at,
    test_model_embed_rec_id)
  SELECT
    NEW.master_id,
    NEW.street_address, NEW.city, NEW.test_model_embed_id,
    NEW.user_id,
    NEW.created_at,
    NEW.updated_at,
    NEW.id;
  RETURN NEW;
END;
$$;


--
-- Name: log_test_model_embeds_update(); Type: FUNCTION; Schema: dynamic; Owner: -
--

CREATE FUNCTION dynamic.log_test_model_embeds_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO test_model_embed_history (
    master_id,
    first_name, last_name,
    user_id,
    created_at,
    updated_at,
    test_model_embed_id)
  SELECT
    NEW.master_id,
    NEW.first_name, NEW.last_name,
    NEW.user_id,
    NEW.created_at,
    NEW.updated_at,
    NEW.id;
  RETURN NEW;
END;
$$;


--
-- Name: log_test_references_update(); Type: FUNCTION; Schema: dynamic; Owner: -
--

CREATE FUNCTION dynamic.log_test_references_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO test_reference_history (
    master_id,
    first_name, last_name,
    user_id,
    created_at,
    updated_at,
    test_reference_id)
  SELECT
    NEW.master_id,
    NEW.first_name, NEW.last_name,
    NEW.user_id,
    NEW.created_at,
    NEW.updated_at,
    NEW.id;
  RETURN NEW;
END;
$$;


--
-- Name: log_test_refs_update(); Type: FUNCTION; Schema: dynamic; Owner: -
--

CREATE FUNCTION dynamic.log_test_refs_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO test_ref_history (
    
    test1,
    user_id,
    created_at,
    updated_at,
    test_ref_id)
  SELECT
    
    NEW.test1,
    NEW.user_id,
    NEW.created_at,
    NEW.updated_at,
    NEW.id;
  RETURN NEW;
END;
$$;


--
-- Name: log_test_times_update(); Type: FUNCTION; Schema: dynamic; Owner: -
--

CREATE FUNCTION dynamic.log_test_times_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO test_time_history (
    
    test_time, test2_time, test_date, timezone,
    user_id,
    created_at,
    updated_at,
    test_time_id)
  SELECT
    
    NEW.test_time, NEW.test2_time, NEW.test_date, NEW.timezone,
    NEW.user_id,
    NEW.created_at,
    NEW.updated_at,
    NEW.id;
  RETURN NEW;
END;
$$;


--
-- Name: log_tests_update(); Type: FUNCTION; Schema: dynamic; Owner: -
--

CREATE FUNCTION dynamic.log_tests_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO test_history (
    
    
    user_id,
    created_at,
    updated_at,
    test_id)
  SELECT
    
    
    NEW.user_id,
    NEW.created_at,
    NEW.updated_at,
    NEW.id;
  RETURN NEW;
END;
$$;


--
-- Name: log_grit_assignments_update(); Type: FUNCTION; Schema: extra_app; Owner: -
--

CREATE FUNCTION extra_app.log_grit_assignments_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO grit_assignment_history (
    master_id,
    grit_id,
    user_id,
    admin_id,
    created_at,
    updated_at,
    grit_assignment_table_id)
  SELECT
    NEW.master_id,
    NEW.grit_id,
    NEW.user_id,
    NEW.admin_id,
    NEW.created_at,
    NEW.updated_at,
    NEW.id;
  RETURN NEW;
END;
$$;


--
-- Name: log_pitt_bhi_assignments_update(); Type: FUNCTION; Schema: extra_app; Owner: -
--

CREATE FUNCTION extra_app.log_pitt_bhi_assignments_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO pitt_bhi_assignment_history (
    master_id,
    pitt_bhi_id,
    user_id,
    admin_id,
    created_at,
    updated_at,
    pitt_bhi_assignment_table_id)
  SELECT
    NEW.master_id,
    NEW.pitt_bhi_id,
    NEW.user_id,
    NEW.admin_id,
    NEW.created_at,
    NEW.updated_at,
    NEW.id;
  RETURN NEW;
END;
$$;


--
-- Name: log_sleep_assignments_update(); Type: FUNCTION; Schema: extra_app; Owner: -
--

CREATE FUNCTION extra_app.log_sleep_assignments_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO sleep_assignment_history (
    master_id,
    sleep_id,
    user_id,
    admin_id,
    created_at,
    updated_at,
    sleep_assignment_table_id)
  SELECT
    NEW.master_id,
    NEW.sleep_id,
    NEW.user_id,
    NEW.admin_id,
    NEW.created_at,
    NEW.updated_at,
    NEW.id;
  RETURN NEW;
END;
$$;


--
-- Name: add_study_update_entry(integer, character varying, character varying, date, character varying, integer, integer, character varying); Type: FUNCTION; Schema: ml_app; Owner: -
--

CREATE FUNCTION ml_app.add_study_update_entry(master_id integer, update_type character varying, update_name character varying, event_date date, update_notes character varying, user_id integer, item_id integer, item_type character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
        DECLARE
          new_tracker_id integer;
          protocol_record RECORD;
        BEGIN

          SELECT add_tracker_entry_by_name(master_id, 'Updates', 'record updates', (update_type || ' ' || update_name), event_date, update_notes, user_id, item_id, item_type) into new_tracker_id;
          /*
          SELECT p.id protocol_id, sp.id sub_process_id, pe.id protocol_event_id
          INTO protocol_record
          FROM protocol_events pe
          INNER JOIN sub_processes sp on pe.sub_process_id = sp.id
          INNER JOIN protocols p on sp.protocol_id = p.id
          WHERE p.name = 'Updates'
          AND sp.name = 'record updates'
          AND pe.name = (update_type || ' ' || update_name)
          AND (p.disabled IS NULL or p.disabled = FALSE) AND (sp.disabled IS NULL or sp.disabled = FALSE) AND (pe.disabled IS NULL or pe.disabled = FALSE);

          IF NOT FOUND THEN
            RAISE EXCEPTION 'Nonexistent protocol record --> %', (update_type || ' ' || update_name );
          ELSE

            INSERT INTO trackers
            (master_id, protocol_id, sub_process_id, protocol_event_id, item_type, item_id, user_id, event_date, updated_at, created_at, notes)
            VALUES
            (master_id, protocol_record.protocol_id, protocol_record.sub_process_id, protocol_record.protocol_event_id,
             item_type, item_id, user_id, now(), now(), now(), update_notes);

            RETURN new_tracker_id;
          END IF;
          */
          RETURN new_tracker_id;
        END;
    $$;


--
-- Name: add_tracker_entry_by_name(integer, character varying, character varying, character varying, character varying, integer, integer, character varying); Type: FUNCTION; Schema: ml_app; Owner: -
--

CREATE FUNCTION ml_app.add_tracker_entry_by_name(master_id integer, protocol_name character varying, sub_process_name character varying, protocol_event_name character varying, set_notes character varying, user_id integer, item_id integer, item_type character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
        DECLARE
          new_tracker_id integer;
          protocol_record RECORD;
        BEGIN


          SELECT p.id protocol_id, sp.id sub_process_id, pe.id protocol_event_id
          INTO protocol_record
          FROM protocol_events pe
          INNER JOIN sub_processes sp on pe.sub_process_id = sp.id
          INNER JOIN protocols p on sp.protocol_id = p.id
          WHERE p.name = protocol_name
          AND sp.name = sub_process_name
          AND pe.name = protocol_event_name
          AND (p.disabled IS NULL or p.disabled = FALSE) AND (sp.disabled IS NULL or sp.disabled = FALSE) AND (pe.disabled IS NULL or pe.disabled = FALSE);

          IF NOT FOUND THEN
            RAISE EXCEPTION 'Nonexistent protocol record --> %', (protocol_name || ' ' || sub_process_name || ' ' || protocol_event_name);
          ELSE

            INSERT INTO trackers
            (master_id, protocol_id, sub_process_id, protocol_event_id, item_type, item_id, user_id, event_date, updated_at, created_at, notes)
            VALUES
            (master_id, protocol_record.protocol_id, protocol_record.sub_process_id, protocol_record.protocol_event_id,
             item_type, item_id, user_id, now(), now(), now(), set_notes);

            RETURN new_tracker_id;
          END IF;

        END;
    $$;


--
-- Name: add_tracker_entry_by_name(integer, character varying, character varying, character varying, date, character varying, integer, integer, character varying); Type: FUNCTION; Schema: ml_app; Owner: -
--

CREATE FUNCTION ml_app.add_tracker_entry_by_name(master_id integer, protocol_name character varying, sub_process_name character varying, protocol_event_name character varying, event_date date, set_notes character varying, user_id integer, item_id integer, item_type character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
        DECLARE
          new_tracker_id integer;
          protocol_record RECORD;
        BEGIN


          SELECT p.id protocol_id, sp.id sub_process_id, pe.id protocol_event_id
          INTO protocol_record
          FROM protocol_events pe
          INNER JOIN sub_processes sp on pe.sub_process_id = sp.id
          INNER JOIN protocols p on sp.protocol_id = p.id
          WHERE lower(p.name) = lower(protocol_name)
          AND lower(sp.name) = lower(sub_process_name)
          AND lower(pe.name) = lower(protocol_event_name)
          AND (p.disabled IS NULL or p.disabled = FALSE) AND (sp.disabled IS NULL or sp.disabled = FALSE) AND (pe.disabled IS NULL or pe.disabled = FALSE);

          IF NOT FOUND THEN
            RAISE EXCEPTION 'Nonexistent protocol record --> %', (protocol_name || ' ' || sub_process_name || ' ' || protocol_event_name);
          ELSE

            INSERT INTO trackers
            (master_id, protocol_id, sub_process_id, protocol_event_id, item_type, item_id, user_id, event_date, updated_at, created_at, notes)
            VALUES
            (master_id, protocol_record.protocol_id, protocol_record.sub_process_id, protocol_record.protocol_event_id,
             item_type, item_id, user_id, now(), now(), now(), set_notes);

            RETURN new_tracker_id;
          END IF;

        END;
    $$;


--
-- Name: assign_sage_ids_to_players(); Type: FUNCTION; Schema: ml_app; Owner: -
--

CREATE FUNCTION ml_app.assign_sage_ids_to_players() RETURNS record
    LANGUAGE plpgsql
    AS $$
      DECLARE
        min_sa integer;
        max_sa integer;
        res record;
      BEGIN


        -- update the precreated Sage ID records with the master_id from the player info, based on matching ID.

        -- apply an offset here if the Sage ID does not start at zero

        -- find the first unassigned Sage ID

        select min(id) into min_sa from sage_assignments where master_id is null;

        -- update the sage assignments in a block starting from the minimum unassigned ID

        update sage_assignments sa set master_id = (select master_id from temp_pit where id = sa.id - min_sa) where sa.master_id is null and sa.id >= min_sa;

        -- get the max value to return the results

        select max(id) into max_sa from sage_assignments where master_id is not null;

        select min_sa, max_sa into res;

        return res;


       END;

    $$;


--
-- Name: create_message_notification_email(character varying, character varying, character varying, json, character varying[], character varying, timestamp without time zone); Type: FUNCTION; Schema: ml_app; Owner: -
--

CREATE FUNCTION ml_app.create_message_notification_email(layout_template_name character varying, content_template_name character varying, subject character varying, data json, recipient_emails character varying[], from_user_email character varying, run_at timestamp without time zone DEFAULT NULL::timestamp without time zone) RETURNS integer
    LANGUAGE plpgsql
    AS $$
    DECLARE
      last_id INTEGER;
    BEGIN

      IF run_at IS NULL THEN
        run_at := now();
      END IF;

      INSERT INTO ml_app.message_notifications
      (
        message_type,
        created_at,
        updated_at,
        layout_template_name,
        content_template_name,
        subject,
        data,
        recipient_emails,
        from_user_email
      )
      VALUES
      (
        'email',
        now(),
        now(),
        layout_template_name,
        content_template_name,
        subject,
        data,
        recipient_emails,
        from_user_email
      )
      RETURNING id
      INTO last_id
      ;

      SELECT create_message_notification_job(last_id, run_at)
      INTO last_id
      ;

      RETURN last_id;
    END;
    $$;


--
-- Name: create_message_notification_email(integer, integer, integer, character varying, integer, integer[], character varying, character varying, character varying, timestamp without time zone); Type: FUNCTION; Schema: ml_app; Owner: -
--

CREATE FUNCTION ml_app.create_message_notification_email(app_type_id integer, master_id integer, item_id integer, item_type character varying, user_id integer, recipient_user_ids integer[], layout_template_name character varying, content_template_name character varying, subject character varying, run_at timestamp without time zone DEFAULT NULL::timestamp without time zone) RETURNS integer
    LANGUAGE plpgsql
    AS $$
    DECLARE
      last_id INTEGER;
    BEGIN

      IF run_at IS NULL THEN
        run_at := now();
      END IF;

      INSERT INTO ml_app.message_notifications
      (
        subject,
        app_type_id,
        user_id,
        recipient_user_ids,
        layout_template_name,
        content_template_name,
        item_type,
        item_id,
        master_id,
        message_type,
        created_at,
        updated_at
      )
      VALUES
      (
        subject,
        app_type_id,
        user_id,
        recipient_user_ids,
        layout_template_name,
        content_template_name,
        item_type,
        item_id,
        master_id,
        'email',
        now(),
        now()
      )
      RETURNING id
      INTO last_id
      ;

      SELECT create_message_notification_job(last_id, run_at)
      INTO last_id
      ;

      RETURN last_id;
    END;
    $$;


--
-- Name: create_message_notification_job(integer, timestamp without time zone); Type: FUNCTION; Schema: ml_app; Owner: -
--

CREATE FUNCTION ml_app.create_message_notification_job(message_notification_id integer, run_at timestamp without time zone DEFAULT NULL::timestamp without time zone) RETURNS integer
    LANGUAGE plpgsql
    AS $$
    DECLARE
      last_id INTEGER;
    BEGIN

      IF run_at IS NULL THEN
        run_at := now();
      END IF;

      INSERT INTO ml_app.delayed_jobs
      (
        priority,
        attempts,
        handler,
        run_at,
        queue,
        created_at,
        updated_at
      )
      VALUES
      (
        0,
        0,
        '--- !ruby/object:ActiveJob::QueueAdapters::DelayedJobAdapter::JobWrapper
        job_data:
          job_class: HandleMessageNotificationJob
          job_id: ' || gen_random_uuid() || '
          queue_name: default
          arguments:
          - _aj_globalid: gid://fpa1/MessageNotification/' || message_notification_id::varchar || '
          locale: :en',
        run_at,
        'default',
        now(),
        now()
      )
      RETURNING id
      INTO last_id
      ;

    	RETURN last_id;
    END;
    $$;


--
-- Name: current_user_id(); Type: FUNCTION; Schema: ml_app; Owner: -
--

CREATE FUNCTION ml_app.current_user_id() RETURNS integer
    LANGUAGE plpgsql
    AS $$
      DECLARE
        user_id integer;
      BEGIN
        user_id := (select id from users where email = current_user limit 1);

        return user_id;
      END;
    $$;


--
-- Name: datadic_choice_history_upd(); Type: FUNCTION; Schema: ml_app; Owner: -
--

CREATE FUNCTION ml_app.datadic_choice_history_upd() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO ref_data.datadic_choice_history (
    source_name, source_type, form_name, field_name, value, label, redcap_data_dictionary_id,
    disabled,
    admin_id,
    created_at,
    updated_at,
    datadic_choice_id)
  SELECT
    NEW.source_name, NEW.source_type, NEW.form_name, NEW.field_name, NEW.value, NEW.label, NEW.redcap_data_dictionary_id,
    NEW.disabled,
    NEW.admin_id,
    NEW.created_at,
    NEW.updated_at,
    NEW.id;
  RETURN NEW;
END;
$$;


--
-- Name: datadic_variable_history_upd(); Type: FUNCTION; Schema: ml_app; Owner: -
--

CREATE FUNCTION ml_app.datadic_variable_history_upd() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO datadic_variable_history (
    study, source_name, source_type, domain, form_name, variable_name, variable_type, presentation_type, label, label_note, annotation, is_required, valid_type, valid_min, valid_max, multi_valid_choices, is_identifier, is_derived_var, multi_derived_from_id, doc_url, target_type, owner_email, classification, other_classification, multi_timepoints, equivalent_to_id, storage_type, db_or_fs, schema_or_path, table_or_file, storage_varname, redcap_data_dictionary_id, position, section_id, sub_section_id, title,
    disabled,
    admin_id,
    created_at,
    updated_at,
    datadic_variable_id)
  SELECT
    NEW.study, NEW.source_name, NEW.source_type, NEW.domain, NEW.form_name, NEW.variable_name, NEW.variable_type, NEW.presentation_type, NEW.label, NEW.label_note, NEW.annotation, NEW.is_required, NEW.valid_type, NEW.valid_min, NEW.valid_max, NEW.multi_valid_choices, NEW.is_identifier, NEW.is_derived_var, NEW.multi_derived_from_id, NEW.doc_url, NEW.target_type, NEW.owner_email, NEW.classification, NEW.other_classification, NEW.multi_timepoints, NEW.equivalent_to_id, NEW.storage_type, NEW.db_or_fs, NEW.schema_or_path, NEW.table_or_file, NEW.storage_varname, NEW.redcap_data_dictionary_id, NEW.position, NEW.section_id, NEW.sub_section_id, NEW.title,
    NEW.disabled,
    NEW.admin_id,
    NEW.created_at,
    NEW.updated_at,
    NEW.id;
  RETURN NEW;
END;
$$;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: nfs_store_archived_files; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.nfs_store_archived_files (
    id integer NOT NULL,
    file_hash character varying,
    file_name character varying NOT NULL,
    content_type character varying NOT NULL,
    archive_file character varying NOT NULL,
    path character varying NOT NULL,
    file_size bigint NOT NULL,
    file_updated_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    nfs_store_container_id integer,
    user_id integer,
    title character varying,
    description character varying,
    nfs_store_stored_file_id integer,
    file_metadata jsonb,
    embed_resource_name character varying,
    embed_resource_id bigint
);


--
-- Name: nfs_store_stored_files; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.nfs_store_stored_files (
    id integer NOT NULL,
    file_hash character varying NOT NULL,
    file_name character varying NOT NULL,
    content_type character varying NOT NULL,
    file_size bigint NOT NULL,
    path character varying,
    file_updated_at timestamp without time zone,
    user_id integer,
    nfs_store_container_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    title character varying,
    description character varying,
    last_process_name_run character varying,
    file_metadata jsonb,
    embed_resource_name character varying,
    embed_resource_id bigint
);


--
-- Name: filestore_report_file_path(ml_app.nfs_store_stored_files, ml_app.nfs_store_archived_files); Type: FUNCTION; Schema: ml_app; Owner: -
--

CREATE FUNCTION ml_app.filestore_report_file_path(sf ml_app.nfs_store_stored_files, af ml_app.nfs_store_archived_files) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
    BEGIN

      return CASE WHEN af.id IS NOT NULL THEN
        coalesce(sf.path, '') || '/' || sf.file_name || '/' || af.path
        ELSE sf.path
      END;

	END;
$$;


--
-- Name: filestore_report_full_file_path(ml_app.nfs_store_stored_files, ml_app.nfs_store_archived_files); Type: FUNCTION; Schema: ml_app; Owner: -
--

CREATE FUNCTION ml_app.filestore_report_full_file_path(sf ml_app.nfs_store_stored_files, af ml_app.nfs_store_archived_files) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
    BEGIN

      return CASE WHEN af.id IS NOT NULL THEN
        coalesce(sf.path, '') || '/' || sf.file_name || '/' || af.path || '/' || af.file_name
        ELSE coalesce(sf.path, '') || '/' || sf.file_name
      END;

	END;
$$;


--
-- Name: filestore_report_perform_action(integer, character varying, integer, ml_app.nfs_store_stored_files, ml_app.nfs_store_archived_files); Type: FUNCTION; Schema: ml_app; Owner: -
--

CREATE FUNCTION ml_app.filestore_report_perform_action(cid integer, altype character varying, alid integer, sf ml_app.nfs_store_stored_files, af ml_app.nfs_store_archived_files) RETURNS jsonb
    LANGUAGE plpgsql
    AS $$
	DECLARE
        jo jsonb;
        rt varchar;
        fn varchar;
        alt varchar;
    BEGIN

        rt := '"' || (CASE WHEN af.id IS NOT NULL THEN 'archived_file' ELSE 'stored_file' END) || '"';
        fn := '"' || (CASE WHEN af.id IS NOT NULL THEN af.file_name ELSE sf.file_name END) || '"';
		alt := '"' || altype || '"';
        jo := '{}';

        jo := jsonb_set(jo, '{perform_action}', '"/nfs_store/downloads/!container_id"');
        jo := jsonb_set(jo, '{container_id}', cid::varchar::jsonb);
        jo := jsonb_set(jo, '{download_id}', coalesce(af.id, sf.id)::varchar::jsonb);
        jo := jsonb_set(jo, '{activity_log_type}', alt::jsonb);
        jo := jsonb_set(jo, '{activity_log_id}', alid::varchar::jsonb);
        jo := jsonb_set(jo, '{retrieval_type}', rt::jsonb );
        jo := jsonb_set(jo, '{label}', fn::jsonb);

        return jo;

	END;
$$;


--
-- Name: filestore_report_select_fields(integer, character varying, integer, integer, integer); Type: FUNCTION; Schema: ml_app; Owner: -
--

CREATE FUNCTION ml_app.filestore_report_select_fields(cid integer, altype character varying, alid integer, sfid integer, afid integer) RETURNS jsonb
    LANGUAGE plpgsql
    AS $$
	DECLARE
        jo jsonb;
        joid jsonb;
        rt varchar;
        alt varchar;
    BEGIN

    	rt := '"' || CASE WHEN afid IS NOT NULL THEN 'archived_file' ELSE 'stored_file' END || '"';
    	alt := '"' || altype || '"';

        joid := '{}'::jsonb;
        joid := jsonb_set(joid, '{id}', coalesce(afid, sfid)::varchar::jsonb);
        joid := jsonb_set(joid, '{retrieval_type}', rt::jsonb );
        joid := jsonb_set(joid, '{container_id}', cid::varchar::jsonb);
        joid := jsonb_set(joid, '{activity_log_type}', alt::jsonb);
        joid := jsonb_set(joid, '{activity_log_id}', alid::varchar::jsonb);


    	jo := '{}'::jsonb;
  		jo := jsonb_set(jo, '{field_name}', '"nfs_store_download[selected_items][]"');
    	jo := jsonb_set(jo, '{value}', joid);
    	return jo;

	END;
$$;


--
-- Name: format_update_notes(character varying, character varying, character varying); Type: FUNCTION; Schema: ml_app; Owner: -
--

CREATE FUNCTION ml_app.format_update_notes(field_name character varying, old_val character varying, new_val character varying) RETURNS character varying
    LANGUAGE plpgsql
    AS $$
        DECLARE
          res VARCHAR;
        BEGIN
          res := '';
          old_val := lower(coalesce(old_val, '-')::varchar);
          new_val := lower(coalesce(new_val, '')::varchar);
          IF old_val <> new_val THEN
            res := field_name;
            IF old_val <> '-' THEN
              res := res || ' from ' || old_val ;
            END IF;
            res := res || ' to ' || new_val || '; ';
          END IF;
          RETURN res;
        END;
      $$;


--
-- Name: handle_address_update(); Type: FUNCTION; Schema: ml_app; Owner: -
--

CREATE FUNCTION ml_app.handle_address_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
        BEGIN

          NEW.street := lower(NEW.street);
          NEW.street2 := lower(NEW.street2);
          NEW.street3 := lower(NEW.street3);
          NEW.city := lower(NEW.city);
          NEW.state := lower(NEW.state);
          NEW.zip := lower(NEW.zip);
          NEW.country := lower(NEW.country);
          NEW.postal_code := lower(NEW.postal_code);
          NEW.region := lower(NEW.region);
          NEW.source := lower(NEW.source);
          RETURN NEW;

        END;
    $$;


--
-- Name: handle_delete(); Type: FUNCTION; Schema: ml_app; Owner: -
--

CREATE FUNCTION ml_app.handle_delete() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
      DECLARE
        latest_tracker tracker_history%ROWTYPE;
      BEGIN

        -- Find the most recent remaining item in tracker_history for the master/protocol pair,
        -- now that the target record has been deleted.
        -- tracker_id is the foreign key onto the trackers table master/protocol record.

        SELECT * INTO latest_tracker
          FROM tracker_history
          WHERE tracker_id = OLD.tracker_id
          ORDER BY event_date DESC NULLS last, updated_at DESC NULLS last LIMIT 1;

        IF NOT FOUND THEN
          -- No record was found in tracker_history for the master/protocol pair.
          -- Therefore there should be no corresponding trackers record either. Delete it.
          DELETE FROM trackers WHERE trackers.id = OLD.tracker_id;

        ELSE
          -- A record was found in tracker_history. Since it is the latest one for the master/protocol pair,
          -- just go ahead and update the corresponding record in trackers.
          UPDATE trackers
            SET
              event_date = latest_tracker.event_date,
              sub_process_id = latest_tracker.sub_process_id,
              protocol_event_id = latest_tracker.protocol_event_id,
              item_id = latest_tracker.item_id,
              item_type = latest_tracker.item_type,
              updated_at = latest_tracker.updated_at,
              notes = latest_tracker.notes,
              user_id = latest_tracker.user_id
            WHERE trackers.id = OLD.tracker_id;

        END IF;


        RETURN OLD;

      END
    $$;


--
-- Name: handle_player_contact_update(); Type: FUNCTION; Schema: ml_app; Owner: -
--

CREATE FUNCTION ml_app.handle_player_contact_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
        BEGIN


          NEW.rec_type := lower(NEW.rec_type);
          NEW.data := lower(NEW.data);
          NEW.source := lower(NEW.source);


          RETURN NEW;

        END;
    $$;


--
-- Name: handle_player_info_before_update(); Type: FUNCTION; Schema: ml_app; Owner: -
--

CREATE FUNCTION ml_app.handle_player_info_before_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
        BEGIN
          NEW.first_name := lower(NEW.first_name);
          NEW.last_name := lower(NEW.last_name);
          NEW.middle_name := lower(NEW.middle_name);
          NEW.nick_name := lower(NEW.nick_name);
          NEW.college := lower(NEW.college);
          NEW.source := lower(NEW.source);
          RETURN NEW;

        END;
    $$;


--
-- Name: handle_rc_cis_update(); Type: FUNCTION; Schema: ml_app; Owner: -
--

CREATE FUNCTION ml_app.handle_rc_cis_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
        DECLARE
          new_master_id integer;
          new_msid integer;
          updated_item_id integer;
          register_tracker boolean;
          update_notes VARCHAR;
          event_date DATE;
          track_p varchar;
          track_sp varchar;
          track_pe varchar;
          res_status varchar;

        BEGIN


          track_p := 'study';
          track_sp := 'CIS-received';
          track_pe := 'REDCap';

          register_tracker := FALSE;
          update_notes := '';
          res_status := NEW.status;

          event_date :=  NEW.time_stamp::date;

          IF coalesce(NEW.status,'') <> '' THEN

            IF NEW.status = 'create master' THEN

                IF NEW.master_id IS NOT NULL THEN
                  RAISE EXCEPTION 'Can not create a master when the master ID is already set. Review the linked Master record, or to create a new Master record clear the master_id first and try again.';
                END IF;


                SELECT MAX(msid) + 1 INTO new_msid FROM masters;

                INSERT INTO masters
                  (msid, created_at, updated_at, user_id)
                  VALUES
                  (new_msid, now(), now(), NEW.user_id)
                  RETURNING id INTO new_master_id;

                INSERT INTO player_infos
                  (master_id, first_name, last_name, source, created_at, updated_at, user_id)
                  VALUES
                  (new_master_id, NEW.first_name, NEW.last_name, 'cis-redcap', now(), now(), NEW.user_id);

                register_tracker := TRUE;

            ELSE
                SELECT id INTO new_master_id FROM masters WHERE id = NEW.master_id;
            END IF;

            IF NEW.status = 'update name' OR NEW.status = 'update all' OR NEW.status = 'create master' THEN
                IF new_master_id IS NULL THEN
                  RAISE EXCEPTION 'Must set a master ID to %', NEW.status;
                END IF;


                SELECT format_update_notes('first name', first_name, NEW.first_name) ||
                  format_update_notes('last name', last_name, NEW.last_name) ||
                  format_update_notes('middle name', middle_name, NEW.middle_name) ||
                  format_update_notes('nick name', nick_name, NEW.nick_name)
                INTO update_notes
                FROM player_infos
                WHERE master_id = new_master_id order by rank desc limit 1;

                UPDATE player_infos SET
                  master_id = new_master_id, first_name = NEW.first_name, last_name = NEW.last_name,
                  middle_name = NEW.middle_name, nick_name = NEW.nick_name,
                  source = 'cis-redcap', created_at = now(), updated_at = now(), user_id = NEW.user_id
                  WHERE master_id = new_master_id
                  RETURNING id INTO updated_item_id;


                PERFORM add_study_update_entry(new_master_id, 'updated', 'player info', event_date, update_notes, NEW.user_id, updated_item_id, 'PlayerInfo');

                register_tracker := TRUE;
                res_status := 'updated name';
            END IF;

            IF NEW.status = 'update address' OR NEW.status = 'update all' OR NEW.status = 'create master' THEN
                IF new_master_id IS NULL THEN
                  RAISE EXCEPTION 'Must set a master ID to %', NEW.status;
                END IF;

                IF NEW.street IS NOT NULL AND trim(NEW.street) <> '' OR
                    NEW.state IS NOT NULL AND trim(NEW.state) <> '' OR
                    NEW.zipcode IS NOT NULL AND trim(NEW.zipcode) <> '' THEN

                  SELECT format_update_notes('street', NULL, NEW.street) ||
                    format_update_notes('street2', NULL, NEW.street2) ||
                    format_update_notes('city', NULL, NEW.city) ||
                    format_update_notes('state', NULL, NEW.state) ||
                    format_update_notes('zip', NULL, NEW.zipcode)
                  INTO update_notes;
                  -- FROM addresses
                  -- WHERE master_id = new_master_id;



                  INSERT INTO addresses
                    (master_id, street, street2, city, state, zip, source, rank, created_at, updated_at, user_id)
                    VALUES
                    (new_master_id, NEW.street, NEW.street2, NEW.city, NEW.state, NEW.zipcode, 'cis-redcap', 10, now(), now(), NEW.user_id)
                    RETURNING id INTO updated_item_id;

                  PERFORM update_address_ranks(new_master_id);
                  PERFORM add_study_update_entry(new_master_id, 'updated', 'address', event_date, update_notes, NEW.user_id, updated_item_id, 'Address');

                  register_tracker := TRUE;
                  res_status := 'updated address';
                ELSE
                  res_status := 'address not updated - details blank';
                END IF;


            END IF;

            IF NEW.status = 'update email' OR NEW.status = 'update all' OR NEW.status = 'create master' THEN

                IF new_master_id IS NULL THEN
                  RAISE EXCEPTION 'Must set a master ID to %', NEW.status;
                END IF;

                IF NEW.email IS NOT NULL AND trim(NEW.email) <> '' THEN

                  SELECT format_update_notes('data', NULL, NEW.email)
                  INTO update_notes;


                  INSERT INTO player_contacts
                    (master_id, data, rec_type, source, rank, created_at, updated_at, user_id)
                    VALUES
                    (new_master_id, NEW.email, 'email', 'cis-redcap', 10, now(), now(), NEW.user_id)
                    RETURNING id INTO updated_item_id;


                  PERFORM update_player_contact_ranks(new_master_id, 'email');
                  PERFORM add_study_update_entry(new_master_id, 'updated', 'player contact', event_date, update_notes, NEW.user_id, updated_item_id, 'PlayerContact');

                  register_tracker := TRUE;
                  res_status := 'updated email';
                ELSE
                  res_status := 'email not updated - details blank';
                END IF;
            END IF;

            IF NEW.status = 'update phone' OR NEW.status = 'update all' OR NEW.status = 'create master' THEN
                IF new_master_id IS NULL THEN
                  RAISE EXCEPTION 'Must set a master ID to %', NEW.status;
                END IF;

                IF NEW.phone IS NOT NULL AND trim(NEW.phone) <> '' THEN

                  SELECT format_update_notes('data', NULL, NEW.phone)
                  INTO update_notes;

                  INSERT INTO player_contacts
                    (master_id, data, rec_type, source, rank, created_at, updated_at, user_id)
                    VALUES
                    (new_master_id, NEW.phone, 'phone', 'cis-redcap', 10, now(), now(), NEW.user_id)
                    RETURNING id INTO updated_item_id;

                  PERFORM update_player_contact_ranks(new_master_id, 'phone');
                  PERFORM add_study_update_entry(new_master_id, 'updated', 'player contact', event_date, update_notes, NEW.user_id, updated_item_id, 'PlayerContact');

                  register_tracker := TRUE;
                  res_status := 'updated phone';
                ELSE
                  res_status := 'phone not updated - details blank';
                END IF;
            END IF;


            CASE
              WHEN NEW.status = 'create master' THEN
                res_status := 'created master';
              WHEN NEW.status = 'update all' THEN
                res_status := 'updated all';
              ELSE
            END CASE;

            -- the master_id was set and an action performed. Register the tracker event
            IF coalesce(NEW.added_tracker, FALSE) = FALSE AND new_master_id IS NOT NULL AND register_tracker THEN
              PERFORM add_tracker_entry_by_name(new_master_id, track_p, track_sp, track_pe, OLD.time_stamp::date, ('Heard about: ' || coalesce(OLD.hearabout, '(not set)') || E'
Submitted by REDCap ID '|| OLD.redcap_survey_identifier), NEW.user_id, NULL, NULL);
              NEW.added_tracker = TRUE;
            END IF;

            NEW.master_id := new_master_id;
            NEW.updated_at := now();
            NEW.status := res_status;

          END IF;

          RETURN NEW;

        END;
    $$;


--
-- Name: handle_tracker_history_update(); Type: FUNCTION; Schema: ml_app; Owner: -
--

CREATE FUNCTION ml_app.handle_tracker_history_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    BEGIN

      DELETE FROM tracker_history WHERE id = OLD.id;

      INSERT INTO trackers
        (master_id, protocol_id,
         protocol_event_id, event_date, sub_process_id, notes,
         item_id, item_type,
         created_at, updated_at, user_id)

        SELECT NEW.master_id, NEW.protocol_id,
           NEW.protocol_event_id, NEW.event_date,
           NEW.sub_process_id, NEW.notes,
           NEW.item_id, NEW.item_type,
           NEW.created_at, NEW.updated_at, NEW.user_id  ;

      RETURN NULL;
    END;
    $$;


--
-- Name: log_accuracy_score_update(); Type: FUNCTION; Schema: ml_app; Owner: -
--

CREATE FUNCTION ml_app.log_accuracy_score_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
        BEGIN
            INSERT INTO accuracy_score_history
            (
                    accuracy_score_id,
                    name ,
                    value ,
                    created_at ,
                    updated_at ,
                    disabled ,
                    admin_id
                )
            SELECT
                NEW.id,
                NEW.name ,
                    NEW.value ,
                    NEW.created_at ,
                    NEW.updated_at ,
                    NEW.disabled ,
                    NEW.admin_id
            ;
            RETURN NEW;
        END;
    $$;


--
-- Name: log_activity_log_player_contact_phone_update(); Type: FUNCTION; Schema: ml_app; Owner: -
--

CREATE FUNCTION ml_app.log_activity_log_player_contact_phone_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
                BEGIN
                    INSERT INTO activity_log_player_contact_phone_history
                    (
                        master_id,
                        player_contact_id,
                        data,
                        select_call_direction,
                        select_who,
                        called_when,
                        select_result,
                        select_next_step,
                        follow_up_when,
                        notes,
                        protocol_id,
                        set_related_player_contact_rank,
                        extra_log_type,
                        user_id,
                        created_at,
                        updated_at,
                        activity_log_player_contact_phone_id
                        )
                    SELECT
                        NEW.master_id,
                        NEW.player_contact_id,
                        NEW.data,
                        NEW.select_call_direction,
                        NEW.select_who,
                        NEW.called_when,
                        NEW.select_result,
                        NEW.select_next_step,
                        NEW.follow_up_when,
                        NEW.notes,
                        NEW.protocol_id,
                        NEW.set_related_player_contact_rank,
                        NEW.extra_log_type,
                        NEW.user_id,
                        NEW.created_at,
                        NEW.updated_at,
                        NEW.id
                    ;
                    RETURN NEW;
                END;
            $$;


--
-- Name: log_activity_log_update(); Type: FUNCTION; Schema: ml_app; Owner: -
--

CREATE FUNCTION ml_app.log_activity_log_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
        BEGIN
            INSERT INTO activity_log_history
            (
                name,
                activity_log_id,
                admin_id,
                created_at,
                updated_at,
                item_type,
                rec_type,
                disabled,
                action_when_attribute,
                field_list,
                blank_log_field_list,
                blank_log_name,
                extra_log_types,
                hide_item_list_panel,
                main_log_name,
                process_name,
                table_name,
                category,
                schema_name
                )
            SELECT
                NEW.name,
                NEW.id,
                NEW.admin_id,
                NEW.created_at,
                NEW.updated_at,
                NEW.item_type,
                NEW.rec_type,
                NEW.disabled,
                NEW.action_when_attribute,
                NEW.field_list,
                NEW.blank_log_field_list,
                NEW.blank_log_name,
                NEW.extra_log_types,
                NEW.hide_item_list_panel,
                NEW.main_log_name,
                NEW.process_name,
                NEW.table_name,
                NEW.category,
                NEW.schema_name
            ;
            RETURN NEW;
        END;
    $$;


--
-- Name: log_address_update(); Type: FUNCTION; Schema: ml_app; Owner: -
--

CREATE FUNCTION ml_app.log_address_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
        BEGIN
            INSERT INTO address_history
                (
                    master_id,
                    street,
                    street2,
                    street3,
                    city,
                    state,
                    zip,
                    source,
                    rank,
                    rec_type,
                    user_id,
                    created_at,
                    updated_at,
                    country,
                    postal_code,
                    region,
                    address_id
                )

            SELECT
                NEW.master_id,
                NEW.street,
                NEW.street2,
                NEW.street3,
                NEW.city,
                NEW.state,
                NEW.zip,
                NEW.source,
                NEW.rank,
                NEW.rec_type,
                NEW.user_id,
                NEW.created_at,
                NEW.updated_at,
                NEW.country,
                NEW.postal_code,
                NEW.region,
                NEW.id
            ;
            RETURN NEW;
        END;
    $$;


--
-- Name: log_admin_update(); Type: FUNCTION; Schema: ml_app; Owner: -
--

CREATE FUNCTION ml_app.log_admin_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    BEGIN
      INSERT INTO admin_history
      (
        admin_id,
        email,
        encrypted_password,
        sign_in_count,
        current_sign_in_at,
        last_sign_in_at,
        current_sign_in_ip ,
        last_sign_in_ip ,
        created_at ,
        updated_at,
        failed_attempts,
        unlock_token,
        locked_at,
        disabled,
        encrypted_otp_secret,
        encrypted_otp_secret_iv,
        encrypted_otp_secret_salt,
        consumed_timestep,
        otp_required_for_login,
        reset_password_sent_at,
        password_updated_at,
        updated_by_admin_id

      )
      SELECT
        NEW.id,
        NEW.email,
        NEW.encrypted_password,
        NEW.sign_in_count,
        NEW.current_sign_in_at,
        NEW.last_sign_in_at,
        NEW.current_sign_in_ip ,
        NEW.last_sign_in_ip ,
        NEW.created_at ,
        NEW.updated_at,
        NEW.failed_attempts,
        NEW.unlock_token,
        NEW.locked_at,
        NEW.disabled,
        NEW.encrypted_otp_secret,
        NEW.encrypted_otp_secret_iv,
        NEW.encrypted_otp_secret_salt,
        NEW.consumed_timestep,
        NEW.otp_required_for_login,
        NEW.reset_password_sent_at,
        NEW.password_updated_at,
        NEW.admin_id
        ;
        RETURN NEW;
    END;
    $$;


--
-- Name: log_app_configuration_update(); Type: FUNCTION; Schema: ml_app; Owner: -
--

CREATE FUNCTION ml_app.log_app_configuration_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
              BEGIN
                  INSERT INTO app_configuration_history
                  (
                      name,
                      value,
                      app_type_id,
                      user_id,
                      role_name,
                      admin_id,
                      disabled,
                      created_at,
                      updated_at,
                      app_configuration_id
                      )
                  SELECT
                      NEW.name,
                      NEW.value,
                      NEW.app_type_id,
                      NEW.user_id,
                      NEW.role_name,
                      NEW.admin_id,
                      NEW.disabled,
                      NEW.created_at,
                      NEW.updated_at,
                      NEW.id
                  ;
                  RETURN NEW;
              END;
          $$;


--
-- Name: log_app_type_update(); Type: FUNCTION; Schema: ml_app; Owner: -
--

CREATE FUNCTION ml_app.log_app_type_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
             BEGIN
                 INSERT INTO app_type_history
                 (
                     name,
                     label,
                     admin_id,
                     disabled,
                     created_at,
                     updated_at,
                     app_type_id
                     )
                 SELECT
                     NEW.name,
                     NEW.label,
                     NEW.admin_id,
                     NEW.disabled,
                     NEW.created_at,
                     NEW.updated_at,
                     NEW.id
                 ;
                 RETURN NEW;
             END;
         $$;


--
-- Name: log_college_update(); Type: FUNCTION; Schema: ml_app; Owner: -
--

CREATE FUNCTION ml_app.log_college_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
        BEGIN
            INSERT INTO college_history
            (
                    college_id,
                    name ,
                    synonym_for_id,
                    created_at ,
                    updated_at ,
                    disabled ,
                    admin_id,
                    user_id
                )
            SELECT
                NEW.id,
                NEW.name ,
                    NEW.synonym_for_id ,
                    NEW.created_at ,
                    NEW.updated_at ,
                    NEW.disabled ,
                    NEW.admin_id,
                    NEW.user_id
            ;
            RETURN NEW;
        END;
    $$;


--
-- Name: log_config_library_update(); Type: FUNCTION; Schema: ml_app; Owner: -
--

CREATE FUNCTION ml_app.log_config_library_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
        BEGIN
            INSERT INTO config_library_history
            (
                    config_library_id,
                    category,
                    name,
                    options,
                    format,
                    disabled,
                    admin_id,
                    updated_at,
                    created_at
                )
            SELECT
                NEW.id,
                NEW.category,
                NEW.name,
                NEW.options,
                NEW.format,
                NEW.disabled,
                NEW.admin_id,
                NEW.updated_at,
                NEW.created_at
            ;
            RETURN NEW;
        END;
    $$;


--
-- Name: log_dynamic_model_update(); Type: FUNCTION; Schema: ml_app; Owner: -
--

CREATE FUNCTION ml_app.log_dynamic_model_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
            BEGIN
                INSERT INTO dynamic_model_history
                (
                    name,
                    table_name,
                    schema_name,
                    primary_key_name,
                    foreign_key_name,
                    description,
                    position,
                    category,
                    table_key_name,
                    field_list,
                    result_order,
                    options,
                    admin_id,
                    disabled,
                    created_at,
                    updated_at,
                    dynamic_model_id
                    )
                SELECT
                    NEW.name,
                    NEW.table_name,
                    NEW.schema_name,
                    NEW.primary_key_name,
                    NEW.foreign_key_name,
                    NEW.description,
                    NEW.position,
                    NEW.category,
                    NEW.table_key_name,
                    NEW.field_list,
                    NEW.result_order,
                    NEW.options,
                    NEW.admin_id,
                    NEW.disabled,
                    NEW.created_at,
                    NEW.updated_at,
                    NEW.id
                ;
                RETURN NEW;
            END;
        $$;


--
-- Name: log_external_identifier_update(); Type: FUNCTION; Schema: ml_app; Owner: -
--

CREATE FUNCTION ml_app.log_external_identifier_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
      BEGIN
          INSERT INTO external_identifier_history
          (
              name,
              label,
              external_id_attribute,
              external_id_view_formatter,
              external_id_edit_pattern,
              prevent_edit,
              pregenerate_ids,
              min_id,
              max_id,
              alphanumeric,
              extra_fields,
              admin_id,
              disabled,
              created_at,
              updated_at,
              external_identifier_id,
              schema_name,
              options
              )
          SELECT
              NEW.name,
              NEW.label,
              NEW.external_id_attribute,
              NEW.external_id_view_formatter,
              NEW.external_id_edit_pattern,
              NEW.prevent_edit,
              NEW.pregenerate_ids,
              NEW.min_id,
              NEW.max_id,
              NEW.alphanumeric,
              NEW.extra_fields,
              NEW.admin_id,
              NEW.disabled,
              NEW.created_at,
              NEW.updated_at,
              NEW.id,
              NEW.schema_name,
              NEW.options
          ;
          RETURN NEW;
      END;
  $$;


--
-- Name: log_external_link_update(); Type: FUNCTION; Schema: ml_app; Owner: -
--

CREATE FUNCTION ml_app.log_external_link_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
        BEGIN
            INSERT INTO external_link_history
            (
                    external_link_id,
                    name,
                    value,
                    admin_id,
                    disabled,
                    created_at,
                    updated_at
                )
            SELECT
                NEW.id,
                NEW.name,
                    NEW.value,
                    NEW.admin_id,
                    NEW.disabled,
                    NEW.created_at,
                    NEW.updated_at
            ;
            RETURN NEW;
        END;
    $$;


--
-- Name: log_general_selection_update(); Type: FUNCTION; Schema: ml_app; Owner: -
--

CREATE FUNCTION ml_app.log_general_selection_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
        BEGIN
            INSERT INTO general_selection_history
            (
                    general_selection_id,
                    name ,
                    value ,
                    item_type ,
                    created_at ,
                    updated_at ,
                    disabled ,
                    admin_id ,
                    create_with ,
                    edit_if_set ,
                    edit_always ,
                    position ,
                    description ,
                    lock
                )
            SELECT
                NEW.id,
                NEW.name ,
                NEW.value ,
                NEW.item_type ,
                NEW.created_at ,
                NEW.updated_at ,
                NEW.disabled ,
                NEW.admin_id ,
                NEW.create_with ,
                NEW.edit_if_set ,
                NEW.edit_always ,
                NEW.position "position",
                NEW.description ,
                NEW.lock
            ;
            RETURN NEW;
        END;
    $$;


--
-- Name: log_item_flag_name_update(); Type: FUNCTION; Schema: ml_app; Owner: -
--

CREATE FUNCTION ml_app.log_item_flag_name_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
        BEGIN
            INSERT INTO item_flag_name_history
            (
                    item_flag_name_id,
                    name ,
                    item_type,
                    created_at ,
                    updated_at ,
                    disabled ,
                    admin_id
                )
            SELECT
                NEW.id,
                NEW.name ,
                    NEW.item_type ,
                    NEW.created_at ,
                    NEW.updated_at ,
                    NEW.disabled ,
                    NEW.admin_id
            ;
            RETURN NEW;
        END;
    $$;


--
-- Name: log_item_flag_update(); Type: FUNCTION; Schema: ml_app; Owner: -
--

CREATE FUNCTION ml_app.log_item_flag_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
        BEGIN
            INSERT INTO item_flag_history
            (
                    item_flag_id,
                    item_id ,
                    item_type,
                    item_flag_name_id,
                    created_at ,
                    updated_at ,
                    user_id ,
                    disabled
                )
            SELECT
                NEW.id,
                NEW.item_id ,
                    NEW.item_type,
                    NEW.item_flag_name_id,
                    NEW.created_at ,
                    NEW.updated_at ,
                    NEW.user_id ,
                    NEW.disabled
            ;
            RETURN NEW;
        END;
    $$;


--
-- Name: log_message_template_update(); Type: FUNCTION; Schema: ml_app; Owner: -
--

CREATE FUNCTION ml_app.log_message_template_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
                  BEGIN
                      INSERT INTO message_template_history
                      (
                          name,
                          template_type,
                          message_type,
                          template,
                          category,
                          admin_id,
                          disabled,
                          created_at,
                          updated_at,
                          message_template_id
                          )
                      SELECT
                          NEW.name,
                          NEW.template_type,
                          NEW.message_type,
                          NEW.template,
                          NEW.category,
                          NEW.admin_id,
                          NEW.disabled,
                          NEW.created_at,
                          NEW.updated_at,
                          NEW.id
                      ;
                      RETURN NEW;
                  END;
              $$;


--
-- Name: log_nfs_store_archived_file_update(); Type: FUNCTION; Schema: ml_app; Owner: -
--

CREATE FUNCTION ml_app.log_nfs_store_archived_file_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
        BEGIN
            INSERT INTO nfs_store_archived_file_history
            (
                file_hash,
                file_name,
                content_type,
                archive_file,
                path,
                file_size,
                file_updated_at,
                nfs_store_container_id,
                title,
                description,
                file_metadata,
                nfs_store_stored_file_id,
                user_id,
                created_at,
                updated_at,
                nfs_store_archived_file_id,
                embed_resource_name,
                embed_resource_id
                )
            SELECT
                NEW.file_hash,
                NEW.file_name,
                NEW.content_type,
                NEW.archive_file,
                NEW.path,
                NEW.file_size,
                NEW.file_updated_at,
                NEW.nfs_store_container_id,
                NEW.title,
                NEW.description,
                NEW.file_metadata,
                NEW.nfs_store_stored_file_id,
                NEW.user_id,
                NEW.created_at,
                NEW.updated_at,
                NEW.id,
                NEW.embed_resource_name,
                NEW.embed_resource_id
            ;
            RETURN NEW;
        END;
    $$;


--
-- Name: log_nfs_store_container_update(); Type: FUNCTION; Schema: ml_app; Owner: -
--

CREATE FUNCTION ml_app.log_nfs_store_container_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
        BEGIN
            INSERT INTO nfs_store_container_history
            (
                master_id,
                name,
                app_type_id,
                orig_nfs_store_container_id,
                created_by_user_id,
                user_id,
                created_at,
                updated_at,
                nfs_store_container_id
                )
            SELECT
                NEW.master_id,
                NEW.name,
                NEW.app_type_id,
                NEW.nfs_store_container_id,
                NEW.created_by_user_id,
                NEW.user_id,
                NEW.created_at,
                NEW.updated_at,
                NEW.id
            ;
            RETURN NEW;
        END;
    $$;


--
-- Name: log_nfs_store_filter_update(); Type: FUNCTION; Schema: ml_app; Owner: -
--

CREATE FUNCTION ml_app.log_nfs_store_filter_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
        BEGIN
            INSERT INTO nfs_store_filter_history
            (
                app_type_id,
                role_name,
                user_id,
                resource_name,
                filter,
                description,
                admin_id,
                disabled,
                created_at,
                updated_at,
                nfs_store_filter_id
                )
            SELECT
                NEW.app_type_id,
                NEW.role_name,
                NEW.user_id,
                NEW.resource_name,
                NEW.filter,
                NEW.description,
                NEW.admin_id,
                NEW.disabled,
                NEW.created_at,
                NEW.updated_at,
                NEW.id
            ;
            RETURN NEW;
        END;
    $$;


--
-- Name: log_nfs_store_stored_file_update(); Type: FUNCTION; Schema: ml_app; Owner: -
--

CREATE FUNCTION ml_app.log_nfs_store_stored_file_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
        BEGIN
            INSERT INTO nfs_store_stored_file_history
            (
                file_hash,
                file_name,
                content_type,
                path,
                file_size,
                file_updated_at,
                nfs_store_container_id,
                title,
                description,
                file_metadata,
                last_process_name_run,
                user_id,
                created_at,
                updated_at,
                nfs_store_stored_file_id,
                embed_resource_name,
                embed_resource_id
                )
            SELECT
                NEW.file_hash,
                NEW.file_name,
                NEW.content_type,
                NEW.path,
                NEW.file_size,
                NEW.file_updated_at,
                NEW.nfs_store_container_id,
                NEW.title,
                NEW.description,
                NEW.file_metadata,
                NEW.last_process_name_run,
                NEW.user_id,
                NEW.created_at,
                NEW.updated_at,
                NEW.id,
                NEW.embed_resource_name,
                NEW.embed_resource_id
            ;
            RETURN NEW;
        END;
    $$;


--
-- Name: log_page_layout_update(); Type: FUNCTION; Schema: ml_app; Owner: -
--

CREATE FUNCTION ml_app.log_page_layout_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
          BEGIN
              INSERT INTO page_layout_history
              (
                      page_layout_id,
                      app_type_id,
                      layout_name,
                      panel_name,
                      panel_label,
                      panel_position,
                      options,
                      disabled,
                      admin_id,
                      created_at,
                      updated_at,
                      description
                  )
              SELECT
                  NEW.id,
                  NEW.app_type_id,
                  NEW.layout_name,
                  NEW.panel_name,
                  NEW.panel_label,
                  NEW.panel_position,
                  NEW.options,
                  NEW.disabled,
                  NEW.admin_id,
                  NEW.created_at,
                  NEW.updated_at,
                  NEW.description
              ;
              RETURN NEW;
          END;
      $$;


--
-- Name: log_player_contact_update(); Type: FUNCTION; Schema: ml_app; Owner: -
--

CREATE FUNCTION ml_app.log_player_contact_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
        BEGIN
            INSERT INTO player_contact_history
            (
                    player_contact_id,
                    master_id,
                    rec_type,
                    data,
                    source,
                    rank,
                    user_id,
                    created_at,
                    updated_at
                )
            SELECT
                NEW.id,
                NEW.master_id,
                NEW.rec_type,
                NEW.data,
                NEW.source,
                NEW.rank,
                NEW.user_id,
                NEW.created_at,
                NEW.updated_at
            ;
            RETURN NEW;
        END;
    $$;


--
-- Name: log_player_info_update(); Type: FUNCTION; Schema: ml_app; Owner: -
--

CREATE FUNCTION ml_app.log_player_info_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
        BEGIN
            INSERT INTO player_info_history
            (
                    master_id,
                    first_name,
                    last_name,
                    middle_name,
                    nick_name,
                    birth_date,
                    death_date,
                    user_id,
                    created_at,
                    updated_at,
                    contact_pref,
                    start_year,
                    rank,
                    notes,
                    contact_id,
                    college,
                    end_year,
                    source,
                    player_info_id
                )
            SELECT
                NEW.master_id,
                NEW.first_name,
                NEW.last_name,
                NEW.middle_name,
                NEW.nick_name,
                NEW.birth_date,
                NEW.death_date,
                NEW.user_id,
                NEW.created_at,
                NEW.updated_at,
                NEW.contact_pref,
                NEW.start_year,
                NEW.rank,
                NEW.notes,
                NEW.contact_id,
                NEW.college,
                NEW.end_year,
                NEW.source,
                NEW.id
            ;
            RETURN NEW;
        END;
    $$;


--
-- Name: log_protocol_event_update(); Type: FUNCTION; Schema: ml_app; Owner: -
--

CREATE FUNCTION ml_app.log_protocol_event_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
        BEGIN
            INSERT INTO protocol_event_history
            (
                    protocol_event_id,
    name ,
    admin_id,
    created_at,
    updated_at,
    disabled ,
    sub_process_id,
    milestone ,
    description

                )
            SELECT
                NEW.id,
                NEW.name ,
                    NEW.admin_id,
    NEW.created_at,
    NEW.updated_at,
    NEW.disabled ,
    NEW.sub_process_id,
    NEW.milestone ,
    NEW.description
            ;
            RETURN NEW;
        END;
    $$;


--
-- Name: log_protocol_update(); Type: FUNCTION; Schema: ml_app; Owner: -
--

CREATE FUNCTION ml_app.log_protocol_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
        BEGIN
            INSERT INTO protocol_history
            (
                    protocol_id,
                    name ,
                    created_at ,
                    updated_at ,
                    disabled,
                    admin_id ,
                    "position"
                )
            SELECT
                NEW.id,
                NEW.name ,
                    NEW.created_at ,
                    NEW.updated_at ,
                    NEW.disabled,
                    NEW.admin_id ,
                    NEW.position
            ;
            RETURN NEW;
        END;
    $$;


--
-- Name: log_report_update(); Type: FUNCTION; Schema: ml_app; Owner: -
--

CREATE FUNCTION ml_app.log_report_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
        BEGIN
            INSERT INTO report_history
            (
                    report_id,
                    name,
                    description,
                    sql,
                    search_attrs,
                    admin_id,
                    disabled,
                    report_type,
                    auto,
                    searchable,
                    position,
                    created_at,
                    updated_at,
                    edit_field_names,
                    selection_fields,
                    item_type,
                    short_name,
                    options
                )
            SELECT
                NEW.id,
                NEW.name,
                NEW.description,
                NEW.sql,
                NEW.search_attrs,
                NEW.admin_id,
                NEW.disabled,
                NEW.report_type,
                NEW.auto,
                NEW.searchable,
                NEW.position,
                NEW.created_at,
                NEW.updated_at,
                NEW.edit_field_names,
                NEW.selection_fields,
                NEW.item_type,
                NEW.short_name,
                NEW.options
            ;
            RETURN NEW;
        END;
    $$;


--
-- Name: log_scantron_update(); Type: FUNCTION; Schema: ml_app; Owner: -
--

CREATE FUNCTION ml_app.log_scantron_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
        BEGIN
            INSERT INTO scantron_history
            (
                master_id,
                scantron_id,
                user_id,
                created_at,
                updated_at,
                scantron_table_id
                )
            SELECT
                NEW.master_id,
                NEW.scantron_id,
                NEW.user_id,
                NEW.created_at,
                NEW.updated_at,
                NEW.id
            ;
            RETURN NEW;
        END;
    $$;


--
-- Name: log_sub_process_update(); Type: FUNCTION; Schema: ml_app; Owner: -
--

CREATE FUNCTION ml_app.log_sub_process_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
        BEGIN
            INSERT INTO sub_process_history
            (
                    sub_process_id,

    name,
    disabled,
    protocol_id,
    admin_id ,
    created_at,
    updated_at

                )
            SELECT
                NEW.id,
                NEW.name,
    NEW.disabled,
    NEW.protocol_id,
    NEW.admin_id ,
    NEW.created_at,
    NEW.updated_at
            ;
            RETURN NEW;
        END;
    $$;


--
-- Name: log_tracker_update(); Type: FUNCTION; Schema: ml_app; Owner: -
--

CREATE FUNCTION ml_app.log_tracker_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
        BEGIN

          -- Check to see if there is an existing record in tracker_history that matches the
          -- that inserted or updated in trackers.
          -- If there is, just skip the insert into tracker_history, otherwise make the insert happen.

          PERFORM * from tracker_history
            WHERE
              master_id = NEW.master_id
              AND protocol_id = NEW.protocol_id
              AND coalesce(protocol_event_id,-1) = coalesce(NEW.protocol_event_id,-1)
              AND coalesce(event_date, '1900-01-01'::date)::date = coalesce(NEW.event_date, '1900-01-01')::date
              AND sub_process_id = NEW.sub_process_id
              AND coalesce(notes,'') = coalesce(NEW.notes,'')
              AND coalesce(item_id,-1) = coalesce(NEW.item_id,-1)
              AND coalesce(item_type,'') = coalesce(NEW.item_type,'')
              -- do not check created_at --
              AND updated_at::timestamp = NEW.updated_at::timestamp
              AND coalesce(user_id,-1) = coalesce(NEW.user_id,-1);

            IF NOT FOUND THEN
              INSERT INTO tracker_history
                  (tracker_id, master_id, protocol_id,
                   protocol_event_id, event_date, sub_process_id, notes,
                   item_id, item_type,
                   created_at, updated_at, user_id)

                  SELECT NEW.id, NEW.master_id, NEW.protocol_id,
                     NEW.protocol_event_id, NEW.event_date,
                     NEW.sub_process_id, NEW.notes,
                     NEW.item_id, NEW.item_type,
                     NEW.created_at, NEW.updated_at, NEW.user_id  ;
            END IF;

            RETURN NEW;

        END;
    $$;


--
-- Name: log_user_access_control_update(); Type: FUNCTION; Schema: ml_app; Owner: -
--

CREATE FUNCTION ml_app.log_user_access_control_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
        BEGIN
            INSERT INTO user_access_control_history
            (
                user_id,
                resource_type,
                resource_name,
                options,
                access,
                app_type_id,
                role_name,
                admin_id,
                disabled,
                created_at,
                updated_at,
                user_access_control_id
                )
            SELECT
                NEW.user_id,
                NEW.resource_type,
                NEW.resource_name,
                NEW.options,
                NEW.access,
                NEW.app_type_id,
                NEW.role_name,
                NEW.admin_id,
                NEW.disabled,
                NEW.created_at,
                NEW.updated_at,
                NEW.id
            ;
            RETURN NEW;
        END;
    $$;


--
-- Name: log_user_authorization_update(); Type: FUNCTION; Schema: ml_app; Owner: -
--

CREATE FUNCTION ml_app.log_user_authorization_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
        BEGIN
            INSERT INTO user_authorization_history
            (
                    user_authorization_id,
                    user_id,
                    has_authorization,
                    admin_id,
                    disabled,
                    created_at,
                    updated_at
                )
            SELECT
                NEW.id,
                NEW.user_id,
                NEW.has_authorization,
                NEW.admin_id,
                NEW.disabled,
                NEW.created_at,
                NEW.updated_at
            ;
            RETURN NEW;
        END;
    $$;


--
-- Name: log_user_role_update(); Type: FUNCTION; Schema: ml_app; Owner: -
--

CREATE FUNCTION ml_app.log_user_role_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
        BEGIN
            INSERT INTO user_role_history
            (
                app_type_id,
                role_name,
                user_id,
                admin_id,
                disabled,
                created_at,
                updated_at,
                user_role_id
                )
            SELECT
                NEW.app_type_id,
                NEW.role_name,
                NEW.user_id,
                NEW.admin_id,
                NEW.disabled,
                NEW.created_at,
                NEW.updated_at,
                NEW.id
            ;
            RETURN NEW;
        END;
    $$;


--
-- Name: log_user_update(); Type: FUNCTION; Schema: ml_app; Owner: -
--

CREATE FUNCTION ml_app.log_user_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO user_history
  (
      user_id,
      email,
      encrypted_password,
      reset_password_token,
      reset_password_sent_at,
      remember_created_at,
      sign_in_count,
      current_sign_in_at,
      last_sign_in_at,
      current_sign_in_ip ,
      last_sign_in_ip ,
      created_at ,
      updated_at,
      failed_attempts,
      unlock_token,
      locked_at,
      disabled ,
      admin_id,
      app_type_id,
      authentication_token,
      encrypted_otp_secret,
      encrypted_otp_secret_iv,
      encrypted_otp_secret_salt,
      consumed_timestep,
      otp_required_for_login,
      password_updated_at,
      first_name,
      last_name,
      confirmation_token,
      confirmed_at,
      confirmation_sent_at
  )
  SELECT
    NEW.id,
    NEW.email,
    NEW.encrypted_password,
    NEW.reset_password_token,
    NEW.reset_password_sent_at,
    NEW.remember_created_at,
    NEW.sign_in_count,
    NEW.current_sign_in_at,
    NEW.last_sign_in_at,
    NEW.current_sign_in_ip ,
    NEW.last_sign_in_ip ,
    NEW.created_at ,
    NEW.updated_at,
    NEW.failed_attempts,
    NEW.unlock_token,
    NEW.locked_at,
    NEW.disabled ,
    NEW.admin_id,
    NEW.app_type_id,
    NEW.authentication_token,
    NEW.encrypted_otp_secret,
    NEW.encrypted_otp_secret_iv,
    NEW.encrypted_otp_secret_salt,
    NEW.consumed_timestep,
    NEW.otp_required_for_login,
    NEW.password_updated_at,
    NEW.first_name,
    NEW.last_name,
    NEW.confirmation_token,
    NEW.confirmed_at,
    NEW.confirmation_sent_at
  ;
  RETURN NEW;
  END;
  $$;


--
-- Name: redcap_data_dictionary_history_upd(); Type: FUNCTION; Schema: ml_app; Owner: -
--

CREATE FUNCTION ml_app.redcap_data_dictionary_history_upd() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO redcap_data_dictionary_history (
    redcap_project_admin_id, field_count, captured_metadata,
    disabled,
    admin_id,
    created_at,
    updated_at,
    redcap_data_dictionary_id)
  SELECT
    NEW.redcap_project_admin_id, NEW.field_count, NEW.captured_metadata,
    NEW.disabled,
    NEW.admin_id,
    NEW.created_at,
    NEW.updated_at,
    NEW.id;
  RETURN NEW;
END;
$$;


--
-- Name: redcap_project_admin_history_upd(); Type: FUNCTION; Schema: ml_app; Owner: -
--

CREATE FUNCTION ml_app.redcap_project_admin_history_upd() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO redcap_project_admin_history (
    name, api_key, server_url, captured_project_info, study, transfer_mode, frequency, status, post_transfer_pipeline, notes, dynamic_model_table,
    disabled,
    admin_id,
    created_at,
    updated_at,
    redcap_project_admin_id)
  SELECT
    NEW.name, NEW.api_key, NEW.server_url, NEW.captured_project_info, NEW.study, NEW.transfer_mode, NEW.frequency, NEW.status, NEW.post_transfer_pipeline, NEW.notes, NEW.dynamic_model_table,
    NEW.disabled,
    NEW.admin_id,
    NEW.created_at,
    NEW.updated_at,
    NEW.id;
  RETURN NEW;
END;
$$;


--
-- Name: role_description_history_upd(); Type: FUNCTION; Schema: ml_app; Owner: -
--

CREATE FUNCTION ml_app.role_description_history_upd() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO role_description_history (
    app_type_id, role_name, role_template, name, description,
    disabled,
    admin_id,
    created_at,
    updated_at,
    role_description_id)
  SELECT
    NEW.app_type_id, NEW.role_name, NEW.role_template, NEW.name, NEW.description,
    NEW.disabled,
    NEW.admin_id,
    NEW.created_at,
    NEW.updated_at,
    NEW.id;
  RETURN NEW;
END;
$$;


--
-- Name: tracker_upsert(); Type: FUNCTION; Schema: ml_app; Owner: -
--

CREATE FUNCTION ml_app.tracker_upsert() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
      DECLARE
        latest_tracker trackers%ROWTYPE;
      BEGIN



        -- Look for a row in trackers for the inserted master / protocol pair
        SELECT * into latest_tracker
          FROM trackers
          WHERE
            master_id = NEW.master_id
            AND protocol_id = NEW.protocol_id
          ORDER BY
            event_date DESC NULLS LAST, updated_at DESC NULLS LAST
          LIMIT 1
        ;

        IF NOT FOUND THEN
          -- Nothing was found, so just allow the insert to continue

          RETURN NEW;

        ELSE
          -- A trackers row for the master / protocol pair was found.
          -- Check if it is more recent, by having an event date either later than the insert, or
          -- has an event_date the same as the insert but with later updated_at time (unlikely)

          IF latest_tracker.event_date > NEW.event_date OR
              latest_tracker.event_date = NEW.event_date AND latest_tracker.updated_at > NEW.updated_at
              THEN

            -- The retrieved record was more recent, we should not make a change to the trackers table,
            -- but instead we need to ensure an insert into the tracker_history table does happen even though there
            -- is no actual insert or update trigger to fire.
            -- We use the trackers record ID that was retrieved as the tracker_id in tracker_history

            INSERT INTO tracker_history (
                tracker_id, master_id, protocol_id,
                protocol_event_id, event_date, sub_process_id, notes,
                item_id, item_type,
                created_at, updated_at, user_id
              )
              SELECT
                latest_tracker.id, NEW.master_id, NEW.protocol_id,
                NEW.protocol_event_id, NEW.event_date,
                NEW.sub_process_id, NEW.notes,
                NEW.item_id, NEW.item_type,
                NEW.created_at, NEW.updated_at, NEW.user_id  ;

            RETURN NULL;

          ELSE
            -- The tracker record for the master / protocol pair exists and was not more recent, therefore it
            -- needs to be replaced by the intended NEW record. Complete with an update and allow the cascading
            -- trackers update trigger to handle the insert into tracker_history.

            UPDATE trackers SET
              master_id = NEW.master_id,
              protocol_id = NEW.protocol_id,
              protocol_event_id = NEW.protocol_event_id,
              event_date = NEW.event_date,
              sub_process_id = NEW.sub_process_id,
              notes = NEW.notes,
              item_id = NEW.item_id,
              item_type = NEW.item_type,
              -- do not update created_at --
              updated_at = NEW.updated_at,
              user_id = NEW.user_id
            WHERE master_id = NEW.master_id AND
              protocol_id = NEW.protocol_id
            ;

            -- Prevent the original insert from actually completing.
            RETURN NULL;
          END IF;
        END IF;
      END;
    $$;


--
-- Name: update_address_ranks(integer); Type: FUNCTION; Schema: ml_app; Owner: -
--

CREATE FUNCTION ml_app.update_address_ranks(set_master_id integer) RETURNS integer
    LANGUAGE plpgsql
    AS $$
        DECLARE
          latest_primary RECORD;
        BEGIN

          SELECT * into latest_primary
          FROM addresses
          WHERE master_id = set_master_id
          AND rank = 10
          ORDER BY updated_at DESC
          LIMIT 1;

          IF NOT FOUND THEN
            RETURN NULL;
          END IF;


          UPDATE addresses SET rank = 5
          WHERE
            master_id = set_master_id
            AND rank = 10
            AND id <> latest_primary.id;


          RETURN 1;
        END;
    $$;


--
-- Name: update_master_with_player_info(); Type: FUNCTION; Schema: ml_app; Owner: -
--

CREATE FUNCTION ml_app.update_master_with_player_info() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
      BEGIN
          UPDATE masters
              set rank = (
              case when NEW.rank is null then null
                   when (NEW.rank > 12) then NEW.rank * -1
                   else new.rank
              end
              )

          WHERE masters.id = NEW.master_id;

          RETURN NEW;
      END;
      $$;


--
-- Name: update_master_with_pro_info(); Type: FUNCTION; Schema: ml_app; Owner: -
--

CREATE FUNCTION ml_app.update_master_with_pro_info() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    BEGIN
        UPDATE masters
            set pro_info_id = NEW.id, pro_id = NEW.pro_id
        WHERE masters.id = NEW.master_id;

        RETURN NEW;
    END;
    $$;


--
-- Name: update_player_contact_ranks(integer, character varying); Type: FUNCTION; Schema: ml_app; Owner: -
--

CREATE FUNCTION ml_app.update_player_contact_ranks(set_master_id integer, set_rec_type character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$
        DECLARE
          latest_primary RECORD;
        BEGIN

          SELECT * into latest_primary
          FROM player_contacts
          WHERE master_id = set_master_id
          AND rank = 10
          AND rec_type = set_rec_type
          ORDER BY updated_at DESC
          LIMIT 1;

          IF NOT FOUND THEN
            RETURN NULL;
          END IF;


          UPDATE player_contacts SET rank = 5
          WHERE
            master_id = set_master_id
            AND rank = 10
            AND rec_type = set_rec_type
            AND id <> latest_primary.id;


          RETURN 1;
        END;
    $$;


--
-- Name: user_description_history_upd(); Type: FUNCTION; Schema: ml_app; Owner: -
--

CREATE FUNCTION ml_app.user_description_history_upd() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO user_description_history (
    app_type_id, role_name, role_template, name, description,
    disabled,
    admin_id,
    created_at,
    updated_at,
    user_description_id)
  SELECT
    NEW.app_type_id, NEW.role_name, NEW.role_template, NEW.name, NEW.description,
    NEW.disabled,
    NEW.admin_id,
    NEW.created_at,
    NEW.updated_at,
    NEW.id;
  RETURN NEW;
END;
$$;


--
-- Name: log_q2_demo_rcs_update(); Type: FUNCTION; Schema: redcap; Owner: -
--

CREATE FUNCTION redcap.log_q2_demo_rcs_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO q2_demo_rc_history (
    
    record_id, dob, current_weight, domestic_status, living_situation, current_employment, student_looking, current_fbjob, current_fbjob_oth, job_industry, job_title, job_title_entry, smoke, smoketime_chosen_array, smoketime___pnfl, smoketime___dnfl, smoketime___anfl, smoke_start, smoke_stop, smoke_curr, smoke_totyrs, smoke_prenfl, smoke_nfl, smoke_postnfl, edu_player, edu_mother, edu_father, occ_mother, occ_mother_exp, occ_father, occ_father_exp, yrsplayed_prehs, playhsfb___no, hsposition1, hsposition2, yrsplayed_hs, collposition1, collposition2, yrsplayed_coll, college_div, collpreprac, collpreprac_pads, collregprac, collregprac_pads, collsnap_ol, collsnap_wr, collsnap_dl, collsnap_te, collsnap_lb, collsnap_qb, collsnap_db, collsnap_kick, collsnap_rb, collsnap_special, nflpreprac, nflpreprac_pads, nflregprac, nflregprac_pads, prosnap_ol, prosnap_wr, prosnap_dl, prosnap_te, prosnap_lb, prosnap_qb, prosnap_db, prosnap_kick, prosnap_rb, prosnap_special, gmsplyd_career, gmsplyd_season, prsqd, prsqd_seasons, othleague, othleague_seasons, othleaguenm_chosen_array, othleaguenm___afl, othleaguenm___cfl, othleaguenm___efl, othleaguenm___ufl, othleaguenm___wfl, othleaguenm___xfl, othleaguenm___oth, othleague_exp, nonnfl_seasons, prsqd_nonnfl, prsqd_nonnfl_seasons, firstpro_age, finalpro_age, leftfb_chosen_array, leftfb___age, leftfb___cut, leftfb___fbinj, leftfb___inj, leftfb___retire, postfb_hlthprac, postfb_degree, postfb_charity, postfb_fbjob, postfb_job, postfbjob_occ, postfbjob_occexp, postfbex_walk, postfbex_jog, postfbex_run, postfbex_other, postfbex_lowint, postfbex_wttrain, postfbex_endsprt, postfbex_reclg, pastyrex_walk, pastyrex_jog, pastyrex_run, pastyrex_oth, pastyrex_lowint, pastyrex_wttrain, pastyrex_endsprt, pastyrex_reclg, ex150min, ex150min_exp, ex150min_oth, demog___complete, demog_date, postfb_wt2yr, postfb_wt2yrdelta, postfb_wt5yr, postfb_wt5yrdelta, cardiac_rehab, cvtest_ecg, cvtest_ecg_exp, cvtest_echo, cvtest_echo_exp, cvtest_cpxt, cvtest_cpxt_exp, cvtest_cvmri, cvtest_cvmri_exp, cvtest_corct, cvtest_corct_exp, cvtest_cvcath, cvtest_cvcath_exp, cvdx_mi, cvdx_stroke, cvdx_tia, cvmedrec_highbp, cvmedrec_hrtfail, cvmedrec_afib, cvmedrec_otharrhyth, cvmedrec_highchol, cvmedrec_diabetes, cvsurg_bypass, cvsurg_ablation, cvsurg_carotidart, cvmed_chol, cvmed_othchol, cvmed_novchol, cvmed_bldthin, cvmed_anticoag, cvmed_arrhyth, cvmed_digoxin, cvmed_furosemide, cvmed_thiazide, cvmed_calciumblk, cvmed_antihyp, dbmed_metformin, dbmed_glimeperide, dbmed_insulin, dbmed_other, cardiac___complete, cardiac_date, ad8_1, ad8_2, ad8_3, ad8_4, ad8_5, ad8_6, ad8_7, ad8_8, nqcog64q2, nqcog65q2, nqcog66q2, nqcog68q2, nqcog72q2, nqcog75q2, nqcog77q2, nqcog80q2, nqper02, nqper05, nqper06, nqper07, nqper11, nqper12, nqper17, nqper19, phq1, phq2, phq3, phq4, phq5, phq6, phq7, phq8, phq9, gad7_1, gad7_2, gad7_3, gad7_4, gad7_5, gad7_6, gad7_7, lotr1, lotr3, lotr4, lotr7, lotr9, lotr10, stpbng_snore, stpbng_tired, stpbng_obser, stpbng_bp, stpbng_neck, cpapuse, cpapuse_days, ncmedrec_hdache, ncmedrec_anx, ncmedrec_dep, ncmedrec_memloss, ncmedrec_add, ncdx_alz, ncdx_cte, ncdx_vascdem, ncdx_othdem, ncdx_als, ncdx_parkins, ncdx_ms, ncmed_ssri, ncmed_tricydep, ncmed_othdep, ncmed_slpaid, neurocog___complete, neurocog_date, bpi1, bpi2_chosen_array, bpi2___head, bpi2___neck, bpi2___shoul, bpi2___chest, bpi2___arm, bpi2___hand, bpi2___uback, bpi2___lbak, bpi2___hip, bpi2___leg, bpi2___knee, bpi2___ankle, bpi2___foot, bpi2___oth, bpi2_othexp, bpi2most, bpi2most_othexp, bpi3, bpi4, bpi5, bpi6, bpi7_chosen_array, bpi7___none, bpi7___otc, bpi7___prmed, bpi7___mass, bpi7___pt, bpi7___acup, bpi7___marij, bpi7___intpm, bpi7___oth, bpi7_othexp, bpi8, bpi9a, bpi9b, bpi9c, bpi9d, bpi9e, bpi9f, bpi9g, bpi9h, pnmedfb_acetamin, pnmedfb_aspirin, pnmedfb_ibuprof, pnmedfb_othantiinf, pnmedfb_oralster, pnmedfb_opioid, pnmed5yr_acetamin, pnmed5yr_aspirin, pnmed5yr_ibuprof, pnmed5yr_antiinf, pnmed5yr_oralster, pnmed5yr_opioid, pnmed_acetamin, pnmed_acetamin_days, pnmed_acetamin_tabs, pnmed_acetamin_dose, pnmed_aspirin, pnmed_aspirin_days, pnmed_aspirin_tabs, pnmed_aspirin_dose, pnmed_ibuprof, pnmed_ibuprof_days, pnmed_ibuprof_tabs, pnmed_ibuprof_dose, pnmed_antiinf, pnmed_antiinf_days, pnmed_antiinf_tabs, pnmed_antiinf_dose, pnmed_oralster, pnmed_oralster_days, pnmed_oralster_tabs, pnmed_oralster_dose, pnmed_opioid, pnmed_opioid_days, pnmed_opioid_tab, pnmed_opioid_dose, pnsurg_nckspin, pnsurg_back, pnsurg_hip, pnsurg_knee, pain___complete, pain_date, wealth, wealth_emerg_chosen_array, wealth_emerg___1, wealth_emerg___2, wealth_emerg___3, wealth_emerg___4, wealth_emerg___5, wealth_emerg___6, wealth_emerg___7, wealth_emerg___8, wealth_emerg___9, wealth_emerg_oth, ladder_wealth, ladder_comm, household_number, hcutil_pcp, hcutil_pcp_exp, hcutil_pcp_oth, hcutil_othprov, selfrpt_cte, otdx_arthritis, otdx_slpapnea, otdx_prostcanc, otdx_basalcanc, otdx_squamcanc, otdx_melanom, otdx_lymphom, otdx_othcanc, otdx_renalfail, otdx_alcdep, otdx_livcirrhosis, otdx_livfail, otmedrec_pncond, otmedrec_livprob, otmedrec_lowtest, otmedrec_ed, massage, acupuncture, chiropractic, yoga, taichi, meditation, othaltmed, othaltmed_exp, famhxmoth_chosen_array, famhxmoth___na, famhxmoth___lung, famhxmoth___colrec, famhxmoth___diab, famhxmoth___mela, famhxmoth___hypert, famhxmoth___dem, famhxmoth___alc, famhxfsib_chosen_array, famhxfsib___na, famhxfsib___lung, famhxfsib___colrec, famhxfsib___diab, famhxfsib___mela, famhxfsib___hypert, famhxfsib___dem, famhxfsib___alc, femsib_number, famhxfath_chosen_array, famhxfath___na, famhxfath___lung, famhxfath___colrec, famhxfath___prost, famhxfath___diab, famhxfath___mela, famhxfath___hypert, famhxfath___dem, famhxfath___alc, famhxmsib_chosen_array, famhxmsib___na, famhxmsib___lung, famhxmsib___colrec, famhxmsib___prost, famhxmsib___diab, famhxmsib___mela, famhxmsib___hypert, famhxmsib___dem, famhxmsib___alc, sib_number, sib1age, sib1ht_feet, sib1ht_inch, sib1sport_chosen_array, sib1sport___none, sib1sport___hsfb, sib1sport___colfb, sib1sport___oth, sib1sport_oth, sib2age, sib2ht_feet, sib2ht_inch, sib2sport_chosen_array, sib2sport___none, sib2sport___hsfb, sib2sport___colfb, sib2sport___oth, sib2sport_oth, sib3age, sib3ht_feet, sib3ht_inch, sib3sport_chosen_array, sib3sport___none, sib3sport___hsfb, sib3sport___colfb, sib3sport___oth, sib3sport_oth, sib4age, sib4ht_feet, sib4ht_inch, sib4sport_chosen_array, sib4sport___none, sib4sport___hsfb, sib4sport___colfb, sib4sport___oth, sib4sportoth, sib5age, sib5ht_feet, sib5ht_inch, sib5sport_chosen_array, sib5sport___none, sib5sport___hsfb, sib5sport___colfb, sib5sport___oth, sib5sport_oth, pedcaff_chosen_array, pedcaff___noans, pedcaff___no, pedcaff___fb, pedcaff___cur, pededrink_chosen_array, pededrink___noans, pededrink___no, pededrink___fb, pededrink___cur, pedcreat_chosen_array, pedcreat___noans, pedcreat___no, pedcreat___fb, pedcreat___cur, pedsteroid_chosen_array, pedsteroid___noans, pedsteroid___no, pedsteroid___fb, pedsteroid___cur, pedgh_chosen_array, pedgh___noans, pedgh___no, pedgh___fb, pedgh___cur, pedephed_chosen_array, pedephed___noans, pedephed___no, pedephed___fb, pedephed___cur, pedbetahy_chosen_array, pedbetahy___noans, pedbetahy___no, pedbetahy___fb, pedbetahy___cur, pednoncaf_chosen_array, pednoncaf___noans, pednoncaf___no, pednoncaf___fb, pednoncaf___cur, pedrcell_chosen_array, pedrcell___noans, pedrcell___no, pedrcell___fb, pedrcell___cur, pedinos_chosen_array, pedinos___noans, pedinos___no, pedinos___fb, pedinos___cur, alcohol_days, alcohol_drinks, marijuana, marijuana_start, marijuana_stop, marijuana_totyrs, marijtime_chosen_array, marijtime___pnfl, marijtime___dnfl, marijtime___anfl, marijreas_chosen_array, marijreas___fun, marijreas___relx, marijreas___pain, marijreas___anx, marijreas___dep, marijreas___oth, marijreas_exp, born_address, born_city, born_state, born_zip, twelveyrs_address, twelveyrs_city, twelveyrs_state, twelveyrs_zip, infertility, infert_age, infert_hcp, infertreas_chosen_array, infertreas___fem, infertreas___mal, infertreas___unex, infertreas___oth, infertreas_oth, actout_dreams, smell_problem, taste_problem, bowel_move, laxative_use, workplace_harass, coach_discrim, coach_discrimstr, player_discrim, player_discrimstr, job_discrim, job_discrimstr, ace1, ace2, ace3, ace4, ace5, ace6, ace7, ace8, ace9, ace10, foodins_worry, foodins_ranout, q2help, othealth___complete, othealth_date, q2_survey_complete, q2_survey_timestamp, sdfsdaf_chosen_array, sdfsdaf___0, sdfsdaf___1, sdfsdaf___2, rtyrtyrt_chosen_array, rtyrtyrt___0, rtyrtyrt___1, rtyrtyrt___2, test_field, test_phone, i57, f57, dd, yes_or_no, true_or_false, file1, signature, slider, test_complete, test_timestamp, base_field, non_survey_complete, non_survey_timestamp, redcap_survey_identifier,
    user_id,
    created_at,
    updated_at,
    q2_demo_rc_id)
  SELECT
    
    NEW.record_id, NEW.dob, NEW.current_weight, NEW.domestic_status, NEW.living_situation, NEW.current_employment, NEW.student_looking, NEW.current_fbjob, NEW.current_fbjob_oth, NEW.job_industry, NEW.job_title, NEW.job_title_entry, NEW.smoke, NEW.smoketime_chosen_array, NEW.smoketime___pnfl, NEW.smoketime___dnfl, NEW.smoketime___anfl, NEW.smoke_start, NEW.smoke_stop, NEW.smoke_curr, NEW.smoke_totyrs, NEW.smoke_prenfl, NEW.smoke_nfl, NEW.smoke_postnfl, NEW.edu_player, NEW.edu_mother, NEW.edu_father, NEW.occ_mother, NEW.occ_mother_exp, NEW.occ_father, NEW.occ_father_exp, NEW.yrsplayed_prehs, NEW.playhsfb___no, NEW.hsposition1, NEW.hsposition2, NEW.yrsplayed_hs, NEW.collposition1, NEW.collposition2, NEW.yrsplayed_coll, NEW.college_div, NEW.collpreprac, NEW.collpreprac_pads, NEW.collregprac, NEW.collregprac_pads, NEW.collsnap_ol, NEW.collsnap_wr, NEW.collsnap_dl, NEW.collsnap_te, NEW.collsnap_lb, NEW.collsnap_qb, NEW.collsnap_db, NEW.collsnap_kick, NEW.collsnap_rb, NEW.collsnap_special, NEW.nflpreprac, NEW.nflpreprac_pads, NEW.nflregprac, NEW.nflregprac_pads, NEW.prosnap_ol, NEW.prosnap_wr, NEW.prosnap_dl, NEW.prosnap_te, NEW.prosnap_lb, NEW.prosnap_qb, NEW.prosnap_db, NEW.prosnap_kick, NEW.prosnap_rb, NEW.prosnap_special, NEW.gmsplyd_career, NEW.gmsplyd_season, NEW.prsqd, NEW.prsqd_seasons, NEW.othleague, NEW.othleague_seasons, NEW.othleaguenm_chosen_array, NEW.othleaguenm___afl, NEW.othleaguenm___cfl, NEW.othleaguenm___efl, NEW.othleaguenm___ufl, NEW.othleaguenm___wfl, NEW.othleaguenm___xfl, NEW.othleaguenm___oth, NEW.othleague_exp, NEW.nonnfl_seasons, NEW.prsqd_nonnfl, NEW.prsqd_nonnfl_seasons, NEW.firstpro_age, NEW.finalpro_age, NEW.leftfb_chosen_array, NEW.leftfb___age, NEW.leftfb___cut, NEW.leftfb___fbinj, NEW.leftfb___inj, NEW.leftfb___retire, NEW.postfb_hlthprac, NEW.postfb_degree, NEW.postfb_charity, NEW.postfb_fbjob, NEW.postfb_job, NEW.postfbjob_occ, NEW.postfbjob_occexp, NEW.postfbex_walk, NEW.postfbex_jog, NEW.postfbex_run, NEW.postfbex_other, NEW.postfbex_lowint, NEW.postfbex_wttrain, NEW.postfbex_endsprt, NEW.postfbex_reclg, NEW.pastyrex_walk, NEW.pastyrex_jog, NEW.pastyrex_run, NEW.pastyrex_oth, NEW.pastyrex_lowint, NEW.pastyrex_wttrain, NEW.pastyrex_endsprt, NEW.pastyrex_reclg, NEW.ex150min, NEW.ex150min_exp, NEW.ex150min_oth, NEW.demog___complete, NEW.demog_date, NEW.postfb_wt2yr, NEW.postfb_wt2yrdelta, NEW.postfb_wt5yr, NEW.postfb_wt5yrdelta, NEW.cardiac_rehab, NEW.cvtest_ecg, NEW.cvtest_ecg_exp, NEW.cvtest_echo, NEW.cvtest_echo_exp, NEW.cvtest_cpxt, NEW.cvtest_cpxt_exp, NEW.cvtest_cvmri, NEW.cvtest_cvmri_exp, NEW.cvtest_corct, NEW.cvtest_corct_exp, NEW.cvtest_cvcath, NEW.cvtest_cvcath_exp, NEW.cvdx_mi, NEW.cvdx_stroke, NEW.cvdx_tia, NEW.cvmedrec_highbp, NEW.cvmedrec_hrtfail, NEW.cvmedrec_afib, NEW.cvmedrec_otharrhyth, NEW.cvmedrec_highchol, NEW.cvmedrec_diabetes, NEW.cvsurg_bypass, NEW.cvsurg_ablation, NEW.cvsurg_carotidart, NEW.cvmed_chol, NEW.cvmed_othchol, NEW.cvmed_novchol, NEW.cvmed_bldthin, NEW.cvmed_anticoag, NEW.cvmed_arrhyth, NEW.cvmed_digoxin, NEW.cvmed_furosemide, NEW.cvmed_thiazide, NEW.cvmed_calciumblk, NEW.cvmed_antihyp, NEW.dbmed_metformin, NEW.dbmed_glimeperide, NEW.dbmed_insulin, NEW.dbmed_other, NEW.cardiac___complete, NEW.cardiac_date, NEW.ad8_1, NEW.ad8_2, NEW.ad8_3, NEW.ad8_4, NEW.ad8_5, NEW.ad8_6, NEW.ad8_7, NEW.ad8_8, NEW.nqcog64q2, NEW.nqcog65q2, NEW.nqcog66q2, NEW.nqcog68q2, NEW.nqcog72q2, NEW.nqcog75q2, NEW.nqcog77q2, NEW.nqcog80q2, NEW.nqper02, NEW.nqper05, NEW.nqper06, NEW.nqper07, NEW.nqper11, NEW.nqper12, NEW.nqper17, NEW.nqper19, NEW.phq1, NEW.phq2, NEW.phq3, NEW.phq4, NEW.phq5, NEW.phq6, NEW.phq7, NEW.phq8, NEW.phq9, NEW.gad7_1, NEW.gad7_2, NEW.gad7_3, NEW.gad7_4, NEW.gad7_5, NEW.gad7_6, NEW.gad7_7, NEW.lotr1, NEW.lotr3, NEW.lotr4, NEW.lotr7, NEW.lotr9, NEW.lotr10, NEW.stpbng_snore, NEW.stpbng_tired, NEW.stpbng_obser, NEW.stpbng_bp, NEW.stpbng_neck, NEW.cpapuse, NEW.cpapuse_days, NEW.ncmedrec_hdache, NEW.ncmedrec_anx, NEW.ncmedrec_dep, NEW.ncmedrec_memloss, NEW.ncmedrec_add, NEW.ncdx_alz, NEW.ncdx_cte, NEW.ncdx_vascdem, NEW.ncdx_othdem, NEW.ncdx_als, NEW.ncdx_parkins, NEW.ncdx_ms, NEW.ncmed_ssri, NEW.ncmed_tricydep, NEW.ncmed_othdep, NEW.ncmed_slpaid, NEW.neurocog___complete, NEW.neurocog_date, NEW.bpi1, NEW.bpi2_chosen_array, NEW.bpi2___head, NEW.bpi2___neck, NEW.bpi2___shoul, NEW.bpi2___chest, NEW.bpi2___arm, NEW.bpi2___hand, NEW.bpi2___uback, NEW.bpi2___lbak, NEW.bpi2___hip, NEW.bpi2___leg, NEW.bpi2___knee, NEW.bpi2___ankle, NEW.bpi2___foot, NEW.bpi2___oth, NEW.bpi2_othexp, NEW.bpi2most, NEW.bpi2most_othexp, NEW.bpi3, NEW.bpi4, NEW.bpi5, NEW.bpi6, NEW.bpi7_chosen_array, NEW.bpi7___none, NEW.bpi7___otc, NEW.bpi7___prmed, NEW.bpi7___mass, NEW.bpi7___pt, NEW.bpi7___acup, NEW.bpi7___marij, NEW.bpi7___intpm, NEW.bpi7___oth, NEW.bpi7_othexp, NEW.bpi8, NEW.bpi9a, NEW.bpi9b, NEW.bpi9c, NEW.bpi9d, NEW.bpi9e, NEW.bpi9f, NEW.bpi9g, NEW.bpi9h, NEW.pnmedfb_acetamin, NEW.pnmedfb_aspirin, NEW.pnmedfb_ibuprof, NEW.pnmedfb_othantiinf, NEW.pnmedfb_oralster, NEW.pnmedfb_opioid, NEW.pnmed5yr_acetamin, NEW.pnmed5yr_aspirin, NEW.pnmed5yr_ibuprof, NEW.pnmed5yr_antiinf, NEW.pnmed5yr_oralster, NEW.pnmed5yr_opioid, NEW.pnmed_acetamin, NEW.pnmed_acetamin_days, NEW.pnmed_acetamin_tabs, NEW.pnmed_acetamin_dose, NEW.pnmed_aspirin, NEW.pnmed_aspirin_days, NEW.pnmed_aspirin_tabs, NEW.pnmed_aspirin_dose, NEW.pnmed_ibuprof, NEW.pnmed_ibuprof_days, NEW.pnmed_ibuprof_tabs, NEW.pnmed_ibuprof_dose, NEW.pnmed_antiinf, NEW.pnmed_antiinf_days, NEW.pnmed_antiinf_tabs, NEW.pnmed_antiinf_dose, NEW.pnmed_oralster, NEW.pnmed_oralster_days, NEW.pnmed_oralster_tabs, NEW.pnmed_oralster_dose, NEW.pnmed_opioid, NEW.pnmed_opioid_days, NEW.pnmed_opioid_tab, NEW.pnmed_opioid_dose, NEW.pnsurg_nckspin, NEW.pnsurg_back, NEW.pnsurg_hip, NEW.pnsurg_knee, NEW.pain___complete, NEW.pain_date, NEW.wealth, NEW.wealth_emerg_chosen_array, NEW.wealth_emerg___1, NEW.wealth_emerg___2, NEW.wealth_emerg___3, NEW.wealth_emerg___4, NEW.wealth_emerg___5, NEW.wealth_emerg___6, NEW.wealth_emerg___7, NEW.wealth_emerg___8, NEW.wealth_emerg___9, NEW.wealth_emerg_oth, NEW.ladder_wealth, NEW.ladder_comm, NEW.household_number, NEW.hcutil_pcp, NEW.hcutil_pcp_exp, NEW.hcutil_pcp_oth, NEW.hcutil_othprov, NEW.selfrpt_cte, NEW.otdx_arthritis, NEW.otdx_slpapnea, NEW.otdx_prostcanc, NEW.otdx_basalcanc, NEW.otdx_squamcanc, NEW.otdx_melanom, NEW.otdx_lymphom, NEW.otdx_othcanc, NEW.otdx_renalfail, NEW.otdx_alcdep, NEW.otdx_livcirrhosis, NEW.otdx_livfail, NEW.otmedrec_pncond, NEW.otmedrec_livprob, NEW.otmedrec_lowtest, NEW.otmedrec_ed, NEW.massage, NEW.acupuncture, NEW.chiropractic, NEW.yoga, NEW.taichi, NEW.meditation, NEW.othaltmed, NEW.othaltmed_exp, NEW.famhxmoth_chosen_array, NEW.famhxmoth___na, NEW.famhxmoth___lung, NEW.famhxmoth___colrec, NEW.famhxmoth___diab, NEW.famhxmoth___mela, NEW.famhxmoth___hypert, NEW.famhxmoth___dem, NEW.famhxmoth___alc, NEW.famhxfsib_chosen_array, NEW.famhxfsib___na, NEW.famhxfsib___lung, NEW.famhxfsib___colrec, NEW.famhxfsib___diab, NEW.famhxfsib___mela, NEW.famhxfsib___hypert, NEW.famhxfsib___dem, NEW.famhxfsib___alc, NEW.femsib_number, NEW.famhxfath_chosen_array, NEW.famhxfath___na, NEW.famhxfath___lung, NEW.famhxfath___colrec, NEW.famhxfath___prost, NEW.famhxfath___diab, NEW.famhxfath___mela, NEW.famhxfath___hypert, NEW.famhxfath___dem, NEW.famhxfath___alc, NEW.famhxmsib_chosen_array, NEW.famhxmsib___na, NEW.famhxmsib___lung, NEW.famhxmsib___colrec, NEW.famhxmsib___prost, NEW.famhxmsib___diab, NEW.famhxmsib___mela, NEW.famhxmsib___hypert, NEW.famhxmsib___dem, NEW.famhxmsib___alc, NEW.sib_number, NEW.sib1age, NEW.sib1ht_feet, NEW.sib1ht_inch, NEW.sib1sport_chosen_array, NEW.sib1sport___none, NEW.sib1sport___hsfb, NEW.sib1sport___colfb, NEW.sib1sport___oth, NEW.sib1sport_oth, NEW.sib2age, NEW.sib2ht_feet, NEW.sib2ht_inch, NEW.sib2sport_chosen_array, NEW.sib2sport___none, NEW.sib2sport___hsfb, NEW.sib2sport___colfb, NEW.sib2sport___oth, NEW.sib2sport_oth, NEW.sib3age, NEW.sib3ht_feet, NEW.sib3ht_inch, NEW.sib3sport_chosen_array, NEW.sib3sport___none, NEW.sib3sport___hsfb, NEW.sib3sport___colfb, NEW.sib3sport___oth, NEW.sib3sport_oth, NEW.sib4age, NEW.sib4ht_feet, NEW.sib4ht_inch, NEW.sib4sport_chosen_array, NEW.sib4sport___none, NEW.sib4sport___hsfb, NEW.sib4sport___colfb, NEW.sib4sport___oth, NEW.sib4sportoth, NEW.sib5age, NEW.sib5ht_feet, NEW.sib5ht_inch, NEW.sib5sport_chosen_array, NEW.sib5sport___none, NEW.sib5sport___hsfb, NEW.sib5sport___colfb, NEW.sib5sport___oth, NEW.sib5sport_oth, NEW.pedcaff_chosen_array, NEW.pedcaff___noans, NEW.pedcaff___no, NEW.pedcaff___fb, NEW.pedcaff___cur, NEW.pededrink_chosen_array, NEW.pededrink___noans, NEW.pededrink___no, NEW.pededrink___fb, NEW.pededrink___cur, NEW.pedcreat_chosen_array, NEW.pedcreat___noans, NEW.pedcreat___no, NEW.pedcreat___fb, NEW.pedcreat___cur, NEW.pedsteroid_chosen_array, NEW.pedsteroid___noans, NEW.pedsteroid___no, NEW.pedsteroid___fb, NEW.pedsteroid___cur, NEW.pedgh_chosen_array, NEW.pedgh___noans, NEW.pedgh___no, NEW.pedgh___fb, NEW.pedgh___cur, NEW.pedephed_chosen_array, NEW.pedephed___noans, NEW.pedephed___no, NEW.pedephed___fb, NEW.pedephed___cur, NEW.pedbetahy_chosen_array, NEW.pedbetahy___noans, NEW.pedbetahy___no, NEW.pedbetahy___fb, NEW.pedbetahy___cur, NEW.pednoncaf_chosen_array, NEW.pednoncaf___noans, NEW.pednoncaf___no, NEW.pednoncaf___fb, NEW.pednoncaf___cur, NEW.pedrcell_chosen_array, NEW.pedrcell___noans, NEW.pedrcell___no, NEW.pedrcell___fb, NEW.pedrcell___cur, NEW.pedinos_chosen_array, NEW.pedinos___noans, NEW.pedinos___no, NEW.pedinos___fb, NEW.pedinos___cur, NEW.alcohol_days, NEW.alcohol_drinks, NEW.marijuana, NEW.marijuana_start, NEW.marijuana_stop, NEW.marijuana_totyrs, NEW.marijtime_chosen_array, NEW.marijtime___pnfl, NEW.marijtime___dnfl, NEW.marijtime___anfl, NEW.marijreas_chosen_array, NEW.marijreas___fun, NEW.marijreas___relx, NEW.marijreas___pain, NEW.marijreas___anx, NEW.marijreas___dep, NEW.marijreas___oth, NEW.marijreas_exp, NEW.born_address, NEW.born_city, NEW.born_state, NEW.born_zip, NEW.twelveyrs_address, NEW.twelveyrs_city, NEW.twelveyrs_state, NEW.twelveyrs_zip, NEW.infertility, NEW.infert_age, NEW.infert_hcp, NEW.infertreas_chosen_array, NEW.infertreas___fem, NEW.infertreas___mal, NEW.infertreas___unex, NEW.infertreas___oth, NEW.infertreas_oth, NEW.actout_dreams, NEW.smell_problem, NEW.taste_problem, NEW.bowel_move, NEW.laxative_use, NEW.workplace_harass, NEW.coach_discrim, NEW.coach_discrimstr, NEW.player_discrim, NEW.player_discrimstr, NEW.job_discrim, NEW.job_discrimstr, NEW.ace1, NEW.ace2, NEW.ace3, NEW.ace4, NEW.ace5, NEW.ace6, NEW.ace7, NEW.ace8, NEW.ace9, NEW.ace10, NEW.foodins_worry, NEW.foodins_ranout, NEW.q2help, NEW.othealth___complete, NEW.othealth_date, NEW.q2_survey_complete, NEW.q2_survey_timestamp, NEW.sdfsdaf_chosen_array, NEW.sdfsdaf___0, NEW.sdfsdaf___1, NEW.sdfsdaf___2, NEW.rtyrtyrt_chosen_array, NEW.rtyrtyrt___0, NEW.rtyrtyrt___1, NEW.rtyrtyrt___2, NEW.test_field, NEW.test_phone, NEW.i57, NEW.f57, NEW.dd, NEW.yes_or_no, NEW.true_or_false, NEW.file1, NEW.signature, NEW.slider, NEW.test_complete, NEW.test_timestamp, NEW.base_field, NEW.non_survey_complete, NEW.non_survey_timestamp, NEW.redcap_survey_identifier,
    NEW.user_id,
    NEW.created_at,
    NEW.updated_at,
    NEW.id;
  RETURN NEW;
END;
$$;


--
-- Name: log_viva_meta_variables_update(); Type: FUNCTION; Schema: redcap; Owner: -
--

CREATE FUNCTION redcap.log_viva_meta_variables_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO viva_meta_variable_history (
    
    varname, var_label, var_type, restrict_var___0, restrict_var___1, restrict_var___2, restrict_var___3, restrict_var___4, oth_restrict, domain_viva, subdomain___1, subdomain___2, target_of_q, data_source, val_instr, ext_instrument, internal_instrument, doc_yn, doc_link, long_yn, long_timepts___1, long_timepts___2, long_timepts___3, long_timepts___4, long_timepts___5, long_timepts___6, long_timepts___7, long_timepts___8, long_timepts___9, long_timepts___10, long_timepts___11, long_timepts___12, long_timepts___13, long_timepts___14, long_timepts___15, long_timepts___16, long_timepts___17, long_timepts___18, long_timepts___19, long_timepts___20, long_timepts___21, long_timepts___22, long_timepts___23, static_variable_information_complete, static_variable_information_timestamp, event_type, visit_name, visit_time, assay_specimen, assay_type, lab_assay_dataset, form_label_ep, form_version_ep___1, form_version_ep___2, form_version_ep___3, form_version_ep___4, form_version_ep___5, form_version_ep___6, form_version_ep___7, form_version_ep___8, form_label_mp, form_version_mp___1, form_version_mp___2, form_version_mp___3, form_version_mp___4, form_label_del, form_version_del___1, form_version_del___2, form_version_del___3, form_version_del___4, form_version_del___5, form_version_del___6, form_version_del___7, form_label_6m, form_version_6m___1, form_version_6m___2, form_version_6m___3, form_version_6m___4, form_version_6m___5, form_version_6m___6, form_version_6m___7, form_version_6m___8, form_version_6m___9, form_version_6m___10, form_label_1y, form_version_1y___1, form_label_2y, form_version_2y___1, form_label_3y, form_version_3y___1, form_version_3y___2, form_version_3y___3, form_version_3y___4, form_version_3y___5, form_version_3y___6, form_version_3y___7, form_version_3y___8, form_version_3y___9, form_version_3y___10, form_version_3y___11, form_version_3y___12, form_version_3y___13, form_version_3y___14, form_label_4y, form_version_4y___1, form_label_5y, form_version_5y___1, form_label_6y, form_version_6y___1, form_label_7y, form_version_7y___1, form_version_7y___2, form_version_7y___3, form_version_7y___4, form_version_7y___5, form_version_7y___6, form_version_7y___7, form_version_7y___8, form_version_7y___9, form_version_7y___10, form_version_7y___11, form_version_7y___12, form_version_7y___13, form_version_7y___14, form_version_7y___15, form_version_7y___16, form_version_7y___17, form_label_8y, form_version_8y___1, form_label_9y, form_version_9y___1, form_version_9y___2, form_label_10y, form_version_10y___1, form_version_10y___2, form_label_11y, form_version_11y___1, form_version_11y___2, form_label_12y, form_version_12y___1, form_version_12y___2, form_version_12y___3, form_version_12y___4, form_version_12y___5, form_version_12y___6, form_version_12y___7, form_version_12y___8, form_version_12y___9, form_version_12y___10, form_version_12y___11, form_version_12y___12, form_version_12y___13, form_version_12y___14, form_version_12y___15, form_version_12y___16, form_label_14y, form_version_14y___1, form_version_14y___2, form_label_15y, form_version_15y___1, form_version_15y___2, form_label_16y, form_version_16y___1, form_version_16y___2, form_label_mt, form_version_mt, form_label_19y, form_version_19y___1, form_version_19y___2, not_time_specific, var_level, units, model_type, response_options, elig_sample, elig_n, actual_n, an_var, orig_deriv, corr_derived_yn___0, corr_derived_yn___1, der_varname, dervar_explain, orig_varnames, visitspecific_information_complete, visitspecific_information_timestamp, redcap_survey_identifier, redcap_repeat_instrument, redcap_repeat_instance,
    user_id,
    created_at,
    updated_at,
    viva_meta_variable_id)
  SELECT
    
    NEW.varname, NEW.var_label, NEW.var_type, NEW.restrict_var___0, NEW.restrict_var___1, NEW.restrict_var___2, NEW.restrict_var___3, NEW.restrict_var___4, NEW.oth_restrict, NEW.domain_viva, NEW.subdomain___1, NEW.subdomain___2, NEW.target_of_q, NEW.data_source, NEW.val_instr, NEW.ext_instrument, NEW.internal_instrument, NEW.doc_yn, NEW.doc_link, NEW.long_yn, NEW.long_timepts___1, NEW.long_timepts___2, NEW.long_timepts___3, NEW.long_timepts___4, NEW.long_timepts___5, NEW.long_timepts___6, NEW.long_timepts___7, NEW.long_timepts___8, NEW.long_timepts___9, NEW.long_timepts___10, NEW.long_timepts___11, NEW.long_timepts___12, NEW.long_timepts___13, NEW.long_timepts___14, NEW.long_timepts___15, NEW.long_timepts___16, NEW.long_timepts___17, NEW.long_timepts___18, NEW.long_timepts___19, NEW.long_timepts___20, NEW.long_timepts___21, NEW.long_timepts___22, NEW.long_timepts___23, NEW.static_variable_information_complete, NEW.static_variable_information_timestamp, NEW.event_type, NEW.visit_name, NEW.visit_time, NEW.assay_specimen, NEW.assay_type, NEW.lab_assay_dataset, NEW.form_label_ep, NEW.form_version_ep___1, NEW.form_version_ep___2, NEW.form_version_ep___3, NEW.form_version_ep___4, NEW.form_version_ep___5, NEW.form_version_ep___6, NEW.form_version_ep___7, NEW.form_version_ep___8, NEW.form_label_mp, NEW.form_version_mp___1, NEW.form_version_mp___2, NEW.form_version_mp___3, NEW.form_version_mp___4, NEW.form_label_del, NEW.form_version_del___1, NEW.form_version_del___2, NEW.form_version_del___3, NEW.form_version_del___4, NEW.form_version_del___5, NEW.form_version_del___6, NEW.form_version_del___7, NEW.form_label_6m, NEW.form_version_6m___1, NEW.form_version_6m___2, NEW.form_version_6m___3, NEW.form_version_6m___4, NEW.form_version_6m___5, NEW.form_version_6m___6, NEW.form_version_6m___7, NEW.form_version_6m___8, NEW.form_version_6m___9, NEW.form_version_6m___10, NEW.form_label_1y, NEW.form_version_1y___1, NEW.form_label_2y, NEW.form_version_2y___1, NEW.form_label_3y, NEW.form_version_3y___1, NEW.form_version_3y___2, NEW.form_version_3y___3, NEW.form_version_3y___4, NEW.form_version_3y___5, NEW.form_version_3y___6, NEW.form_version_3y___7, NEW.form_version_3y___8, NEW.form_version_3y___9, NEW.form_version_3y___10, NEW.form_version_3y___11, NEW.form_version_3y___12, NEW.form_version_3y___13, NEW.form_version_3y___14, NEW.form_label_4y, NEW.form_version_4y___1, NEW.form_label_5y, NEW.form_version_5y___1, NEW.form_label_6y, NEW.form_version_6y___1, NEW.form_label_7y, NEW.form_version_7y___1, NEW.form_version_7y___2, NEW.form_version_7y___3, NEW.form_version_7y___4, NEW.form_version_7y___5, NEW.form_version_7y___6, NEW.form_version_7y___7, NEW.form_version_7y___8, NEW.form_version_7y___9, NEW.form_version_7y___10, NEW.form_version_7y___11, NEW.form_version_7y___12, NEW.form_version_7y___13, NEW.form_version_7y___14, NEW.form_version_7y___15, NEW.form_version_7y___16, NEW.form_version_7y___17, NEW.form_label_8y, NEW.form_version_8y___1, NEW.form_label_9y, NEW.form_version_9y___1, NEW.form_version_9y___2, NEW.form_label_10y, NEW.form_version_10y___1, NEW.form_version_10y___2, NEW.form_label_11y, NEW.form_version_11y___1, NEW.form_version_11y___2, NEW.form_label_12y, NEW.form_version_12y___1, NEW.form_version_12y___2, NEW.form_version_12y___3, NEW.form_version_12y___4, NEW.form_version_12y___5, NEW.form_version_12y___6, NEW.form_version_12y___7, NEW.form_version_12y___8, NEW.form_version_12y___9, NEW.form_version_12y___10, NEW.form_version_12y___11, NEW.form_version_12y___12, NEW.form_version_12y___13, NEW.form_version_12y___14, NEW.form_version_12y___15, NEW.form_version_12y___16, NEW.form_label_14y, NEW.form_version_14y___1, NEW.form_version_14y___2, NEW.form_label_15y, NEW.form_version_15y___1, NEW.form_version_15y___2, NEW.form_label_16y, NEW.form_version_16y___1, NEW.form_version_16y___2, NEW.form_label_mt, NEW.form_version_mt, NEW.form_label_19y, NEW.form_version_19y___1, NEW.form_version_19y___2, NEW.not_time_specific, NEW.var_level, NEW.units, NEW.model_type, NEW.response_options, NEW.elig_sample, NEW.elig_n, NEW.actual_n, NEW.an_var, NEW.orig_deriv, NEW.corr_derived_yn___0, NEW.corr_derived_yn___1, NEW.der_varname, NEW.dervar_explain, NEW.orig_varnames, NEW.visitspecific_information_complete, NEW.visitspecific_information_timestamp, NEW.redcap_survey_identifier, NEW.redcap_repeat_instrument, NEW.redcap_repeat_instance,
    NEW.user_id,
    NEW.created_at,
    NEW.updated_at,
    NEW.id;
  RETURN NEW;
END;
$$;


--
-- Name: calc_var_stats_for_boolean(bigint); Type: FUNCTION; Schema: ref_data; Owner: -
--

CREATE FUNCTION ref_data.calc_var_stats_for_boolean(var_id bigint) RETURNS TABLE(variable_id bigint, variable text, results bigint[], labels character varying[], cat_counts jsonb, distincts bigint, completed bigint, total_recs bigint, "chart:" text)
    LANGUAGE plpgsql
    AS $_$
declare
sql text;
varrec record;
varname varchar;
BEGIN 
	
select * from ref_data.datadic_variables dv where id = var_id
into varrec;

varname := varrec.storage_varname;

raise notice '%1', varrec;
if varname is null then
  raise notice 'No matching storage variable name for variable %', (var_id);
  
  return;
end if;

sql := format($$
with n as (
    select %1$s
    from %3$s.%4$s
), 
c as (
	select %1$s::varchar cat, count(*) num
	from n
	group by %1$s
),
m as (
    select 
      (
        select array_to_json(array_agg(json_build_object(c.cat, c.num))) from c
        where c.cat is not null
      ) cat_counts_m,
      count(distinct %1$s)  distincts_m,
      count(%1$s) count_m,
      count(coalesce(%1$s, false)) recs_m
    from n
)
select
%5$s::bigint variable_id,
'%1$s' "variable",
array_agg(num) "results", 
array_agg(cat) "labels", 
cat_counts_m::jsonb "cat_counts",
distincts_m "distincts", -- distinct values
count_m  "completed",
recs_m "total_recs",
null "chart"
from 
c, m
where c.cat is not null
group by "variable",
 "cat_counts",
 "distincts",
 "completed",
 "total_recs"
 ;
$$
,
varname, varrec.variable_type, varrec.schema_or_path, varrec.table_or_file, var_id
);

return query execute sql;

return query execute sql;
exception when others then
raise notice '%', varrec;
raise notice '%', sqlerrm;
null;


end
$_$;


--
-- Name: calc_var_stats_for_categorical(bigint); Type: FUNCTION; Schema: ref_data; Owner: -
--

CREATE FUNCTION ref_data.calc_var_stats_for_categorical(var_id bigint) RETURNS TABLE(variable_id bigint, variable text, results bigint[], labels character varying[], cat_counts jsonb, distincts bigint, completed bigint, total_recs bigint, "chart:" text)
    LANGUAGE plpgsql
    AS $_$
declare
sql text;
varrec record;
varname varchar;
BEGIN 
	
select * from ref_data.datadic_variables dv where id = var_id
into varrec;

varname := varrec.storage_varname;

raise notice '%1', varrec;
if varname is null then
  raise notice 'No matching storage variable name for variable %', (var_id);
  
  return;
end if;

sql := format($$
with n as (
    select nullif(%1$s, '')::numeric  %1$s
    from %3$s.%4$s
), 
c as (
	select %1$s::varchar cat, count(*) num
	from n
	group by %1$s
	order by "cat"
),
m as (
    select 
      (
        select array_to_json(array_agg(json_build_object(c.cat, c.num))) from c
        where c.cat is not null
      ) cat_counts_m,
      count(distinct %1$s)  distincts_m,
      count(%1$s) count_m,
      count(coalesce(%1$s, 0)) recs_m
    from n
)
select
%5$s::bigint variable_id,
'%1$s' "variable",
array_agg(num) "results", 
array_agg(cat) "labels", 
cat_counts_m::jsonb "cat_counts",
distincts_m "distincts", -- distinct values
count_m  "completed",
recs_m "total_recs",
null "chart"
from 
c, m
where c.cat is not null
group by "variable",
 "cat_counts",
 "distincts",
 "completed",
 "total_recs"
 ;
$$
,
varname, varrec.variable_type, varrec.schema_or_path, varrec.table_or_file, var_id
);

return query execute sql;

return query execute sql;
exception when others then
raise notice '%', varrec;
raise notice '%', sqlerrm;
null;


end
$_$;


--
-- Name: calc_var_stats_for_numeric(bigint); Type: FUNCTION; Schema: ref_data; Owner: -
--

CREATE FUNCTION ref_data.calc_var_stats_for_numeric(var_id bigint) RETURNS TABLE(variable_id bigint, variable text, results bigint[], labels character varying[], min numeric, med numeric, max numeric, mean numeric, stddev numeric, distincts bigint, completed bigint, total_recs bigint, "chart:" text)
    LANGUAGE plpgsql
    AS $_$
declare
sql text;
varrec record;
varname varchar;
vardt varchar;
BEGIN 
	
select * 
from ref_data.datadic_variables dv 
inner join
information_schema."columns"
on dv.table_or_file = table_name and dv.schema_or_path = table_schema
and dv.storage_varname = column_name
where id = var_id
into varrec;

varname := varrec.storage_varname;
vardt := varrec.data_type;

if varname is null then
  raise notice 'No matching storage variable name for variable %', (var_id);
  
  return;
end if;

--raise notice 'ID: %', varrec.id;

sql := format($$
with n as (
    select 
$$ ||    
  case when vardt in ('varchar','character varying', 'text')
  then 
  $$ nullif(%1$s, '')::numeric $$
  else $$ %1$s::numeric $$
  end
|| $$ 
%1$s
    from %3$s.%4$s
), 
m as (
    select 
      min(%1$s) min_m, 
      max(%1$s) max_m,
      round((PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY %1$s))::numeric, 1) med_m,
      round(avg(%1$s)::numeric, 1) mean_m, 
      round(stddev_pop(%1$s)::numeric, 1) stddev_m,
      count(distinct %1$s)  distincts_m,
      count(%1$s) count_m,
      count(coalesce(%1$s, 0)) recs_m,
      12 buckets_m,
      (max(%1$s)-min(%1$s))/12 bin_width_m
    from n
)
select
%5$s::bigint variable_id,
'%1$s' "variable",
array_agg(num) "results", 
array_agg(bucket)::varchar[] "labels", 
min_m "min", 
med_m "med",
max_m "max", 
mean_m "mean", 
stddev_m "stddev",
distincts_m "distincts", -- distinct values
count_m  "completed",
recs_m "total_recs",
null "chart"
from 
(

  select 
  count(val) num, 
  --t.val val, 
  (round(min_m + ((bin-1) * bin_width_m),2))::varchar || ' - ' || (round(min_m + ((bin) * bin_width_m),2))::varchar "bucket"
  from
  (
    select generate_series(1,buckets_m+1) bin from m
  ) bins
  left join (
    select 
      width_bucket(%1$s, min_m, max_m+0.0000001, buckets_m) bucket, 
      %1$s val
    from n, m
    where %1$s is not null
  ) t on bins.bin = t.bucket
  cross join  m
  group by bin, min_m, bin_width_m
  order by bin
  
) vals, m
group by "variable",
 "min", 
 "med",
 "max", 
 "mean", 
 "stddev",
 "distincts",
 "completed",
 "total_recs"
 ;
$$
,
varname, varrec.variable_type, varrec.schema_or_path, varrec.table_or_file, var_id, vardt
);
--raise notice '%', sql;

return query execute sql;
exception when others then
raise notice '%', varrec;
raise notice '%', sqlerrm;
null;

end
$_$;


--
-- Name: log_datadic_variables_update(); Type: FUNCTION; Schema: ref_data; Owner: -
--

CREATE FUNCTION ref_data.log_datadic_variables_update() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO datadic_variable_history (
    
    study, source_name, source_type, domain, form_name, variable_name, variable_type, presentation_type, label, label_note, annotation, is_required, valid_type, valid_min, valid_max, multi_valid_choices, is_identifier, is_derived_var, multi_derived_from_id, doc_url, target_type, owner_email, classification, other_classification, multi_timepoints, equivalent_to_id, storage_type, db_or_fs, schema_or_path, table_or_file, disabled, admin_id, redcap_data_dictionary_id, position, section_id, sub_section_id, title, storage_varname, contributor_type, n_for_timepoints, notes,
    user_id,
    created_at,
    updated_at,
    datadic_variable_id)
  SELECT
    
    NEW.study, NEW.source_name, NEW.source_type, NEW.domain, NEW.form_name, NEW.variable_name, NEW.variable_type, NEW.presentation_type, NEW.label, NEW.label_note, NEW.annotation, NEW.is_required, NEW.valid_type, NEW.valid_min, NEW.valid_max, NEW.multi_valid_choices, NEW.is_identifier, NEW.is_derived_var, NEW.multi_derived_from_id, NEW.doc_url, NEW.target_type, NEW.owner_email, NEW.classification, NEW.other_classification, NEW.multi_timepoints, NEW.equivalent_to_id, NEW.storage_type, NEW.db_or_fs, NEW.schema_or_path, NEW.table_or_file, NEW.disabled, NEW.admin_id, NEW.redcap_data_dictionary_id, NEW.position, NEW.section_id, NEW.sub_section_id, NEW.title, NEW.storage_varname, NEW.contributor_type, NEW.n_for_timepoints, NEW.notes,
    NEW.user_id,
    NEW.created_at,
    NEW.updated_at,
    NEW.id;
  RETURN NEW;
END;
$$;


--
-- Name: redcap_data_collection_instrument_history_upd(); Type: FUNCTION; Schema: ref_data; Owner: -
--

CREATE FUNCTION ref_data.redcap_data_collection_instrument_history_upd() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO redcap_data_collection_instrument_history (
    redcap_project_admin_id, name, label,
    disabled,
    admin_id,
    created_at,
    updated_at,
    redcap_data_collection_instrument_id)
  SELECT
    NEW.redcap_project_admin_id, NEW.name, NEW.label,
    NEW.disabled,
    NEW.admin_id,
    NEW.created_at,
    NEW.updated_at,
    NEW.id;
  RETURN NEW;
END;
$$;


--
-- Name: redcap_project_user_history_upd(); Type: FUNCTION; Schema: ref_data; Owner: -
--

CREATE FUNCTION ref_data.redcap_project_user_history_upd() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO redcap_project_user_history (
    redcap_project_admin_id, username, email, expiration,
    disabled,
    admin_id,
    created_at,
    updated_at,
    redcap_project_user_id)
  SELECT
    NEW.redcap_project_admin_id, NEW.username, NEW.email, NEW.expiration,
    NEW.disabled,
    NEW.admin_id,
    NEW.created_at,
    NEW.updated_at,
    NEW.id;
  RETURN NEW;
END;
$$;


--
-- Name: model_references; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.model_references (
    id integer NOT NULL,
    from_record_type character varying,
    from_record_id integer,
    from_record_master_id integer,
    to_record_type character varying,
    to_record_id integer,
    to_record_master_id integer,
    user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    disabled boolean
);


--
-- Name: nfs_store_containers; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.nfs_store_containers (
    id integer NOT NULL,
    name character varying,
    user_id integer,
    app_type_id integer,
    nfs_store_container_id integer,
    master_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_by_user_id bigint
);


--
-- Name: activity_log_project_assignment_simple_test_history; Type: TABLE; Schema: dynamic; Owner: -
--

CREATE TABLE dynamic.activity_log_project_assignment_simple_test_history (
    id bigint NOT NULL,
    master_id bigint,
    project_assignment_id bigint,
    created_by_user_id bigint,
    next_step character varying,
    status character varying,
    event_time time without time zone,
    disabled boolean DEFAULT false,
    notes character varying,
    extra_log_type character varying,
    user_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    activity_log_project_assignment_simple_test_id bigint
);


--
-- Name: activity_log_project_assignment_simple_test_history_id_seq; Type: SEQUENCE; Schema: dynamic; Owner: -
--

CREATE SEQUENCE dynamic.activity_log_project_assignment_simple_test_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: activity_log_project_assignment_simple_test_history_id_seq; Type: SEQUENCE OWNED BY; Schema: dynamic; Owner: -
--

ALTER SEQUENCE dynamic.activity_log_project_assignment_simple_test_history_id_seq OWNED BY dynamic.activity_log_project_assignment_simple_test_history.id;


--
-- Name: activity_log_project_assignment_simple_tests; Type: TABLE; Schema: dynamic; Owner: -
--

CREATE TABLE dynamic.activity_log_project_assignment_simple_tests (
    id bigint NOT NULL,
    master_id bigint,
    project_assignment_id bigint,
    created_by_user_id bigint,
    next_step character varying,
    status character varying,
    event_time time without time zone,
    disabled boolean DEFAULT false,
    notes character varying,
    extra_log_type character varying,
    user_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: TABLE activity_log_project_assignment_simple_tests; Type: COMMENT; Schema: dynamic; Owner: -
--

COMMENT ON TABLE dynamic.activity_log_project_assignment_simple_tests IS 'Activitylog: Simple Test';


--
-- Name: activity_log_project_assignment_simple_tests_id_seq; Type: SEQUENCE; Schema: dynamic; Owner: -
--

CREATE SEQUENCE dynamic.activity_log_project_assignment_simple_tests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: activity_log_project_assignment_simple_tests_id_seq; Type: SEQUENCE OWNED BY; Schema: dynamic; Owner: -
--

ALTER SEQUENCE dynamic.activity_log_project_assignment_simple_tests_id_seq OWNED BY dynamic.activity_log_project_assignment_simple_tests.id;


--
-- Name: al_project_assignment_work_products_from_al_project_assignment_; Type: VIEW; Schema: dynamic; Owner: -
--

CREATE VIEW dynamic.al_project_assignment_work_products_from_al_project_assignment_ AS
 SELECT dest.id,
    dest.master_id,
    dest.project_assignment_id,
    dest.created_by_user_id,
    dest.next_step,
    dest.status,
    dest.disabled,
    dest.event_time,
    dest.notes,
    dest.extra_log_type,
    dest.user_id,
    dest.created_at,
    dest.updated_at,
    mr.from_record_master_id,
    mr.from_record_type,
    mr.from_record_id,
    mr.id AS model_reference_id,
    'projects.activity_log_project_assignment_work_products'::character varying AS from_table
   FROM (projects.activity_log_project_assignment_work_products dest
     JOIN ml_app.model_references mr ON (((dest.id = mr.to_record_id) AND (dest.master_id = mr.to_record_master_id) AND (NOT COALESCE(mr.disabled, false)) AND ((mr.from_record_type)::text = 'ActivityLog::ProjectAssignmentSimpleTest'::text) AND ((mr.to_record_type)::text = 'ActivityLog::ProjectAssignmentWorkProduct'::text))));


--
-- Name: nfs_store_containers_from_al_project_assignment_simple_tests; Type: VIEW; Schema: dynamic; Owner: -
--

CREATE VIEW dynamic.nfs_store_containers_from_al_project_assignment_simple_tests AS
 SELECT dest.id,
    dest.name,
    dest.user_id,
    dest.app_type_id,
    dest.nfs_store_container_id,
    dest.master_id,
    dest.created_at,
    dest.updated_at,
    dest.created_by_user_id,
    mr.from_record_master_id,
    mr.from_record_type,
    mr.from_record_id,
    mr.id AS model_reference_id,
    'nfs_store_containers'::character varying AS from_table
   FROM (ml_app.nfs_store_containers dest
     JOIN ml_app.model_references mr ON (((dest.id = mr.to_record_id) AND (dest.master_id = mr.to_record_master_id) AND (NOT COALESCE(mr.disabled, false)) AND ((mr.from_record_type)::text = 'ActivityLog::ProjectAssignmentSimpleTest'::text) AND ((mr.to_record_type)::text = 'NfsStore::Manage::Container'::text))));


--
-- Name: project_import_history; Type: TABLE; Schema: dynamic; Owner: -
--

CREATE TABLE dynamic.project_import_history (
    id bigint NOT NULL,
    master_id bigint,
    ap_title character varying,
    investigator_name character varying,
    co_i_mentor character varying,
    ap_presentation_date date,
    meeting_ap_presented character varying,
    approval_status character varying,
    irb_title character varying,
    irb_status character varying,
    cv character varying,
    citi_equiv character varying,
    ack character varying,
    data_ready character varying,
    data_update_date date,
    meeting_data_update character varying,
    data_update2_date date,
    meeting_data_update2 character varying,
    grant_association character varying,
    publication_1 character varying,
    publication_2 character varying,
    notes character varying,
    investigator_name2 character varying,
    orig_id integer,
    import_status character varying,
    user_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    project_import_id bigint,
    sci_approval_status character varying
);


--
-- Name: COLUMN project_import_history.ap_title; Type: COMMENT; Schema: dynamic; Owner: -
--

COMMENT ON COLUMN dynamic.project_import_history.ap_title IS 'AP Title';


--
-- Name: COLUMN project_import_history.investigator_name; Type: COMMENT; Schema: dynamic; Owner: -
--

COMMENT ON COLUMN dynamic.project_import_history.investigator_name IS 'Investigator Name';


--
-- Name: COLUMN project_import_history.co_i_mentor; Type: COMMENT; Schema: dynamic; Owner: -
--

COMMENT ON COLUMN dynamic.project_import_history.co_i_mentor IS 'Co-I Mentor';


--
-- Name: COLUMN project_import_history.ap_presentation_date; Type: COMMENT; Schema: dynamic; Owner: -
--

COMMENT ON COLUMN dynamic.project_import_history.ap_presentation_date IS 'AP Presentation Date';


--
-- Name: COLUMN project_import_history.meeting_ap_presented; Type: COMMENT; Schema: dynamic; Owner: -
--

COMMENT ON COLUMN dynamic.project_import_history.meeting_ap_presented IS 'AP Presentation Meeting';


--
-- Name: COLUMN project_import_history.approval_status; Type: COMMENT; Schema: dynamic; Owner: -
--

COMMENT ON COLUMN dynamic.project_import_history.approval_status IS 'Approval Status';


--
-- Name: COLUMN project_import_history.irb_title; Type: COMMENT; Schema: dynamic; Owner: -
--

COMMENT ON COLUMN dynamic.project_import_history.irb_title IS 'IRB Title';


--
-- Name: COLUMN project_import_history.irb_status; Type: COMMENT; Schema: dynamic; Owner: -
--

COMMENT ON COLUMN dynamic.project_import_history.irb_status IS 'IRB Status';


--
-- Name: COLUMN project_import_history.cv; Type: COMMENT; Schema: dynamic; Owner: -
--

COMMENT ON COLUMN dynamic.project_import_history.cv IS 'CV';


--
-- Name: COLUMN project_import_history.citi_equiv; Type: COMMENT; Schema: dynamic; Owner: -
--

COMMENT ON COLUMN dynamic.project_import_history.citi_equiv IS 'Citi Equiv.';


--
-- Name: COLUMN project_import_history.ack; Type: COMMENT; Schema: dynamic; Owner: -
--

COMMENT ON COLUMN dynamic.project_import_history.ack IS 'Ack';


--
-- Name: COLUMN project_import_history.data_ready; Type: COMMENT; Schema: dynamic; Owner: -
--

COMMENT ON COLUMN dynamic.project_import_history.data_ready IS 'Data Ready';


--
-- Name: COLUMN project_import_history.data_update_date; Type: COMMENT; Schema: dynamic; Owner: -
--

COMMENT ON COLUMN dynamic.project_import_history.data_update_date IS 'Data Update Date';


--
-- Name: COLUMN project_import_history.meeting_data_update; Type: COMMENT; Schema: dynamic; Owner: -
--

COMMENT ON COLUMN dynamic.project_import_history.meeting_data_update IS 'Data Update Meeting';


--
-- Name: COLUMN project_import_history.data_update2_date; Type: COMMENT; Schema: dynamic; Owner: -
--

COMMENT ON COLUMN dynamic.project_import_history.data_update2_date IS 'Data Update Date 2';


--
-- Name: COLUMN project_import_history.meeting_data_update2; Type: COMMENT; Schema: dynamic; Owner: -
--

COMMENT ON COLUMN dynamic.project_import_history.meeting_data_update2 IS 'Data Update Meeting 2';


--
-- Name: COLUMN project_import_history.grant_association; Type: COMMENT; Schema: dynamic; Owner: -
--

COMMENT ON COLUMN dynamic.project_import_history.grant_association IS 'Grant Association';


--
-- Name: COLUMN project_import_history.publication_1; Type: COMMENT; Schema: dynamic; Owner: -
--

COMMENT ON COLUMN dynamic.project_import_history.publication_1 IS 'Publication 1';


--
-- Name: COLUMN project_import_history.publication_2; Type: COMMENT; Schema: dynamic; Owner: -
--

COMMENT ON COLUMN dynamic.project_import_history.publication_2 IS 'Publication 2';


--
-- Name: COLUMN project_import_history.notes; Type: COMMENT; Schema: dynamic; Owner: -
--

COMMENT ON COLUMN dynamic.project_import_history.notes IS 'Notes';


--
-- Name: COLUMN project_import_history.investigator_name2; Type: COMMENT; Schema: dynamic; Owner: -
--

COMMENT ON COLUMN dynamic.project_import_history.investigator_name2 IS 'Investigator Name 2';


--
-- Name: COLUMN project_import_history.orig_id; Type: COMMENT; Schema: dynamic; Owner: -
--

COMMENT ON COLUMN dynamic.project_import_history.orig_id IS 'Original ID';


--
-- Name: COLUMN project_import_history.import_status; Type: COMMENT; Schema: dynamic; Owner: -
--

COMMENT ON COLUMN dynamic.project_import_history.import_status IS 'Import Status';


--
-- Name: project_import_history_id_seq; Type: SEQUENCE; Schema: dynamic; Owner: -
--

CREATE SEQUENCE dynamic.project_import_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: project_import_history_id_seq; Type: SEQUENCE OWNED BY; Schema: dynamic; Owner: -
--

ALTER SEQUENCE dynamic.project_import_history_id_seq OWNED BY dynamic.project_import_history.id;


--
-- Name: project_imports; Type: TABLE; Schema: dynamic; Owner: -
--

CREATE TABLE dynamic.project_imports (
    id bigint NOT NULL,
    master_id bigint,
    ap_title character varying,
    investigator_name character varying,
    co_i_mentor character varying,
    ap_presentation_date date,
    meeting_ap_presented character varying,
    approval_status character varying,
    irb_title character varying,
    irb_status character varying,
    cv character varying,
    citi_equiv character varying,
    ack character varying,
    data_ready character varying,
    data_update_date date,
    meeting_data_update character varying,
    data_update2_date date,
    meeting_data_update2 character varying,
    grant_association character varying,
    publication_1 character varying,
    publication_2 character varying,
    notes character varying,
    investigator_name2 character varying,
    orig_id integer,
    import_status character varying,
    user_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    sci_approval_status character varying
);


--
-- Name: TABLE project_imports; Type: COMMENT; Schema: dynamic; Owner: -
--

COMMENT ON TABLE dynamic.project_imports IS 'Project Imports';


--
-- Name: COLUMN project_imports.ap_title; Type: COMMENT; Schema: dynamic; Owner: -
--

COMMENT ON COLUMN dynamic.project_imports.ap_title IS 'AP Title';


--
-- Name: COLUMN project_imports.investigator_name; Type: COMMENT; Schema: dynamic; Owner: -
--

COMMENT ON COLUMN dynamic.project_imports.investigator_name IS 'Investigator Name';


--
-- Name: COLUMN project_imports.co_i_mentor; Type: COMMENT; Schema: dynamic; Owner: -
--

COMMENT ON COLUMN dynamic.project_imports.co_i_mentor IS 'Co-I Mentor';


--
-- Name: COLUMN project_imports.ap_presentation_date; Type: COMMENT; Schema: dynamic; Owner: -
--

COMMENT ON COLUMN dynamic.project_imports.ap_presentation_date IS 'AP Presentation Date';


--
-- Name: COLUMN project_imports.meeting_ap_presented; Type: COMMENT; Schema: dynamic; Owner: -
--

COMMENT ON COLUMN dynamic.project_imports.meeting_ap_presented IS 'AP Presentation Meeting';


--
-- Name: COLUMN project_imports.approval_status; Type: COMMENT; Schema: dynamic; Owner: -
--

COMMENT ON COLUMN dynamic.project_imports.approval_status IS 'Approval Status';


--
-- Name: COLUMN project_imports.irb_title; Type: COMMENT; Schema: dynamic; Owner: -
--

COMMENT ON COLUMN dynamic.project_imports.irb_title IS 'IRB Title';


--
-- Name: COLUMN project_imports.irb_status; Type: COMMENT; Schema: dynamic; Owner: -
--

COMMENT ON COLUMN dynamic.project_imports.irb_status IS 'IRB Status';


--
-- Name: COLUMN project_imports.cv; Type: COMMENT; Schema: dynamic; Owner: -
--

COMMENT ON COLUMN dynamic.project_imports.cv IS 'CV';


--
-- Name: COLUMN project_imports.citi_equiv; Type: COMMENT; Schema: dynamic; Owner: -
--

COMMENT ON COLUMN dynamic.project_imports.citi_equiv IS 'Citi Equiv.';


--
-- Name: COLUMN project_imports.ack; Type: COMMENT; Schema: dynamic; Owner: -
--

COMMENT ON COLUMN dynamic.project_imports.ack IS 'Ack';


--
-- Name: COLUMN project_imports.data_ready; Type: COMMENT; Schema: dynamic; Owner: -
--

COMMENT ON COLUMN dynamic.project_imports.data_ready IS 'Data Ready';


--
-- Name: COLUMN project_imports.data_update_date; Type: COMMENT; Schema: dynamic; Owner: -
--

COMMENT ON COLUMN dynamic.project_imports.data_update_date IS 'Data Update Date';


--
-- Name: COLUMN project_imports.meeting_data_update; Type: COMMENT; Schema: dynamic; Owner: -
--

COMMENT ON COLUMN dynamic.project_imports.meeting_data_update IS 'Data Update Meeting';


--
-- Name: COLUMN project_imports.data_update2_date; Type: COMMENT; Schema: dynamic; Owner: -
--

COMMENT ON COLUMN dynamic.project_imports.data_update2_date IS 'Data Update Date 2';


--
-- Name: COLUMN project_imports.meeting_data_update2; Type: COMMENT; Schema: dynamic; Owner: -
--

COMMENT ON COLUMN dynamic.project_imports.meeting_data_update2 IS 'Data Update Meeting 2';


--
-- Name: COLUMN project_imports.grant_association; Type: COMMENT; Schema: dynamic; Owner: -
--

COMMENT ON COLUMN dynamic.project_imports.grant_association IS 'Grant Association';


--
-- Name: COLUMN project_imports.publication_1; Type: COMMENT; Schema: dynamic; Owner: -
--

COMMENT ON COLUMN dynamic.project_imports.publication_1 IS 'Publication 1';


--
-- Name: COLUMN project_imports.publication_2; Type: COMMENT; Schema: dynamic; Owner: -
--

COMMENT ON COLUMN dynamic.project_imports.publication_2 IS 'Publication 2';


--
-- Name: COLUMN project_imports.notes; Type: COMMENT; Schema: dynamic; Owner: -
--

COMMENT ON COLUMN dynamic.project_imports.notes IS 'Notes';


--
-- Name: COLUMN project_imports.investigator_name2; Type: COMMENT; Schema: dynamic; Owner: -
--

COMMENT ON COLUMN dynamic.project_imports.investigator_name2 IS 'Investigator Name 2';


--
-- Name: COLUMN project_imports.orig_id; Type: COMMENT; Schema: dynamic; Owner: -
--

COMMENT ON COLUMN dynamic.project_imports.orig_id IS 'Original ID';


--
-- Name: COLUMN project_imports.import_status; Type: COMMENT; Schema: dynamic; Owner: -
--

COMMENT ON COLUMN dynamic.project_imports.import_status IS 'Import Status';


--
-- Name: project_imports_id_seq; Type: SEQUENCE; Schema: dynamic; Owner: -
--

CREATE SEQUENCE dynamic.project_imports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: project_imports_id_seq; Type: SEQUENCE OWNED BY; Schema: dynamic; Owner: -
--

ALTER SEQUENCE dynamic.project_imports_id_seq OWNED BY dynamic.project_imports.id;


--
-- Name: project_pubmed_recs_from_al_project_assignment_simple_tests; Type: VIEW; Schema: dynamic; Owner: -
--

CREATE VIEW dynamic.project_pubmed_recs_from_al_project_assignment_simple_tests AS
 SELECT dest.id,
    dest.master_id,
    dest.pmid,
    dest.status,
    dest.pubmed_json,
    dest.user_id,
    dest.created_at,
    dest.updated_at,
    dest.abstract,
    dest.article_title,
    dest.retrieved_pmid,
    dest.citation_text,
    dest.citation_json,
    dest.c_status,
    dest.pmcid,
    dest.ids_json,
    dest.ids_status,
    dest.grant_list_json,
    mr.from_record_master_id,
    mr.from_record_type,
    mr.from_record_id,
    mr.id AS model_reference_id,
    'projects.project_pubmed_recs'::character varying AS from_table
   FROM (projects.project_pubmed_recs dest
     JOIN ml_app.model_references mr ON (((dest.id = mr.to_record_id) AND (dest.master_id = mr.to_record_master_id) AND (NOT COALESCE(mr.disabled, false)) AND ((mr.from_record_type)::text = 'ActivityLog::ProjectAssignmentSimpleTest'::text) AND ((mr.to_record_type)::text = 'DynamicModel::ProjectPubmedRec'::text))));


--
-- Name: publications_from_al_project_assignment_simple_tests; Type: VIEW; Schema: dynamic; Owner: -
--

CREATE VIEW dynamic.publications_from_al_project_assignment_simple_tests AS
 SELECT dest.id,
    dest.master_id,
    dest.select_type,
    dest.other_type,
    dest.title,
    dest.summary_details,
    dest.citation_details,
    dest.pubmed_url,
    dest.tag_select_pub_tags,
    dest.keywords,
    dest.status,
    dest.user_id,
    dest.created_at,
    dest.updated_at,
    dest.date_published,
    dest.created_by_user_id,
    dest.pmid,
    dest.pmcidtext,
    dest.grant_list_json,
    mr.from_record_master_id,
    mr.from_record_type,
    mr.from_record_id,
    mr.id AS model_reference_id,
    'projects.publications'::character varying AS from_table
   FROM (projects.publications dest
     JOIN ml_app.model_references mr ON (((dest.id = mr.to_record_id) AND (dest.master_id = mr.to_record_master_id) AND (NOT COALESCE(mr.disabled, false)) AND ((mr.from_record_type)::text = 'ActivityLog::ProjectAssignmentSimpleTest'::text) AND ((mr.to_record_type)::text = 'DynamicModel::Publication'::text))));


--
-- Name: test_field_history; Type: TABLE; Schema: dynamic; Owner: -
--

CREATE TABLE dynamic.test_field_history (
    id bigint NOT NULL,
    test_id bigint,
    test_boolean boolean,
    test_integer integer,
    test_float double precision,
    test_decimal numeric,
    test_date date,
    test_datetime timestamp without time zone,
    test_at timestamp without time zone,
    test_yes_no character varying,
    test_no_yes character varying,
    user_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    test_field_id bigint,
    tag_select_record_id_from_dynamic_model__test_field integer[],
    tag_select_record_from_dynamic_model__test_field character varying[],
    select_record_from_dynamic_model__test_field character varying,
    select_record_from_table_dynamic_model__test_field character varying,
    master_id bigint
);


--
-- Name: test_field_history_id_seq; Type: SEQUENCE; Schema: dynamic; Owner: -
--

CREATE SEQUENCE dynamic.test_field_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: test_field_history_id_seq; Type: SEQUENCE OWNED BY; Schema: dynamic; Owner: -
--

ALTER SEQUENCE dynamic.test_field_history_id_seq OWNED BY dynamic.test_field_history.id;


--
-- Name: test_fields; Type: TABLE; Schema: dynamic; Owner: -
--

CREATE TABLE dynamic.test_fields (
    id bigint NOT NULL,
    test_id bigint,
    test_boolean boolean,
    test_integer integer,
    test_float double precision,
    test_decimal numeric,
    test_date date,
    test_datetime timestamp without time zone,
    test_at timestamp without time zone,
    test_yes_no character varying,
    test_no_yes character varying,
    user_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    tag_select_record_id_from_dynamic_model__test_field integer[],
    tag_select_record_from_dynamic_model__test_field character varying[],
    select_record_from_dynamic_model__test_field character varying,
    select_record_from_table_dynamic_model__test_field character varying,
    master_id bigint
);


--
-- Name: TABLE test_fields; Type: COMMENT; Schema: dynamic; Owner: -
--

COMMENT ON TABLE dynamic.test_fields IS 'Dynamicmodel: Field Test';


--
-- Name: test_fields_id_seq; Type: SEQUENCE; Schema: dynamic; Owner: -
--

CREATE SEQUENCE dynamic.test_fields_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: test_fields_id_seq; Type: SEQUENCE OWNED BY; Schema: dynamic; Owner: -
--

ALTER SEQUENCE dynamic.test_fields_id_seq OWNED BY dynamic.test_fields.id;


--
-- Name: test_history; Type: TABLE; Schema: dynamic; Owner: -
--

CREATE TABLE dynamic.test_history (
    id bigint NOT NULL,
    user_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    test_id bigint
);


--
-- Name: test_history_id_seq; Type: SEQUENCE; Schema: dynamic; Owner: -
--

CREATE SEQUENCE dynamic.test_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: test_history_id_seq; Type: SEQUENCE OWNED BY; Schema: dynamic; Owner: -
--

ALTER SEQUENCE dynamic.test_history_id_seq OWNED BY dynamic.test_history.id;


--
-- Name: test_model_b_embed_history; Type: TABLE; Schema: dynamic; Owner: -
--

CREATE TABLE dynamic.test_model_b_embed_history (
    id bigint NOT NULL,
    master_id bigint,
    first_name character varying,
    last_name character varying,
    embed_resource_name character varying,
    embed_resource_id bigint,
    user_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    test_model_b_embed_id bigint
);


--
-- Name: test_model_b_embed_history_id_seq; Type: SEQUENCE; Schema: dynamic; Owner: -
--

CREATE SEQUENCE dynamic.test_model_b_embed_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: test_model_b_embed_history_id_seq; Type: SEQUENCE OWNED BY; Schema: dynamic; Owner: -
--

ALTER SEQUENCE dynamic.test_model_b_embed_history_id_seq OWNED BY dynamic.test_model_b_embed_history.id;


--
-- Name: test_model_b_embed_rec_history; Type: TABLE; Schema: dynamic; Owner: -
--

CREATE TABLE dynamic.test_model_b_embed_rec_history (
    id bigint NOT NULL,
    master_id bigint,
    street_address character varying,
    city character varying,
    user_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    test_model_b_embed_rec_id bigint
);


--
-- Name: test_model_b_embed_rec_history_id_seq; Type: SEQUENCE; Schema: dynamic; Owner: -
--

CREATE SEQUENCE dynamic.test_model_b_embed_rec_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: test_model_b_embed_rec_history_id_seq; Type: SEQUENCE OWNED BY; Schema: dynamic; Owner: -
--

ALTER SEQUENCE dynamic.test_model_b_embed_rec_history_id_seq OWNED BY dynamic.test_model_b_embed_rec_history.id;


--
-- Name: test_model_b_embed_recs; Type: TABLE; Schema: dynamic; Owner: -
--

CREATE TABLE dynamic.test_model_b_embed_recs (
    id bigint NOT NULL,
    master_id bigint,
    street_address character varying,
    city character varying,
    user_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: TABLE test_model_b_embed_recs; Type: COMMENT; Schema: dynamic; Owner: -
--

COMMENT ON TABLE dynamic.test_model_b_embed_recs IS 'Dynamicmodel: Test Model B Embed Rec';


--
-- Name: test_model_b_embed_recs_id_seq; Type: SEQUENCE; Schema: dynamic; Owner: -
--

CREATE SEQUENCE dynamic.test_model_b_embed_recs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: test_model_b_embed_recs_id_seq; Type: SEQUENCE OWNED BY; Schema: dynamic; Owner: -
--

ALTER SEQUENCE dynamic.test_model_b_embed_recs_id_seq OWNED BY dynamic.test_model_b_embed_recs.id;


--
-- Name: test_model_b_embeds; Type: TABLE; Schema: dynamic; Owner: -
--

CREATE TABLE dynamic.test_model_b_embeds (
    id bigint NOT NULL,
    master_id bigint,
    first_name character varying,
    last_name character varying,
    embed_resource_name character varying,
    embed_resource_id bigint,
    user_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: TABLE test_model_b_embeds; Type: COMMENT; Schema: dynamic; Owner: -
--

COMMENT ON TABLE dynamic.test_model_b_embeds IS 'Dynamicmodel: Test Model Embed';


--
-- Name: test_model_b_embeds_id_seq; Type: SEQUENCE; Schema: dynamic; Owner: -
--

CREATE SEQUENCE dynamic.test_model_b_embeds_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: test_model_b_embeds_id_seq; Type: SEQUENCE OWNED BY; Schema: dynamic; Owner: -
--

ALTER SEQUENCE dynamic.test_model_b_embeds_id_seq OWNED BY dynamic.test_model_b_embeds.id;


--
-- Name: test_model_c_embed_history; Type: TABLE; Schema: dynamic; Owner: -
--

CREATE TABLE dynamic.test_model_c_embed_history (
    id bigint NOT NULL,
    master_id bigint,
    first_name character varying,
    last_name character varying,
    user_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    test_model_c_embed_id bigint
);


--
-- Name: test_model_c_embed_history_id_seq; Type: SEQUENCE; Schema: dynamic; Owner: -
--

CREATE SEQUENCE dynamic.test_model_c_embed_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: test_model_c_embed_history_id_seq; Type: SEQUENCE OWNED BY; Schema: dynamic; Owner: -
--

ALTER SEQUENCE dynamic.test_model_c_embed_history_id_seq OWNED BY dynamic.test_model_c_embed_history.id;


--
-- Name: test_model_c_embed_rec_history; Type: TABLE; Schema: dynamic; Owner: -
--

CREATE TABLE dynamic.test_model_c_embed_rec_history (
    id bigint NOT NULL,
    master_id bigint,
    street_address character varying,
    city character varying,
    user_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    test_model_c_embed_rec_id bigint,
    test_model_c_embed_id bigint
);


--
-- Name: test_model_c_embed_rec_history_id_seq; Type: SEQUENCE; Schema: dynamic; Owner: -
--

CREATE SEQUENCE dynamic.test_model_c_embed_rec_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: test_model_c_embed_rec_history_id_seq; Type: SEQUENCE OWNED BY; Schema: dynamic; Owner: -
--

ALTER SEQUENCE dynamic.test_model_c_embed_rec_history_id_seq OWNED BY dynamic.test_model_c_embed_rec_history.id;


--
-- Name: test_model_c_embed_recs; Type: TABLE; Schema: dynamic; Owner: -
--

CREATE TABLE dynamic.test_model_c_embed_recs (
    id bigint NOT NULL,
    master_id bigint,
    street_address character varying,
    city character varying,
    user_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    test_model_c_embed_id bigint
);


--
-- Name: TABLE test_model_c_embed_recs; Type: COMMENT; Schema: dynamic; Owner: -
--

COMMENT ON TABLE dynamic.test_model_c_embed_recs IS 'Dynamicmodel: Test Model C Embed Rec';


--
-- Name: test_model_c_embed_recs_id_seq; Type: SEQUENCE; Schema: dynamic; Owner: -
--

CREATE SEQUENCE dynamic.test_model_c_embed_recs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: test_model_c_embed_recs_id_seq; Type: SEQUENCE OWNED BY; Schema: dynamic; Owner: -
--

ALTER SEQUENCE dynamic.test_model_c_embed_recs_id_seq OWNED BY dynamic.test_model_c_embed_recs.id;


--
-- Name: test_model_c_embeds; Type: TABLE; Schema: dynamic; Owner: -
--

CREATE TABLE dynamic.test_model_c_embeds (
    id bigint NOT NULL,
    master_id bigint,
    first_name character varying,
    last_name character varying,
    user_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: TABLE test_model_c_embeds; Type: COMMENT; Schema: dynamic; Owner: -
--

COMMENT ON TABLE dynamic.test_model_c_embeds IS 'Dynamicmodel: Test Model Embed';


--
-- Name: test_model_c_embeds_id_seq; Type: SEQUENCE; Schema: dynamic; Owner: -
--

CREATE SEQUENCE dynamic.test_model_c_embeds_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: test_model_c_embeds_id_seq; Type: SEQUENCE OWNED BY; Schema: dynamic; Owner: -
--

ALTER SEQUENCE dynamic.test_model_c_embeds_id_seq OWNED BY dynamic.test_model_c_embeds.id;


--
-- Name: test_model_embed_history; Type: TABLE; Schema: dynamic; Owner: -
--

CREATE TABLE dynamic.test_model_embed_history (
    id bigint NOT NULL,
    master_id bigint,
    first_name character varying,
    last_name character varying,
    user_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    test_model_embed_id bigint
);


--
-- Name: test_model_embed_history_id_seq; Type: SEQUENCE; Schema: dynamic; Owner: -
--

CREATE SEQUENCE dynamic.test_model_embed_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: test_model_embed_history_id_seq; Type: SEQUENCE OWNED BY; Schema: dynamic; Owner: -
--

ALTER SEQUENCE dynamic.test_model_embed_history_id_seq OWNED BY dynamic.test_model_embed_history.id;


--
-- Name: test_model_embed_rec_history; Type: TABLE; Schema: dynamic; Owner: -
--

CREATE TABLE dynamic.test_model_embed_rec_history (
    id bigint NOT NULL,
    master_id bigint,
    street_address character varying,
    city character varying,
    test_model_embed_id bigint,
    user_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    test_model_embed_rec_id bigint
);


--
-- Name: test_model_embed_rec_history_id_seq; Type: SEQUENCE; Schema: dynamic; Owner: -
--

CREATE SEQUENCE dynamic.test_model_embed_rec_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: test_model_embed_rec_history_id_seq; Type: SEQUENCE OWNED BY; Schema: dynamic; Owner: -
--

ALTER SEQUENCE dynamic.test_model_embed_rec_history_id_seq OWNED BY dynamic.test_model_embed_rec_history.id;


--
-- Name: test_model_embed_recs; Type: TABLE; Schema: dynamic; Owner: -
--

CREATE TABLE dynamic.test_model_embed_recs (
    id bigint NOT NULL,
    master_id bigint,
    street_address character varying,
    city character varying,
    test_model_embed_id bigint,
    user_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: TABLE test_model_embed_recs; Type: COMMENT; Schema: dynamic; Owner: -
--

COMMENT ON TABLE dynamic.test_model_embed_recs IS 'Dynamicmodel: Test Model Embed Rec';


--
-- Name: test_model_embed_recs_id_seq; Type: SEQUENCE; Schema: dynamic; Owner: -
--

CREATE SEQUENCE dynamic.test_model_embed_recs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: test_model_embed_recs_id_seq; Type: SEQUENCE OWNED BY; Schema: dynamic; Owner: -
--

ALTER SEQUENCE dynamic.test_model_embed_recs_id_seq OWNED BY dynamic.test_model_embed_recs.id;


--
-- Name: test_model_embeds; Type: TABLE; Schema: dynamic; Owner: -
--

CREATE TABLE dynamic.test_model_embeds (
    id bigint NOT NULL,
    master_id bigint,
    first_name character varying,
    last_name character varying,
    user_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: TABLE test_model_embeds; Type: COMMENT; Schema: dynamic; Owner: -
--

COMMENT ON TABLE dynamic.test_model_embeds IS 'Dynamicmodel: Test Model Embed';


--
-- Name: test_model_embeds_id_seq; Type: SEQUENCE; Schema: dynamic; Owner: -
--

CREATE SEQUENCE dynamic.test_model_embeds_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: test_model_embeds_id_seq; Type: SEQUENCE OWNED BY; Schema: dynamic; Owner: -
--

ALTER SEQUENCE dynamic.test_model_embeds_id_seq OWNED BY dynamic.test_model_embeds.id;


--
-- Name: test_ref_history; Type: TABLE; Schema: dynamic; Owner: -
--

CREATE TABLE dynamic.test_ref_history (
    id bigint NOT NULL,
    test1 character varying,
    user_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    test_ref_id bigint
);


--
-- Name: test_ref_history_id_seq; Type: SEQUENCE; Schema: dynamic; Owner: -
--

CREATE SEQUENCE dynamic.test_ref_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: test_ref_history_id_seq; Type: SEQUENCE OWNED BY; Schema: dynamic; Owner: -
--

ALTER SEQUENCE dynamic.test_ref_history_id_seq OWNED BY dynamic.test_ref_history.id;


--
-- Name: test_reference_history; Type: TABLE; Schema: dynamic; Owner: -
--

CREATE TABLE dynamic.test_reference_history (
    id bigint NOT NULL,
    master_id bigint,
    first_name character varying,
    last_name character varying,
    user_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    test_reference_id bigint
);


--
-- Name: test_reference_history_id_seq; Type: SEQUENCE; Schema: dynamic; Owner: -
--

CREATE SEQUENCE dynamic.test_reference_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: test_reference_history_id_seq; Type: SEQUENCE OWNED BY; Schema: dynamic; Owner: -
--

ALTER SEQUENCE dynamic.test_reference_history_id_seq OWNED BY dynamic.test_reference_history.id;


--
-- Name: test_references; Type: TABLE; Schema: dynamic; Owner: -
--

CREATE TABLE dynamic.test_references (
    id bigint NOT NULL,
    master_id bigint,
    first_name character varying,
    last_name character varying,
    user_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: TABLE test_references; Type: COMMENT; Schema: dynamic; Owner: -
--

COMMENT ON TABLE dynamic.test_references IS 'Dynamicmodel: Test Model Reference';


--
-- Name: test_references_id_seq; Type: SEQUENCE; Schema: dynamic; Owner: -
--

CREATE SEQUENCE dynamic.test_references_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: test_references_id_seq; Type: SEQUENCE OWNED BY; Schema: dynamic; Owner: -
--

ALTER SEQUENCE dynamic.test_references_id_seq OWNED BY dynamic.test_references.id;


--
-- Name: test_refs; Type: TABLE; Schema: dynamic; Owner: -
--

CREATE TABLE dynamic.test_refs (
    id bigint NOT NULL,
    test1 character varying,
    user_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: TABLE test_refs; Type: COMMENT; Schema: dynamic; Owner: -
--

COMMENT ON TABLE dynamic.test_refs IS 'Dynamicmodel: Test Ref';


--
-- Name: test_refs_id_seq; Type: SEQUENCE; Schema: dynamic; Owner: -
--

CREATE SEQUENCE dynamic.test_refs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: test_refs_id_seq; Type: SEQUENCE OWNED BY; Schema: dynamic; Owner: -
--

ALTER SEQUENCE dynamic.test_refs_id_seq OWNED BY dynamic.test_refs.id;


--
-- Name: test_time_history; Type: TABLE; Schema: dynamic; Owner: -
--

CREATE TABLE dynamic.test_time_history (
    id bigint NOT NULL,
    test_time time without time zone,
    test2_time time without time zone,
    test_date date,
    timezone character varying,
    user_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    test_time_id bigint
);


--
-- Name: test_time_history_id_seq; Type: SEQUENCE; Schema: dynamic; Owner: -
--

CREATE SEQUENCE dynamic.test_time_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: test_time_history_id_seq; Type: SEQUENCE OWNED BY; Schema: dynamic; Owner: -
--

ALTER SEQUENCE dynamic.test_time_history_id_seq OWNED BY dynamic.test_time_history.id;


--
-- Name: test_times; Type: TABLE; Schema: dynamic; Owner: -
--

CREATE TABLE dynamic.test_times (
    id bigint NOT NULL,
    test_time time without time zone,
    test2_time time without time zone,
    test_date date,
    timezone character varying,
    user_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: TABLE test_times; Type: COMMENT; Schema: dynamic; Owner: -
--

COMMENT ON TABLE dynamic.test_times IS 'Dynamicmodel: Test Times';


--
-- Name: test_times_id_seq; Type: SEQUENCE; Schema: dynamic; Owner: -
--

CREATE SEQUENCE dynamic.test_times_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: test_times_id_seq; Type: SEQUENCE OWNED BY; Schema: dynamic; Owner: -
--

ALTER SEQUENCE dynamic.test_times_id_seq OWNED BY dynamic.test_times.id;


--
-- Name: tests; Type: TABLE; Schema: dynamic; Owner: -
--

CREATE TABLE dynamic.tests (
    id bigint NOT NULL,
    user_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: TABLE tests; Type: COMMENT; Schema: dynamic; Owner: -
--

COMMENT ON TABLE dynamic.tests IS 'Dynamicmodel: Tests';


--
-- Name: tests_id_seq; Type: SEQUENCE; Schema: dynamic; Owner: -
--

CREATE SEQUENCE dynamic.tests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tests_id_seq; Type: SEQUENCE OWNED BY; Schema: dynamic; Owner: -
--

ALTER SEQUENCE dynamic.tests_id_seq OWNED BY dynamic.tests.id;


--
-- Name: grit_assignment_history; Type: TABLE; Schema: extra_app; Owner: -
--

CREATE TABLE extra_app.grit_assignment_history (
    id bigint NOT NULL,
    master_id bigint,
    grit_id bigint,
    user_id bigint,
    admin_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    grit_assignment_table_id bigint
);


--
-- Name: grit_assignment_history_id_seq; Type: SEQUENCE; Schema: extra_app; Owner: -
--

CREATE SEQUENCE extra_app.grit_assignment_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: grit_assignment_history_id_seq; Type: SEQUENCE OWNED BY; Schema: extra_app; Owner: -
--

ALTER SEQUENCE extra_app.grit_assignment_history_id_seq OWNED BY extra_app.grit_assignment_history.id;


--
-- Name: grit_assignments; Type: TABLE; Schema: extra_app; Owner: -
--

CREATE TABLE extra_app.grit_assignments (
    id bigint NOT NULL,
    master_id bigint,
    grit_id bigint,
    user_id bigint,
    admin_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: grit_assignments_id_seq; Type: SEQUENCE; Schema: extra_app; Owner: -
--

CREATE SEQUENCE extra_app.grit_assignments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: grit_assignments_id_seq; Type: SEQUENCE OWNED BY; Schema: extra_app; Owner: -
--

ALTER SEQUENCE extra_app.grit_assignments_id_seq OWNED BY extra_app.grit_assignments.id;


--
-- Name: pitt_bhi_assignment_history; Type: TABLE; Schema: extra_app; Owner: -
--

CREATE TABLE extra_app.pitt_bhi_assignment_history (
    id bigint NOT NULL,
    master_id bigint,
    pitt_bhi_id bigint,
    user_id bigint,
    admin_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    pitt_bhi_assignment_table_id bigint
);


--
-- Name: pitt_bhi_assignment_history_id_seq; Type: SEQUENCE; Schema: extra_app; Owner: -
--

CREATE SEQUENCE extra_app.pitt_bhi_assignment_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pitt_bhi_assignment_history_id_seq; Type: SEQUENCE OWNED BY; Schema: extra_app; Owner: -
--

ALTER SEQUENCE extra_app.pitt_bhi_assignment_history_id_seq OWNED BY extra_app.pitt_bhi_assignment_history.id;


--
-- Name: pitt_bhi_assignments; Type: TABLE; Schema: extra_app; Owner: -
--

CREATE TABLE extra_app.pitt_bhi_assignments (
    id bigint NOT NULL,
    master_id bigint,
    pitt_bhi_id bigint,
    user_id bigint,
    admin_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: pitt_bhi_assignments_id_seq; Type: SEQUENCE; Schema: extra_app; Owner: -
--

CREATE SEQUENCE extra_app.pitt_bhi_assignments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pitt_bhi_assignments_id_seq; Type: SEQUENCE OWNED BY; Schema: extra_app; Owner: -
--

ALTER SEQUENCE extra_app.pitt_bhi_assignments_id_seq OWNED BY extra_app.pitt_bhi_assignments.id;


--
-- Name: sleep_assignment_history; Type: TABLE; Schema: extra_app; Owner: -
--

CREATE TABLE extra_app.sleep_assignment_history (
    id bigint NOT NULL,
    master_id bigint,
    sleep_id bigint,
    user_id bigint,
    admin_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    sleep_assignment_table_id bigint
);


--
-- Name: sleep_assignment_history_id_seq; Type: SEQUENCE; Schema: extra_app; Owner: -
--

CREATE SEQUENCE extra_app.sleep_assignment_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sleep_assignment_history_id_seq; Type: SEQUENCE OWNED BY; Schema: extra_app; Owner: -
--

ALTER SEQUENCE extra_app.sleep_assignment_history_id_seq OWNED BY extra_app.sleep_assignment_history.id;


--
-- Name: sleep_assignments; Type: TABLE; Schema: extra_app; Owner: -
--

CREATE TABLE extra_app.sleep_assignments (
    id bigint NOT NULL,
    master_id bigint,
    sleep_id bigint,
    user_id bigint,
    admin_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: sleep_assignments_id_seq; Type: SEQUENCE; Schema: extra_app; Owner: -
--

CREATE SEQUENCE extra_app.sleep_assignments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sleep_assignments_id_seq; Type: SEQUENCE OWNED BY; Schema: extra_app; Owner: -
--

ALTER SEQUENCE extra_app.sleep_assignments_id_seq OWNED BY extra_app.sleep_assignments.id;


--
-- Name: accuracy_score_history; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.accuracy_score_history (
    id integer NOT NULL,
    name character varying,
    value integer,
    admin_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    disabled boolean,
    accuracy_score_id integer
);


--
-- Name: accuracy_score_history_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.accuracy_score_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: accuracy_score_history_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.accuracy_score_history_id_seq OWNED BY ml_app.accuracy_score_history.id;


--
-- Name: accuracy_scores; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.accuracy_scores (
    id integer NOT NULL,
    name character varying,
    value integer,
    admin_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    disabled boolean
);


--
-- Name: accuracy_scores_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.accuracy_scores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: accuracy_scores_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.accuracy_scores_id_seq OWNED BY ml_app.accuracy_scores.id;


--
-- Name: activity_log_history; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.activity_log_history (
    id integer NOT NULL,
    activity_log_id integer,
    name character varying,
    item_type character varying,
    rec_type character varying,
    admin_id integer,
    disabled boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    action_when_attribute character varying,
    field_list character varying,
    blank_log_field_list character varying,
    blank_log_name character varying,
    extra_log_types character varying,
    hide_item_list_panel boolean,
    main_log_name character varying,
    process_name character varying,
    table_name character varying,
    category character varying,
    schema_name character varying
);


--
-- Name: activity_log_history_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.activity_log_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: activity_log_history_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.activity_log_history_id_seq OWNED BY ml_app.activity_log_history.id;


--
-- Name: activity_log_player_contact_phone_history; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.activity_log_player_contact_phone_history (
    id integer NOT NULL,
    master_id integer,
    player_contact_id integer,
    data character varying,
    select_call_direction character varying,
    select_who character varying,
    called_when date,
    select_result character varying,
    select_next_step character varying,
    follow_up_when date,
    notes character varying,
    protocol_id integer,
    set_related_player_contact_rank character varying,
    user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    activity_log_player_contact_phone_id integer,
    extra_log_type character varying
);


--
-- Name: activity_log_player_contact_phone_history_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.activity_log_player_contact_phone_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: activity_log_player_contact_phone_history_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.activity_log_player_contact_phone_history_id_seq OWNED BY ml_app.activity_log_player_contact_phone_history.id;


--
-- Name: activity_log_player_contact_phones; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.activity_log_player_contact_phones (
    id integer NOT NULL,
    data character varying,
    select_call_direction character varying,
    select_who character varying,
    called_when date,
    select_result character varying,
    select_next_step character varying,
    follow_up_when date,
    protocol_id integer,
    notes character varying,
    user_id integer,
    player_contact_id integer,
    master_id integer,
    disabled boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    set_related_player_contact_rank character varying,
    extra_log_type character varying
);


--
-- Name: activity_log_player_contact_phones_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.activity_log_player_contact_phones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: activity_log_player_contact_phones_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.activity_log_player_contact_phones_id_seq OWNED BY ml_app.activity_log_player_contact_phones.id;


--
-- Name: activity_logs; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.activity_logs (
    id integer NOT NULL,
    name character varying,
    item_type character varying,
    rec_type character varying,
    admin_id integer,
    disabled boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    action_when_attribute character varying,
    field_list character varying,
    blank_log_field_list character varying,
    blank_log_name character varying,
    extra_log_types character varying,
    hide_item_list_panel boolean,
    main_log_name character varying,
    process_name character varying,
    table_name character varying,
    category character varying,
    schema_name character varying
);


--
-- Name: activity_logs_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.activity_logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: activity_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.activity_logs_id_seq OWNED BY ml_app.activity_logs.id;


--
-- Name: address_history; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.address_history (
    id integer NOT NULL,
    master_id integer,
    street character varying,
    street2 character varying,
    street3 character varying,
    city character varying,
    state character varying,
    zip character varying,
    source character varying,
    rank integer,
    rec_type character varying,
    user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone DEFAULT now(),
    country character varying(3),
    postal_code character varying,
    region character varying,
    address_id integer
);


--
-- Name: address_history_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.address_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: address_history_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.address_history_id_seq OWNED BY ml_app.address_history.id;


--
-- Name: addresses; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.addresses (
    id integer NOT NULL,
    master_id integer,
    street character varying,
    street2 character varying,
    street3 character varying,
    city character varying,
    state character varying,
    zip character varying,
    source character varying,
    rank integer,
    rec_type character varying,
    user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone DEFAULT now(),
    country character varying(3),
    postal_code character varying,
    region character varying
);


--
-- Name: addresses_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.addresses_id_seq OWNED BY ml_app.addresses.id;


--
-- Name: admin_action_logs; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.admin_action_logs (
    id integer NOT NULL,
    admin_id integer,
    item_type character varying,
    item_id integer,
    action character varying,
    url character varying,
    prev_value json,
    new_value json,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: admin_action_logs_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.admin_action_logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: admin_action_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.admin_action_logs_id_seq OWNED BY ml_app.admin_action_logs.id;


--
-- Name: admin_history; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.admin_history (
    id integer NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    sign_in_count integer DEFAULT 0,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying,
    last_sign_in_ip character varying,
    failed_attempts integer DEFAULT 0,
    unlock_token character varying,
    locked_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    disabled boolean,
    admin_id integer,
    encrypted_otp_secret character varying,
    encrypted_otp_secret_iv character varying,
    encrypted_otp_secret_salt character varying,
    consumed_timestep integer,
    otp_required_for_login boolean,
    reset_password_sent_at timestamp without time zone,
    password_updated_at timestamp without time zone,
    updated_by_admin_id integer
);


--
-- Name: admin_history_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.admin_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: admin_history_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.admin_history_id_seq OWNED BY ml_app.admin_history.id;


--
-- Name: admins; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.admins (
    id integer NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    sign_in_count integer DEFAULT 0,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying,
    last_sign_in_ip character varying,
    failed_attempts integer DEFAULT 0,
    unlock_token character varying,
    locked_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    disabled boolean,
    encrypted_otp_secret character varying,
    encrypted_otp_secret_iv character varying,
    encrypted_otp_secret_salt character varying,
    consumed_timestep integer,
    otp_required_for_login boolean,
    reset_password_sent_at timestamp without time zone,
    password_updated_at timestamp without time zone,
    first_name character varying,
    last_name character varying,
    do_not_email boolean DEFAULT false,
    admin_id bigint,
    capabilities character varying[]
);


--
-- Name: admins_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.admins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: admins_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.admins_id_seq OWNED BY ml_app.admins.id;


--
-- Name: app_configuration_history; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.app_configuration_history (
    id integer NOT NULL,
    name character varying,
    value character varying,
    app_type_id bigint,
    user_id bigint,
    role_name character varying,
    admin_id integer,
    disabled boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    app_configuration_id integer
);


--
-- Name: app_configuration_history_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.app_configuration_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: app_configuration_history_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.app_configuration_history_id_seq OWNED BY ml_app.app_configuration_history.id;


--
-- Name: app_configurations; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.app_configurations (
    id integer NOT NULL,
    name character varying,
    value character varying,
    disabled boolean,
    admin_id integer,
    user_id integer,
    app_type_id integer,
    role_name character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: app_configurations_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.app_configurations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: app_configurations_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.app_configurations_id_seq OWNED BY ml_app.app_configurations.id;


--
-- Name: app_type_history; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.app_type_history (
    id integer NOT NULL,
    name character varying,
    label character varying,
    admin_id integer,
    disabled boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    app_type_id integer
);


--
-- Name: app_type_history_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.app_type_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: app_type_history_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.app_type_history_id_seq OWNED BY ml_app.app_type_history.id;


--
-- Name: app_types; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.app_types (
    id integer NOT NULL,
    name character varying,
    label character varying,
    disabled boolean,
    admin_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    default_schema_name character varying
);


--
-- Name: app_types_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.app_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: app_types_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.app_types_id_seq OWNED BY ml_app.app_types.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: college_history; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.college_history (
    id integer NOT NULL,
    name character varying,
    synonym_for_id integer,
    disabled boolean,
    admin_id integer,
    user_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    college_id integer
);


--
-- Name: college_history_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.college_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: college_history_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.college_history_id_seq OWNED BY ml_app.college_history.id;


--
-- Name: colleges; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.colleges (
    id integer NOT NULL,
    name character varying,
    synonym_for_id integer,
    disabled boolean,
    admin_id integer,
    user_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: colleges_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.colleges_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: colleges_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.colleges_id_seq OWNED BY ml_app.colleges.id;


--
-- Name: config_libraries; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.config_libraries (
    id integer NOT NULL,
    category character varying,
    name character varying,
    options character varying,
    format character varying,
    disabled boolean DEFAULT false,
    admin_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: config_libraries_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.config_libraries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: config_libraries_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.config_libraries_id_seq OWNED BY ml_app.config_libraries.id;


--
-- Name: config_library_history; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.config_library_history (
    id integer NOT NULL,
    category character varying,
    name character varying,
    options character varying,
    format character varying,
    disabled boolean DEFAULT false,
    admin_id integer,
    config_library_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: config_library_history_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.config_library_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: config_library_history_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.config_library_history_id_seq OWNED BY ml_app.config_library_history.id;


--
-- Name: copy_player_infos; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.copy_player_infos (
    id integer,
    master_id integer,
    first_name character varying,
    last_name character varying,
    middle_name character varying,
    nick_name character varying,
    birth_date date,
    death_date date,
    user_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    contact_pref character varying,
    start_year integer,
    rank integer,
    notes character varying,
    contactid integer,
    college character varying,
    end_year integer,
    source character varying
);


--
-- Name: delayed_jobs; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.delayed_jobs (
    id integer NOT NULL,
    priority integer DEFAULT 0 NOT NULL,
    attempts integer DEFAULT 0 NOT NULL,
    handler text NOT NULL,
    last_error text,
    run_at timestamp without time zone,
    locked_at timestamp without time zone,
    failed_at timestamp without time zone,
    locked_by character varying,
    queue character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: delayed_jobs_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.delayed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: delayed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.delayed_jobs_id_seq OWNED BY ml_app.delayed_jobs.id;


--
-- Name: dynamic_model_history; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.dynamic_model_history (
    id integer NOT NULL,
    name character varying,
    table_name character varying,
    schema_name character varying,
    primary_key_name character varying,
    foreign_key_name character varying,
    description character varying,
    admin_id integer,
    disabled boolean,
    "position" integer,
    category character varying,
    table_key_name character varying,
    field_list character varying,
    result_order character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    dynamic_model_id integer,
    options character varying
);


--
-- Name: dynamic_model_history_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.dynamic_model_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dynamic_model_history_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.dynamic_model_history_id_seq OWNED BY ml_app.dynamic_model_history.id;


--
-- Name: dynamic_models; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.dynamic_models (
    id integer NOT NULL,
    name character varying,
    table_name character varying,
    schema_name character varying,
    primary_key_name character varying,
    foreign_key_name character varying,
    description character varying,
    admin_id integer,
    disabled boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    "position" integer,
    category character varying,
    table_key_name character varying,
    field_list character varying,
    result_order character varying,
    options character varying
);


--
-- Name: dynamic_models_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.dynamic_models_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: dynamic_models_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.dynamic_models_id_seq OWNED BY ml_app.dynamic_models.id;


--
-- Name: exception_logs; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.exception_logs (
    id integer NOT NULL,
    message character varying,
    main character varying,
    backtrace character varying,
    user_id integer,
    admin_id integer,
    notified_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: exception_logs_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.exception_logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: exception_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.exception_logs_id_seq OWNED BY ml_app.exception_logs.id;


--
-- Name: external_identifier_history; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.external_identifier_history (
    id integer NOT NULL,
    name character varying,
    label character varying,
    external_id_attribute character varying,
    external_id_view_formatter character varying,
    external_id_edit_pattern character varying,
    prevent_edit boolean,
    pregenerate_ids boolean,
    min_id bigint,
    max_id bigint,
    admin_id integer,
    disabled boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    external_identifier_id integer,
    extra_fields character varying,
    alphanumeric boolean,
    schema_name character varying,
    options character varying
);


--
-- Name: external_identifier_history_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.external_identifier_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: external_identifier_history_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.external_identifier_history_id_seq OWNED BY ml_app.external_identifier_history.id;


--
-- Name: external_identifiers; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.external_identifiers (
    id integer NOT NULL,
    name character varying,
    label character varying,
    external_id_attribute character varying,
    external_id_view_formatter character varying,
    external_id_edit_pattern character varying,
    prevent_edit boolean,
    pregenerate_ids boolean,
    min_id bigint,
    max_id bigint,
    admin_id integer,
    disabled boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    alphanumeric boolean,
    extra_fields character varying,
    category character varying,
    schema_name character varying,
    options character varying
);


--
-- Name: external_identifiers_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.external_identifiers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: external_identifiers_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.external_identifiers_id_seq OWNED BY ml_app.external_identifiers.id;


--
-- Name: external_link_history; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.external_link_history (
    id integer NOT NULL,
    name character varying,
    value character varying,
    admin_id integer,
    disabled boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    external_link_id integer
);


--
-- Name: external_link_history_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.external_link_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: external_link_history_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.external_link_history_id_seq OWNED BY ml_app.external_link_history.id;


--
-- Name: external_links; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.external_links (
    id integer NOT NULL,
    name character varying,
    value character varying,
    disabled boolean,
    admin_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: external_links_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.external_links_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: external_links_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.external_links_id_seq OWNED BY ml_app.external_links.id;


--
-- Name: general_selection_history; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.general_selection_history (
    id integer NOT NULL,
    name character varying,
    value character varying,
    item_type character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    disabled boolean,
    admin_id integer,
    create_with boolean,
    edit_if_set boolean,
    edit_always boolean,
    "position" integer,
    description character varying,
    lock boolean,
    general_selection_id integer
);


--
-- Name: general_selection_history_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.general_selection_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: general_selection_history_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.general_selection_history_id_seq OWNED BY ml_app.general_selection_history.id;


--
-- Name: general_selections; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.general_selections (
    id integer NOT NULL,
    name character varying,
    value character varying,
    item_type character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    disabled boolean,
    admin_id integer,
    create_with boolean,
    edit_if_set boolean,
    edit_always boolean,
    "position" integer,
    description character varying,
    lock boolean
);


--
-- Name: general_selections_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.general_selections_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: general_selections_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.general_selections_id_seq OWNED BY ml_app.general_selections.id;


--
-- Name: imports; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.imports (
    id integer NOT NULL,
    primary_table character varying,
    item_count integer,
    filename character varying,
    imported_items integer[],
    user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: imports_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.imports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: imports_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.imports_id_seq OWNED BY ml_app.imports.id;


--
-- Name: imports_model_generators; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.imports_model_generators (
    id bigint NOT NULL,
    name character varying,
    dynamic_model_table character varying,
    options json,
    description character varying,
    admin_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: imports_model_generators_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.imports_model_generators_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: imports_model_generators_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.imports_model_generators_id_seq OWNED BY ml_app.imports_model_generators.id;


--
-- Name: item_flag_history; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.item_flag_history (
    id integer NOT NULL,
    item_id integer,
    item_type character varying,
    item_flag_name_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_id integer,
    item_flag_id integer,
    disabled boolean
);


--
-- Name: item_flag_history_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.item_flag_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: item_flag_history_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.item_flag_history_id_seq OWNED BY ml_app.item_flag_history.id;


--
-- Name: item_flag_name_history; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.item_flag_name_history (
    id integer NOT NULL,
    name character varying,
    item_type character varying,
    disabled boolean,
    admin_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    item_flag_name_id integer
);


--
-- Name: item_flag_name_history_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.item_flag_name_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: item_flag_name_history_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.item_flag_name_history_id_seq OWNED BY ml_app.item_flag_name_history.id;


--
-- Name: item_flag_names; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.item_flag_names (
    id integer NOT NULL,
    name character varying,
    item_type character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    disabled boolean,
    admin_id integer
);


--
-- Name: item_flag_names_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.item_flag_names_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: item_flag_names_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.item_flag_names_id_seq OWNED BY ml_app.item_flag_names.id;


--
-- Name: item_flags; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.item_flags (
    id integer NOT NULL,
    item_id integer,
    item_type character varying,
    item_flag_name_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_id integer,
    disabled boolean
);


--
-- Name: item_flags_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.item_flags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: item_flags_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.item_flags_id_seq OWNED BY ml_app.item_flags.id;


--
-- Name: manage_users; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.manage_users (
    id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: manage_users_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.manage_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: manage_users_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.manage_users_id_seq OWNED BY ml_app.manage_users.id;


--
-- Name: masters; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.masters (
    id integer NOT NULL,
    msid integer,
    pro_id integer,
    pro_info_id integer,
    rank integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    user_id integer,
    contact_id integer,
    created_by_user_id bigint
);


--
-- Name: masters_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.masters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: masters_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.masters_id_seq OWNED BY ml_app.masters.id;


--
-- Name: message_notifications; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.message_notifications (
    id integer NOT NULL,
    app_type_id integer,
    master_id integer,
    user_id integer,
    item_id integer,
    item_type character varying,
    message_type character varying,
    recipient_user_ids integer[],
    layout_template_name character varying,
    content_template_name character varying,
    generated_content character varying,
    status character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    status_changed character varying,
    subject character varying,
    data json,
    recipient_data character varying[],
    from_user_email character varying,
    role_name character varying,
    content_template_text character varying,
    importance character varying,
    extra_substitutions character varying,
    content_hash character varying
);


--
-- Name: message_notifications_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.message_notifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: message_notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.message_notifications_id_seq OWNED BY ml_app.message_notifications.id;


--
-- Name: message_template_history; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.message_template_history (
    id integer NOT NULL,
    name character varying,
    template_type character varying,
    template character varying,
    admin_id integer,
    disabled boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    message_template_id integer,
    message_type character varying,
    category character varying
);


--
-- Name: message_template_history_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.message_template_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: message_template_history_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.message_template_history_id_seq OWNED BY ml_app.message_template_history.id;


--
-- Name: message_templates; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.message_templates (
    id integer NOT NULL,
    name character varying,
    message_type character varying,
    template_type character varying,
    template character varying,
    admin_id integer,
    disabled boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    category character varying
);


--
-- Name: message_templates_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.message_templates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: message_templates_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.message_templates_id_seq OWNED BY ml_app.message_templates.id;


--
-- Name: model_references_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.model_references_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: model_references_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.model_references_id_seq OWNED BY ml_app.model_references.id;


--
-- Name: msid_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.msid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: nfs_store_archived_file_history; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.nfs_store_archived_file_history (
    id integer NOT NULL,
    file_hash character varying,
    file_name character varying,
    content_type character varying,
    archive_file character varying,
    path character varying,
    file_size character varying,
    file_updated_at character varying,
    nfs_store_container_id bigint,
    title character varying,
    description character varying,
    file_metadata character varying,
    nfs_store_stored_file_id bigint,
    user_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    nfs_store_archived_file_id integer,
    embed_resource_name character varying,
    embed_resource_id bigint
);


--
-- Name: nfs_store_archived_file_history_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.nfs_store_archived_file_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: nfs_store_archived_file_history_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.nfs_store_archived_file_history_id_seq OWNED BY ml_app.nfs_store_archived_file_history.id;


--
-- Name: nfs_store_archived_files_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.nfs_store_archived_files_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: nfs_store_archived_files_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.nfs_store_archived_files_id_seq OWNED BY ml_app.nfs_store_archived_files.id;


--
-- Name: nfs_store_container_history; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.nfs_store_container_history (
    id integer NOT NULL,
    master_id integer,
    name character varying,
    app_type_id bigint,
    orig_nfs_store_container_id bigint,
    user_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    nfs_store_container_id integer,
    created_by_user_id bigint
);


--
-- Name: nfs_store_container_history_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.nfs_store_container_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: nfs_store_container_history_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.nfs_store_container_history_id_seq OWNED BY ml_app.nfs_store_container_history.id;


--
-- Name: nfs_store_containers_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.nfs_store_containers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: nfs_store_containers_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.nfs_store_containers_id_seq OWNED BY ml_app.nfs_store_containers.id;


--
-- Name: nfs_store_downloads; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.nfs_store_downloads (
    id integer NOT NULL,
    user_groups integer[] DEFAULT '{}'::integer[],
    path character varying,
    retrieval_path character varying,
    retrieved_items character varying,
    user_id integer NOT NULL,
    nfs_store_container_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    nfs_store_container_ids integer[]
);


--
-- Name: nfs_store_downloads_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.nfs_store_downloads_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: nfs_store_downloads_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.nfs_store_downloads_id_seq OWNED BY ml_app.nfs_store_downloads.id;


--
-- Name: nfs_store_filter_history; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.nfs_store_filter_history (
    id integer NOT NULL,
    app_type_id bigint,
    role_name character varying,
    user_id bigint,
    resource_name character varying,
    filter character varying,
    description character varying,
    admin_id integer,
    disabled boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    nfs_store_filter_id integer
);


--
-- Name: nfs_store_filter_history_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.nfs_store_filter_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: nfs_store_filter_history_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.nfs_store_filter_history_id_seq OWNED BY ml_app.nfs_store_filter_history.id;


--
-- Name: nfs_store_filters; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.nfs_store_filters (
    id integer NOT NULL,
    app_type_id integer,
    role_name character varying,
    user_id integer,
    resource_name character varying,
    filter character varying,
    description character varying,
    disabled boolean,
    admin_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: nfs_store_filters_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.nfs_store_filters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: nfs_store_filters_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.nfs_store_filters_id_seq OWNED BY ml_app.nfs_store_filters.id;


--
-- Name: nfs_store_imports; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.nfs_store_imports (
    id integer NOT NULL,
    file_hash character varying,
    file_name character varying,
    user_id integer,
    nfs_store_container_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    path character varying
);


--
-- Name: nfs_store_imports_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.nfs_store_imports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: nfs_store_imports_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.nfs_store_imports_id_seq OWNED BY ml_app.nfs_store_imports.id;


--
-- Name: nfs_store_move_actions; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.nfs_store_move_actions (
    id integer NOT NULL,
    user_groups integer[],
    path character varying,
    new_path character varying,
    retrieval_path character varying,
    moved_items character varying,
    nfs_store_container_ids integer[],
    user_id integer NOT NULL,
    nfs_store_container_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: nfs_store_move_actions_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.nfs_store_move_actions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: nfs_store_move_actions_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.nfs_store_move_actions_id_seq OWNED BY ml_app.nfs_store_move_actions.id;


--
-- Name: nfs_store_stored_file_history; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.nfs_store_stored_file_history (
    id integer NOT NULL,
    file_hash character varying,
    file_name character varying,
    content_type character varying,
    path character varying,
    file_size character varying,
    file_updated_at character varying,
    nfs_store_container_id bigint,
    title character varying,
    description character varying,
    file_metadata character varying,
    last_process_name_run character varying,
    user_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    nfs_store_stored_file_id integer,
    embed_resource_name character varying,
    embed_resource_id bigint
);


--
-- Name: nfs_store_stored_file_history_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.nfs_store_stored_file_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: nfs_store_stored_file_history_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.nfs_store_stored_file_history_id_seq OWNED BY ml_app.nfs_store_stored_file_history.id;


--
-- Name: nfs_store_stored_files_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.nfs_store_stored_files_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: nfs_store_stored_files_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.nfs_store_stored_files_id_seq OWNED BY ml_app.nfs_store_stored_files.id;


--
-- Name: nfs_store_trash_actions; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.nfs_store_trash_actions (
    id integer NOT NULL,
    user_groups integer[] DEFAULT '{}'::integer[],
    path character varying,
    retrieval_path character varying,
    trashed_items character varying,
    nfs_store_container_ids integer[],
    user_id integer NOT NULL,
    nfs_store_container_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: nfs_store_trash_actions_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.nfs_store_trash_actions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: nfs_store_trash_actions_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.nfs_store_trash_actions_id_seq OWNED BY ml_app.nfs_store_trash_actions.id;


--
-- Name: nfs_store_uploads; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.nfs_store_uploads (
    id integer NOT NULL,
    file_hash character varying NOT NULL,
    file_name character varying NOT NULL,
    content_type character varying NOT NULL,
    file_size bigint NOT NULL,
    chunk_count integer,
    completed boolean,
    file_updated_at timestamp without time zone,
    user_id integer,
    nfs_store_container_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    path character varying,
    nfs_store_stored_file_id integer,
    upload_set character varying
);


--
-- Name: nfs_store_uploads_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.nfs_store_uploads_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: nfs_store_uploads_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.nfs_store_uploads_id_seq OWNED BY ml_app.nfs_store_uploads.id;


--
-- Name: nfs_store_user_file_actions; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.nfs_store_user_file_actions (
    id integer NOT NULL,
    user_groups integer[],
    path character varying,
    new_path character varying,
    action character varying,
    retrieval_path character varying,
    action_items character varying,
    nfs_store_container_ids integer[],
    user_id integer NOT NULL,
    nfs_store_container_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: nfs_store_user_file_actions_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.nfs_store_user_file_actions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: nfs_store_user_file_actions_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.nfs_store_user_file_actions_id_seq OWNED BY ml_app.nfs_store_user_file_actions.id;


--
-- Name: page_layout_history; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.page_layout_history (
    id integer NOT NULL,
    layout_name character varying,
    panel_name character varying,
    panel_label character varying,
    panel_position character varying,
    options character varying,
    admin_id integer,
    disabled boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    page_layout_id integer,
    app_type_id character varying,
    description character varying
);


--
-- Name: page_layout_history_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.page_layout_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: page_layout_history_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.page_layout_history_id_seq OWNED BY ml_app.page_layout_history.id;


--
-- Name: page_layouts; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.page_layouts (
    id integer NOT NULL,
    app_type_id integer,
    layout_name character varying,
    panel_name character varying,
    panel_label character varying,
    panel_position integer,
    options character varying,
    disabled boolean,
    admin_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    description character varying
);


--
-- Name: page_layouts_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.page_layouts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: page_layouts_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.page_layouts_id_seq OWNED BY ml_app.page_layouts.id;


--
-- Name: player_contact_history; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.player_contact_history (
    id integer NOT NULL,
    master_id integer,
    rec_type character varying,
    data character varying,
    source character varying,
    rank integer,
    user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone DEFAULT now(),
    player_contact_id integer
);


--
-- Name: player_contact_history_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.player_contact_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_contact_history_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.player_contact_history_id_seq OWNED BY ml_app.player_contact_history.id;


--
-- Name: player_contacts; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.player_contacts (
    id integer NOT NULL,
    master_id integer,
    rec_type character varying,
    data character varying,
    source character varying,
    rank integer,
    user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone DEFAULT now()
);


--
-- Name: player_contacts_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.player_contacts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.player_contacts_id_seq OWNED BY ml_app.player_contacts.id;


--
-- Name: player_info_history; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.player_info_history (
    id integer NOT NULL,
    master_id integer,
    first_name character varying,
    last_name character varying,
    middle_name character varying,
    nick_name character varying,
    birth_date date,
    death_date date,
    user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone DEFAULT now(),
    contact_pref character varying,
    start_year integer,
    rank integer,
    notes character varying,
    contact_id integer,
    college character varying,
    end_year integer,
    source character varying,
    player_info_id integer
);


--
-- Name: player_info_history_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.player_info_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_info_history_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.player_info_history_id_seq OWNED BY ml_app.player_info_history.id;


--
-- Name: player_infos; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.player_infos (
    id integer NOT NULL,
    master_id integer,
    first_name character varying,
    last_name character varying,
    middle_name character varying,
    nick_name character varying,
    birth_date date,
    death_date date,
    user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone DEFAULT now(),
    contact_pref character varying,
    start_year integer,
    rank integer,
    notes character varying,
    contact_id integer,
    college character varying,
    end_year integer,
    source character varying
);


--
-- Name: player_infos_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.player_infos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: player_infos_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.player_infos_id_seq OWNED BY ml_app.player_infos.id;


--
-- Name: pro_infos; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.pro_infos (
    id integer NOT NULL,
    master_id integer,
    pro_id integer,
    first_name character varying,
    middle_name character varying,
    nick_name character varying,
    last_name character varying,
    birth_date date,
    death_date date,
    start_year integer,
    end_year integer,
    college character varying,
    birthplace character varying,
    user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone DEFAULT now()
);


--
-- Name: pro_infos_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.pro_infos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pro_infos_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.pro_infos_id_seq OWNED BY ml_app.pro_infos.id;


--
-- Name: protocol_event_history; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.protocol_event_history (
    id integer NOT NULL,
    name character varying,
    admin_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    disabled boolean,
    sub_process_id integer,
    milestone character varying,
    description character varying,
    protocol_event_id integer
);


--
-- Name: protocol_event_history_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.protocol_event_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: protocol_event_history_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.protocol_event_history_id_seq OWNED BY ml_app.protocol_event_history.id;


--
-- Name: protocol_events; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.protocol_events (
    id integer NOT NULL,
    name character varying,
    admin_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    disabled boolean,
    sub_process_id integer,
    milestone character varying,
    description character varying
);


--
-- Name: protocol_events_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.protocol_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: protocol_events_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.protocol_events_id_seq OWNED BY ml_app.protocol_events.id;


--
-- Name: protocol_history; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.protocol_history (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    disabled boolean,
    admin_id integer,
    "position" integer,
    protocol_id integer
);


--
-- Name: protocol_history_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.protocol_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: protocol_history_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.protocol_history_id_seq OWNED BY ml_app.protocol_history.id;


--
-- Name: protocols; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.protocols (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    disabled boolean,
    admin_id integer,
    "position" integer,
    app_type_id bigint
);


--
-- Name: protocols_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.protocols_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: protocols_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.protocols_id_seq OWNED BY ml_app.protocols.id;


--
-- Name: rc_cis; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.rc_cis (
    id integer NOT NULL,
    fname character varying,
    lname character varying,
    status character varying,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    user_id integer,
    master_id integer,
    street character varying,
    street2 character varying,
    city character varying,
    state character varying,
    zip character varying,
    phone character varying,
    email character varying,
    form_date timestamp without time zone
);


--
-- Name: rc_cis2; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.rc_cis2 (
    id integer,
    fname character varying,
    lname character varying,
    status character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    user_id integer
);


--
-- Name: rc_cis_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.rc_cis_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rc_cis_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.rc_cis_id_seq OWNED BY ml_app.rc_cis.id;


--
-- Name: rc_stage_cif_copy; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.rc_stage_cif_copy (
    record_id integer,
    redcap_survey_identifier integer,
    time_stamp timestamp without time zone,
    first_name character varying,
    middle_name character varying,
    last_name character varying,
    nick_name character varying,
    street character varying,
    street2 character varying,
    city character varying,
    state character varying,
    zipcode character varying,
    phone character varying,
    email character varying,
    hearabout character varying,
    completed integer,
    id integer NOT NULL,
    status character varying,
    created_at timestamp without time zone DEFAULT now(),
    user_id integer,
    master_id integer,
    updated_at timestamp without time zone DEFAULT now(),
    added_tracker boolean
);


--
-- Name: rc_stage_cif_copy_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.rc_stage_cif_copy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rc_stage_cif_copy_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.rc_stage_cif_copy_id_seq OWNED BY ml_app.rc_stage_cif_copy.id;


--
-- Name: report_history; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.report_history (
    id integer NOT NULL,
    name character varying,
    description character varying,
    sql character varying,
    search_attrs character varying,
    admin_id integer,
    disabled boolean,
    report_type character varying,
    auto boolean,
    searchable boolean,
    "position" integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    report_id integer,
    item_type character varying,
    edit_model character varying,
    edit_field_names character varying,
    selection_fields character varying,
    short_name character varying,
    options character varying
);


--
-- Name: report_history_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.report_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: report_history_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.report_history_id_seq OWNED BY ml_app.report_history.id;


--
-- Name: reports; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.reports (
    id integer NOT NULL,
    name character varying,
    description character varying,
    sql character varying,
    search_attrs character varying,
    admin_id integer,
    disabled boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    report_type character varying,
    auto boolean,
    searchable boolean,
    "position" integer,
    edit_model character varying,
    edit_field_names character varying,
    selection_fields character varying,
    item_type character varying,
    short_name character varying,
    options character varying
);


--
-- Name: reports_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.reports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: reports_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.reports_id_seq OWNED BY ml_app.reports.id;


--
-- Name: role_description_history; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.role_description_history (
    id bigint NOT NULL,
    role_description_id bigint,
    app_type_id bigint,
    role_name character varying,
    role_template character varying,
    name character varying,
    description character varying,
    disabled boolean,
    admin_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: role_description_history_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.role_description_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: role_description_history_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.role_description_history_id_seq OWNED BY ml_app.role_description_history.id;


--
-- Name: role_descriptions; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.role_descriptions (
    id bigint NOT NULL,
    app_type_id bigint,
    role_name character varying,
    role_template character varying,
    name character varying,
    description character varying,
    disabled boolean,
    admin_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: role_descriptions_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.role_descriptions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: role_descriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.role_descriptions_id_seq OWNED BY ml_app.role_descriptions.id;


--
-- Name: sage_assignments; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.sage_assignments (
    id integer NOT NULL,
    sage_id character varying(10),
    assigned_by character varying,
    user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    master_id integer,
    admin_id integer
);


--
-- Name: sage_assignments_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.sage_assignments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sage_assignments_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.sage_assignments_id_seq OWNED BY ml_app.sage_assignments.id;


--
-- Name: scantron_history; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.scantron_history (
    id integer NOT NULL,
    master_id integer,
    scantron_id integer,
    user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    scantron_table_id integer
);


--
-- Name: scantron_history_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.scantron_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: scantron_history_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.scantron_history_id_seq OWNED BY ml_app.scantron_history.id;


--
-- Name: scantrons; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.scantrons (
    id integer NOT NULL,
    master_id integer,
    scantron_id integer,
    user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: scantrons_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.scantrons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: scantrons_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.scantrons_id_seq OWNED BY ml_app.scantrons.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: sessions; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.sessions (
    id bigint NOT NULL,
    session_id character varying NOT NULL,
    data text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.sessions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.sessions_id_seq OWNED BY ml_app.sessions.id;


--
-- Name: smback; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.smback (
    version character varying
);


--
-- Name: sub_process_history; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.sub_process_history (
    id integer NOT NULL,
    name character varying,
    disabled boolean,
    protocol_id integer,
    admin_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    sub_process_id integer
);


--
-- Name: sub_process_history_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.sub_process_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sub_process_history_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.sub_process_history_id_seq OWNED BY ml_app.sub_process_history.id;


--
-- Name: sub_processes; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.sub_processes (
    id integer NOT NULL,
    name character varying,
    disabled boolean,
    protocol_id integer,
    admin_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: sub_processes_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.sub_processes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sub_processes_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.sub_processes_id_seq OWNED BY ml_app.sub_processes.id;


--
-- Name: tracker_history; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.tracker_history (
    id integer NOT NULL,
    master_id integer,
    protocol_id integer,
    tracker_id integer,
    event_date timestamp without time zone,
    user_id integer,
    notes character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    sub_process_id integer,
    protocol_event_id integer,
    item_id integer,
    item_type character varying
);


--
-- Name: tracker_history_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.tracker_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tracker_history_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.tracker_history_id_seq OWNED BY ml_app.tracker_history.id;


--
-- Name: trackers; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.trackers (
    id integer NOT NULL,
    master_id integer,
    protocol_id integer NOT NULL,
    event_date timestamp without time zone,
    user_id integer DEFAULT ml_app.current_user_id(),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    notes character varying,
    sub_process_id integer NOT NULL,
    protocol_event_id integer,
    item_id integer,
    item_type character varying
);


--
-- Name: trackers_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.trackers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: trackers_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.trackers_id_seq OWNED BY ml_app.trackers.id;


--
-- Name: user_access_control_history; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.user_access_control_history (
    id integer NOT NULL,
    user_id bigint,
    resource_type character varying,
    resource_name character varying,
    options character varying,
    access character varying,
    app_type_id bigint,
    role_name character varying,
    admin_id integer,
    disabled boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    user_access_control_id integer
);


--
-- Name: user_access_control_history_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.user_access_control_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_access_control_history_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.user_access_control_history_id_seq OWNED BY ml_app.user_access_control_history.id;


--
-- Name: user_access_controls; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.user_access_controls (
    id integer NOT NULL,
    user_id integer,
    resource_type character varying,
    resource_name character varying,
    options character varying,
    access character varying,
    disabled boolean,
    admin_id integer,
    app_type_id integer,
    role_name character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- Name: user_access_controls_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.user_access_controls_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_access_controls_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.user_access_controls_id_seq OWNED BY ml_app.user_access_controls.id;


--
-- Name: user_action_logs; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.user_action_logs (
    id integer NOT NULL,
    user_id integer,
    app_type_id integer,
    master_id integer,
    item_type character varying,
    item_id integer,
    index_action_ids integer[],
    action character varying,
    url character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: user_action_logs_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.user_action_logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_action_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.user_action_logs_id_seq OWNED BY ml_app.user_action_logs.id;


--
-- Name: user_authorization_history; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.user_authorization_history (
    id integer NOT NULL,
    user_id character varying,
    has_authorization character varying,
    admin_id integer,
    disabled boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_authorization_id integer
);


--
-- Name: user_authorization_history_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.user_authorization_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_authorization_history_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.user_authorization_history_id_seq OWNED BY ml_app.user_authorization_history.id;


--
-- Name: user_authorizations; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.user_authorizations (
    id integer NOT NULL,
    user_id integer,
    has_authorization character varying,
    admin_id integer,
    disabled boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: user_authorizations_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.user_authorizations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_authorizations_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.user_authorizations_id_seq OWNED BY ml_app.user_authorizations.id;


--
-- Name: user_description_history; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.user_description_history (
    id bigint NOT NULL,
    user_description_id bigint,
    app_type_id bigint,
    role_name character varying,
    role_template character varying,
    name character varying,
    description character varying,
    disabled boolean,
    admin_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: user_description_history_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.user_description_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_description_history_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.user_description_history_id_seq OWNED BY ml_app.user_description_history.id;


--
-- Name: user_descriptions; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.user_descriptions (
    id bigint NOT NULL,
    app_type_id bigint,
    role_name character varying,
    role_template character varying,
    name character varying,
    description character varying,
    disabled boolean,
    admin_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: user_descriptions_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.user_descriptions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_descriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.user_descriptions_id_seq OWNED BY ml_app.user_descriptions.id;


--
-- Name: user_history; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.user_history (
    id integer NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    failed_attempts integer DEFAULT 0 NOT NULL,
    unlock_token character varying,
    locked_at timestamp without time zone,
    disabled boolean,
    admin_id integer,
    user_id integer,
    app_type_id integer,
    authentication_token character varying,
    encrypted_otp_secret character varying,
    encrypted_otp_secret_iv character varying,
    encrypted_otp_secret_salt character varying,
    consumed_timestep integer,
    otp_required_for_login boolean,
    password_updated_at timestamp without time zone,
    first_name character varying,
    last_name character varying,
    confirmation_token character varying,
    confirmed_at timestamp without time zone,
    confirmation_sent_at timestamp without time zone
);


--
-- Name: user_history_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.user_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_history_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.user_history_id_seq OWNED BY ml_app.user_history.id;


--
-- Name: user_preferences; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.user_preferences (
    id bigint NOT NULL,
    user_id bigint,
    date_format character varying,
    date_time_format character varying,
    time_format character varying,
    timezone character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: user_preferences_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.user_preferences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_preferences_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.user_preferences_id_seq OWNED BY ml_app.user_preferences.id;


--
-- Name: user_role_history; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.user_role_history (
    id integer NOT NULL,
    app_type_id bigint,
    role_name character varying,
    user_id bigint,
    admin_id integer,
    disabled boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    user_role_id integer
);


--
-- Name: user_role_history_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.user_role_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_role_history_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.user_role_history_id_seq OWNED BY ml_app.user_role_history.id;


--
-- Name: user_roles; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.user_roles (
    id integer NOT NULL,
    app_type_id integer,
    role_name character varying,
    user_id integer,
    admin_id integer,
    disabled boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: user_roles_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.user_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.user_roles_id_seq OWNED BY ml_app.user_roles.id;


--
-- Name: users; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.users (
    id integer NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    failed_attempts integer DEFAULT 0 NOT NULL,
    unlock_token character varying,
    locked_at timestamp without time zone,
    disabled boolean,
    admin_id integer,
    app_type_id integer,
    authentication_token character varying(30),
    encrypted_otp_secret character varying,
    encrypted_otp_secret_iv character varying,
    encrypted_otp_secret_salt character varying,
    consumed_timestep integer,
    otp_required_for_login boolean,
    password_updated_at timestamp without time zone,
    first_name character varying,
    last_name character varying,
    do_not_email boolean DEFAULT false,
    confirmation_token character varying,
    confirmed_at timestamp without time zone,
    confirmation_sent_at timestamp without time zone,
    country_code character varying,
    terms_of_use_accepted character varying
);


--
-- Name: users_contact_infos; Type: TABLE; Schema: ml_app; Owner: -
--

CREATE TABLE ml_app.users_contact_infos (
    id integer NOT NULL,
    user_id integer,
    sms_number character varying,
    phone_number character varying,
    alt_email character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    admin_id integer,
    disabled boolean
);


--
-- Name: users_contact_infos_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.users_contact_infos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_contact_infos_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.users_contact_infos_id_seq OWNED BY ml_app.users_contact_infos.id;


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--

CREATE SEQUENCE ml_app.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--

ALTER SEQUENCE ml_app.users_id_seq OWNED BY ml_app.users.id;


--
-- Name: view_users; Type: VIEW; Schema: ml_app; Owner: -
--

CREATE VIEW ml_app.view_users AS
 SELECT users.email,
    users.first_name,
    users.last_name,
    users.disabled
   FROM ml_app.users;


--
-- Name: q2_demo_rc_history; Type: TABLE; Schema: redcap; Owner: -
--

CREATE TABLE redcap.q2_demo_rc_history (
    id bigint NOT NULL,
    record_id character varying,
    dob date,
    current_weight numeric,
    domestic_status character varying,
    living_situation character varying,
    current_employment character varying,
    student_looking character varying,
    current_fbjob character varying,
    current_fbjob_oth character varying,
    job_industry character varying,
    job_title character varying,
    job_title_entry character varying,
    smoke character varying,
    smoketime___pnfl boolean,
    smoketime___dnfl boolean,
    smoketime___anfl boolean,
    smoke_start numeric,
    smoke_stop numeric,
    smoke_curr character varying,
    smoke_totyrs numeric,
    smoke_prenfl character varying,
    smoke_nfl character varying,
    smoke_postnfl character varying,
    edu_player character varying,
    edu_mother character varying,
    edu_father character varying,
    occ_mother character varying,
    occ_mother_exp character varying,
    occ_father character varying,
    occ_father_exp character varying,
    yrsplayed_prehs numeric,
    playhsfb___no boolean,
    hsposition1 character varying,
    hsposition2 character varying,
    yrsplayed_hs character varying,
    collposition1 character varying,
    collposition2 character varying,
    yrsplayed_coll character varying,
    college_div character varying,
    collpreprac character varying,
    collpreprac_pads character varying,
    collregprac character varying,
    collregprac_pads character varying,
    collsnap_ol character varying,
    collsnap_wr character varying,
    collsnap_dl character varying,
    collsnap_te character varying,
    collsnap_lb character varying,
    collsnap_qb character varying,
    collsnap_db character varying,
    collsnap_kick character varying,
    collsnap_rb character varying,
    collsnap_special character varying,
    nflpreprac character varying,
    nflpreprac_pads character varying,
    nflregprac character varying,
    nflregprac_pads character varying,
    prosnap_ol character varying,
    prosnap_wr character varying,
    prosnap_dl character varying,
    prosnap_te character varying,
    prosnap_lb character varying,
    prosnap_qb character varying,
    prosnap_db character varying,
    prosnap_kick character varying,
    prosnap_rb character varying,
    prosnap_special character varying,
    gmsplyd_career numeric,
    gmsplyd_season character varying,
    prsqd boolean,
    prsqd_seasons numeric,
    othleague boolean,
    othleague_seasons character varying,
    othleaguenm___afl boolean,
    othleaguenm___cfl boolean,
    othleaguenm___efl boolean,
    othleaguenm___ufl boolean,
    othleaguenm___wfl boolean,
    othleaguenm___xfl boolean,
    othleaguenm___oth boolean,
    othleague_exp character varying,
    nonnfl_seasons numeric,
    prsqd_nonnfl boolean,
    prsqd_nonnfl_seasons numeric,
    firstpro_age numeric,
    finalpro_age numeric,
    leftfb___age boolean,
    leftfb___cut boolean,
    leftfb___fbinj boolean,
    leftfb___inj boolean,
    leftfb___retire boolean,
    postfb_hlthprac character varying,
    postfb_degree character varying,
    postfb_charity character varying,
    postfb_fbjob character varying,
    postfb_job character varying,
    postfbjob_occ character varying,
    postfbjob_occexp character varying,
    postfbex_walk character varying,
    postfbex_jog character varying,
    postfbex_run character varying,
    postfbex_other character varying,
    postfbex_lowint character varying,
    postfbex_wttrain character varying,
    postfbex_endsprt character varying,
    postfbex_reclg character varying,
    pastyrex_walk character varying,
    pastyrex_jog character varying,
    pastyrex_run character varying,
    pastyrex_oth character varying,
    pastyrex_lowint character varying,
    pastyrex_wttrain character varying,
    pastyrex_endsprt character varying,
    pastyrex_reclg character varying,
    ex150min boolean,
    ex150min_exp character varying,
    ex150min_oth character varying,
    demog___complete boolean,
    demog_date timestamp without time zone,
    postfb_wt2yr character varying,
    postfb_wt2yrdelta character varying,
    postfb_wt5yr character varying,
    postfb_wt5yrdelta character varying,
    cardiac_rehab boolean,
    cvtest_ecg character varying,
    cvtest_ecg_exp character varying,
    cvtest_echo character varying,
    cvtest_echo_exp character varying,
    cvtest_cpxt character varying,
    cvtest_cpxt_exp character varying,
    cvtest_cvmri character varying,
    cvtest_cvmri_exp character varying,
    cvtest_corct character varying,
    cvtest_corct_exp character varying,
    cvtest_cvcath character varying,
    cvtest_cvcath_exp character varying,
    cvdx_mi character varying,
    cvdx_stroke character varying,
    cvdx_tia character varying,
    cvmedrec_highbp character varying,
    cvmedrec_hrtfail character varying,
    cvmedrec_afib character varying,
    cvmedrec_otharrhyth character varying,
    cvmedrec_highchol character varying,
    cvmedrec_diabetes character varying,
    cvsurg_bypass character varying,
    cvsurg_ablation character varying,
    cvsurg_carotidart character varying,
    cvmed_chol character varying,
    cvmed_othchol character varying,
    cvmed_novchol character varying,
    cvmed_bldthin character varying,
    cvmed_anticoag character varying,
    cvmed_arrhyth character varying,
    cvmed_digoxin character varying,
    cvmed_furosemide character varying,
    cvmed_thiazide character varying,
    cvmed_calciumblk character varying,
    cvmed_antihyp character varying,
    dbmed_metformin character varying,
    dbmed_glimeperide character varying,
    dbmed_insulin character varying,
    dbmed_other character varying,
    cardiac___complete boolean,
    cardiac_date timestamp without time zone,
    ad8_1 character varying,
    ad8_2 character varying,
    ad8_3 character varying,
    ad8_4 character varying,
    ad8_5 character varying,
    ad8_6 character varying,
    ad8_7 character varying,
    ad8_8 character varying,
    nqcog64q2 character varying,
    nqcog65q2 character varying,
    nqcog66q2 character varying,
    nqcog68q2 character varying,
    nqcog72q2 character varying,
    nqcog75q2 character varying,
    nqcog77q2 character varying,
    nqcog80q2 character varying,
    nqper02 character varying,
    nqper05 character varying,
    nqper06 character varying,
    nqper07 character varying,
    nqper11 character varying,
    nqper12 character varying,
    nqper17 character varying,
    nqper19 character varying,
    phq1 character varying,
    phq2 character varying,
    phq3 character varying,
    phq4 character varying,
    phq5 character varying,
    phq6 character varying,
    phq7 character varying,
    phq8 character varying,
    phq9 character varying,
    gad7_1 character varying,
    gad7_2 character varying,
    gad7_3 character varying,
    gad7_4 character varying,
    gad7_5 character varying,
    gad7_6 character varying,
    gad7_7 character varying,
    lotr1 character varying,
    lotr3 character varying,
    lotr4 character varying,
    lotr7 character varying,
    lotr9 character varying,
    lotr10 character varying,
    stpbng_snore character varying,
    stpbng_tired character varying,
    stpbng_obser character varying,
    stpbng_bp character varying,
    stpbng_neck character varying,
    cpapuse boolean,
    cpapuse_days character varying,
    ncmedrec_hdache character varying,
    ncmedrec_anx character varying,
    ncmedrec_dep character varying,
    ncmedrec_memloss character varying,
    ncmedrec_add character varying,
    ncdx_alz character varying,
    ncdx_cte character varying,
    ncdx_vascdem character varying,
    ncdx_othdem character varying,
    ncdx_als character varying,
    ncdx_parkins character varying,
    ncdx_ms character varying,
    ncmed_ssri character varying,
    ncmed_tricydep character varying,
    ncmed_othdep character varying,
    ncmed_slpaid character varying,
    neurocog___complete boolean,
    neurocog_date timestamp without time zone,
    bpi1 boolean,
    bpi2___head boolean,
    bpi2___neck boolean,
    bpi2___shoul boolean,
    bpi2___chest boolean,
    bpi2___arm boolean,
    bpi2___hand boolean,
    bpi2___uback boolean,
    bpi2___lbak boolean,
    bpi2___hip boolean,
    bpi2___leg boolean,
    bpi2___knee boolean,
    bpi2___ankle boolean,
    bpi2___foot boolean,
    bpi2___oth boolean,
    bpi2_othexp character varying,
    bpi2most character varying,
    bpi2most_othexp character varying,
    bpi3 character varying,
    bpi4 character varying,
    bpi5 character varying,
    bpi6 character varying,
    bpi7___none boolean,
    bpi7___otc boolean,
    bpi7___prmed boolean,
    bpi7___mass boolean,
    bpi7___pt boolean,
    bpi7___acup boolean,
    bpi7___marij boolean,
    bpi7___intpm boolean,
    bpi7___oth boolean,
    bpi7_othexp character varying,
    bpi8 character varying,
    bpi9a character varying,
    bpi9b character varying,
    bpi9c character varying,
    bpi9d character varying,
    bpi9e character varying,
    bpi9f character varying,
    bpi9g character varying,
    bpi9h character varying,
    pnmedfb_acetamin character varying,
    pnmedfb_aspirin character varying,
    pnmedfb_ibuprof character varying,
    pnmedfb_othantiinf character varying,
    pnmedfb_oralster character varying,
    pnmedfb_opioid character varying,
    pnmed5yr_acetamin character varying,
    pnmed5yr_aspirin character varying,
    pnmed5yr_ibuprof character varying,
    pnmed5yr_antiinf character varying,
    pnmed5yr_oralster character varying,
    pnmed5yr_opioid character varying,
    pnmed_acetamin boolean,
    pnmed_acetamin_days character varying,
    pnmed_acetamin_tabs character varying,
    pnmed_acetamin_dose character varying,
    pnmed_aspirin boolean,
    pnmed_aspirin_days character varying,
    pnmed_aspirin_tabs character varying,
    pnmed_aspirin_dose character varying,
    pnmed_ibuprof boolean,
    pnmed_ibuprof_days character varying,
    pnmed_ibuprof_tabs character varying,
    pnmed_ibuprof_dose character varying,
    pnmed_antiinf boolean,
    pnmed_antiinf_days character varying,
    pnmed_antiinf_tabs character varying,
    pnmed_antiinf_dose character varying,
    pnmed_oralster boolean,
    pnmed_oralster_days character varying,
    pnmed_oralster_tabs character varying,
    pnmed_oralster_dose character varying,
    pnmed_opioid boolean,
    pnmed_opioid_days character varying,
    pnmed_opioid_tab character varying,
    pnmed_opioid_dose character varying,
    pnsurg_nckspin character varying,
    pnsurg_back character varying,
    pnsurg_hip character varying,
    pnsurg_knee character varying,
    pain___complete boolean,
    pain_date timestamp without time zone,
    wealth character varying,
    wealth_emerg___1 boolean,
    wealth_emerg___2 boolean,
    wealth_emerg___3 boolean,
    wealth_emerg___4 boolean,
    wealth_emerg___5 boolean,
    wealth_emerg___6 boolean,
    wealth_emerg___7 boolean,
    wealth_emerg___8 boolean,
    wealth_emerg___9 boolean,
    wealth_emerg_oth character varying,
    ladder_wealth character varying,
    ladder_comm character varying,
    household_number character varying,
    hcutil_pcp boolean,
    hcutil_pcp_exp character varying,
    hcutil_pcp_oth character varying,
    hcutil_othprov boolean,
    selfrpt_cte boolean,
    otdx_arthritis character varying,
    otdx_slpapnea character varying,
    otdx_prostcanc character varying,
    otdx_basalcanc character varying,
    otdx_squamcanc character varying,
    otdx_melanom character varying,
    otdx_lymphom character varying,
    otdx_othcanc character varying,
    otdx_renalfail character varying,
    otdx_alcdep character varying,
    otdx_livcirrhosis character varying,
    otdx_livfail character varying,
    otmedrec_pncond character varying,
    otmedrec_livprob character varying,
    otmedrec_lowtest character varying,
    otmedrec_ed character varying,
    massage boolean,
    acupuncture boolean,
    chiropractic boolean,
    yoga boolean,
    taichi boolean,
    meditation boolean,
    othaltmed boolean,
    othaltmed_exp character varying,
    famhxmoth___na boolean,
    famhxmoth___lung boolean,
    famhxmoth___colrec boolean,
    famhxmoth___diab boolean,
    famhxmoth___mela boolean,
    famhxmoth___hypert boolean,
    famhxmoth___dem boolean,
    famhxmoth___alc boolean,
    famhxfsib___na boolean,
    famhxfsib___lung boolean,
    famhxfsib___colrec boolean,
    famhxfsib___diab boolean,
    famhxfsib___mela boolean,
    famhxfsib___hypert boolean,
    famhxfsib___dem boolean,
    famhxfsib___alc boolean,
    femsib_number character varying,
    famhxfath___na boolean,
    famhxfath___lung boolean,
    famhxfath___colrec boolean,
    famhxfath___prost boolean,
    famhxfath___diab boolean,
    famhxfath___mela boolean,
    famhxfath___hypert boolean,
    famhxfath___dem boolean,
    famhxfath___alc boolean,
    famhxmsib___na boolean,
    famhxmsib___lung boolean,
    famhxmsib___colrec boolean,
    famhxmsib___prost boolean,
    famhxmsib___diab boolean,
    famhxmsib___mela boolean,
    famhxmsib___hypert boolean,
    famhxmsib___dem boolean,
    famhxmsib___alc boolean,
    sib_number character varying,
    sib1age numeric,
    sib1ht_feet numeric,
    sib1ht_inch numeric,
    sib1sport___none boolean,
    sib1sport___hsfb boolean,
    sib1sport___colfb boolean,
    sib1sport___oth boolean,
    sib1sport_oth character varying,
    sib2age numeric,
    sib2ht_feet numeric,
    sib2ht_inch numeric,
    sib2sport___none boolean,
    sib2sport___hsfb boolean,
    sib2sport___colfb boolean,
    sib2sport___oth boolean,
    sib2sport_oth character varying,
    sib3age numeric,
    sib3ht_feet numeric,
    sib3ht_inch numeric,
    sib3sport___none boolean,
    sib3sport___hsfb boolean,
    sib3sport___colfb boolean,
    sib3sport___oth boolean,
    sib3sport_oth character varying,
    sib4age numeric,
    sib4ht_feet numeric,
    sib4ht_inch numeric,
    sib4sport___none boolean,
    sib4sport___hsfb boolean,
    sib4sport___colfb boolean,
    sib4sport___oth boolean,
    sib4sportoth character varying,
    sib5age numeric,
    sib5ht_feet numeric,
    sib5ht_inch numeric,
    sib5sport___none boolean,
    sib5sport___hsfb boolean,
    sib5sport___colfb boolean,
    sib5sport___oth boolean,
    sib5sport_oth character varying,
    pedcaff___noans boolean,
    pedcaff___no boolean,
    pedcaff___fb boolean,
    pedcaff___cur boolean,
    pededrink___noans boolean,
    pededrink___no boolean,
    pededrink___fb boolean,
    pededrink___cur boolean,
    pedcreat___noans boolean,
    pedcreat___no boolean,
    pedcreat___fb boolean,
    pedcreat___cur boolean,
    pedsteroid___noans boolean,
    pedsteroid___no boolean,
    pedsteroid___fb boolean,
    pedsteroid___cur boolean,
    pedgh___noans boolean,
    pedgh___no boolean,
    pedgh___fb boolean,
    pedgh___cur boolean,
    pedephed___noans boolean,
    pedephed___no boolean,
    pedephed___fb boolean,
    pedephed___cur boolean,
    pedbetahy___noans boolean,
    pedbetahy___no boolean,
    pedbetahy___fb boolean,
    pedbetahy___cur boolean,
    pednoncaf___noans boolean,
    pednoncaf___no boolean,
    pednoncaf___fb boolean,
    pednoncaf___cur boolean,
    pedrcell___noans boolean,
    pedrcell___no boolean,
    pedrcell___fb boolean,
    pedrcell___cur boolean,
    pedinos___noans boolean,
    pedinos___no boolean,
    pedinos___fb boolean,
    pedinos___cur boolean,
    alcohol_days character varying,
    alcohol_drinks character varying,
    marijuana character varying,
    marijuana_start numeric,
    marijuana_stop numeric,
    marijuana_totyrs numeric,
    marijtime___pnfl boolean,
    marijtime___dnfl boolean,
    marijtime___anfl boolean,
    marijreas___fun boolean,
    marijreas___relx boolean,
    marijreas___pain boolean,
    marijreas___anx boolean,
    marijreas___dep boolean,
    marijreas___oth boolean,
    marijreas_exp character varying,
    born_address character varying,
    born_city character varying,
    born_state character varying,
    born_zip character varying,
    twelveyrs_address character varying,
    twelveyrs_city character varying,
    twelveyrs_state character varying,
    twelveyrs_zip character varying,
    infertility boolean,
    infert_age numeric,
    infert_hcp boolean,
    infertreas___fem boolean,
    infertreas___mal boolean,
    infertreas___unex boolean,
    infertreas___oth boolean,
    infertreas_oth character varying,
    actout_dreams character varying,
    smell_problem character varying,
    taste_problem character varying,
    bowel_move character varying,
    laxative_use character varying,
    workplace_harass character varying,
    coach_discrim character varying,
    coach_discrimstr character varying,
    player_discrim character varying,
    player_discrimstr character varying,
    job_discrim character varying,
    job_discrimstr character varying,
    ace1 boolean,
    ace2 boolean,
    ace3 boolean,
    ace4 boolean,
    ace5 boolean,
    ace6 boolean,
    ace7 boolean,
    ace8 boolean,
    ace9 boolean,
    ace10 boolean,
    foodins_worry character varying,
    foodins_ranout character varying,
    q2help character varying,
    othealth___complete boolean,
    othealth_date timestamp without time zone,
    q2_survey_complete integer,
    q2_survey_timestamp timestamp without time zone,
    sdfsdaf___0 boolean,
    sdfsdaf___1 boolean,
    sdfsdaf___2 boolean,
    rtyrtyrt___0 boolean,
    rtyrtyrt___1 boolean,
    rtyrtyrt___2 boolean,
    test_field character varying,
    test_phone character varying,
    i57 integer,
    f57 numeric,
    dd timestamp without time zone,
    yes_or_no boolean,
    true_or_false boolean,
    file1 character varying,
    signature character varying,
    slider integer,
    test_complete integer,
    test_timestamp timestamp without time zone,
    base_field character varying,
    non_survey_complete integer,
    non_survey_timestamp timestamp without time zone,
    redcap_survey_identifier character varying,
    user_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    q2_demo_rc_id bigint,
    smoketime_chosen_array character varying[],
    othleaguenm_chosen_array character varying[],
    leftfb_chosen_array character varying[],
    bpi2_chosen_array character varying[],
    bpi7_chosen_array character varying[],
    wealth_emerg_chosen_array character varying[],
    famhxmoth_chosen_array character varying[],
    famhxfsib_chosen_array character varying[],
    famhxfath_chosen_array character varying[],
    famhxmsib_chosen_array character varying[],
    sib1sport_chosen_array character varying[],
    sib2sport_chosen_array character varying[],
    sib3sport_chosen_array character varying[],
    sib4sport_chosen_array character varying[],
    sib5sport_chosen_array character varying[],
    pedcaff_chosen_array character varying[],
    pededrink_chosen_array character varying[],
    pedcreat_chosen_array character varying[],
    pedsteroid_chosen_array character varying[],
    pedgh_chosen_array character varying[],
    pedephed_chosen_array character varying[],
    pedbetahy_chosen_array character varying[],
    pednoncaf_chosen_array character varying[],
    pedrcell_chosen_array character varying[],
    pedinos_chosen_array character varying[],
    marijtime_chosen_array character varying[],
    marijreas_chosen_array character varying[],
    infertreas_chosen_array character varying[],
    sdfsdaf_chosen_array character varying[],
    rtyrtyrt_chosen_array character varying[]
);


--
-- Name: COLUMN q2_demo_rc_history.record_id; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.record_id IS 'Record ID';


--
-- Name: COLUMN q2_demo_rc_history.dob; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.dob IS 'Date of birth:';


--
-- Name: COLUMN q2_demo_rc_history.current_weight; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.current_weight IS 'What is your current weight?';


--
-- Name: COLUMN q2_demo_rc_history.domestic_status; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.domestic_status IS 'What is your current marital status?';


--
-- Name: COLUMN q2_demo_rc_history.living_situation; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.living_situation IS 'How would you describe your current living situation?';


--
-- Name: COLUMN q2_demo_rc_history.current_employment; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.current_employment IS 'Are you currently employed?';


--
-- Name: COLUMN q2_demo_rc_history.student_looking; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.student_looking IS 'If you are unemployed, are you currently a student or looking for work?';


--
-- Name: COLUMN q2_demo_rc_history.current_fbjob; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.current_fbjob IS 'If you work in football, please provide additional information:';


--
-- Name: COLUMN q2_demo_rc_history.current_fbjob_oth; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.current_fbjob_oth IS 'If "Other", please specify:';


--
-- Name: COLUMN q2_demo_rc_history.job_industry; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.job_industry IS 'Specify your employment industry. (If you are retired, specify the last industry in
which you were employed.)';


--
-- Name: COLUMN q2_demo_rc_history.job_title; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.job_title IS 'Select the option that best represents your job title. (If you are retired,
indicate the title of your last job)';


--
-- Name: COLUMN q2_demo_rc_history.job_title_entry; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.job_title_entry IS 'Enter your job title: (If you are retired, enter the title of your last
job)';


--
-- Name: COLUMN q2_demo_rc_history.smoke; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.smoke IS 'Have you ever smoked cigarettes?  (Smoked at least 100 cigarettes in your lifetime. Do not include pipe and cigars)';


--
-- Name: COLUMN q2_demo_rc_history.smoketime___pnfl; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.smoketime___pnfl IS 'Before playing in the NFL';


--
-- Name: COLUMN q2_demo_rc_history.smoketime___dnfl; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.smoketime___dnfl IS 'While playing in the NFL';


--
-- Name: COLUMN q2_demo_rc_history.smoketime___anfl; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.smoketime___anfl IS 'After playing in the NFL';


--
-- Name: COLUMN q2_demo_rc_history.smoke_start; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.smoke_start IS 'How old were you when you started smoking?';


--
-- Name: COLUMN q2_demo_rc_history.smoke_stop; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.smoke_stop IS 'How old were you when you stopped smoking?';


--
-- Name: COLUMN q2_demo_rc_history.smoke_curr; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.smoke_curr IS 'On average, how many cigarettes do you currently smoke per day?';


--
-- Name: COLUMN q2_demo_rc_history.smoke_totyrs; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.smoke_totyrs IS 'How many years, in total, have you smoked? (if you quit more than once, estimate the total years you considered yourself an active smoker)';


--
-- Name: COLUMN q2_demo_rc_history.smoke_prenfl; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.smoke_prenfl IS 'How many cigarettes did you smoke per day, on average, before playing in the NFL?';


--
-- Name: COLUMN q2_demo_rc_history.smoke_nfl; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.smoke_nfl IS 'How many cigarettes did you smoke per day, on average, while playing in the NFL?';


--
-- Name: COLUMN q2_demo_rc_history.smoke_postnfl; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.smoke_postnfl IS 'How many cigarettes have you smoked per day, on average, since leaving the NFL? (If you have quit smoking, please provide the average number of cigarettes smoked per day while you considered yourself an active smoker)';


--
-- Name: COLUMN q2_demo_rc_history.edu_player; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.edu_player IS 'You:';


--
-- Name: COLUMN q2_demo_rc_history.edu_mother; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.edu_mother IS 'Mother:';


--
-- Name: COLUMN q2_demo_rc_history.edu_father; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.edu_father IS 'Father:';


--
-- Name: COLUMN q2_demo_rc_history.occ_mother; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.occ_mother IS 'Mother:';


--
-- Name: COLUMN q2_demo_rc_history.occ_mother_exp; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.occ_mother_exp IS 'Please explain:';


--
-- Name: COLUMN q2_demo_rc_history.occ_father; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.occ_father IS 'Father:';


--
-- Name: COLUMN q2_demo_rc_history.occ_father_exp; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.occ_father_exp IS 'Please explain:';


--
-- Name: COLUMN q2_demo_rc_history.yrsplayed_prehs; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.yrsplayed_prehs IS 'How many years did you play football before starting high school?';


--
-- Name: COLUMN q2_demo_rc_history.hsposition1; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.hsposition1 IS 'Primary position #1:';


--
-- Name: COLUMN q2_demo_rc_history.hsposition2; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.hsposition2 IS 'Primary position #2:';


--
-- Name: COLUMN q2_demo_rc_history.yrsplayed_hs; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.yrsplayed_hs IS 'How many years did you play football during high school?';


--
-- Name: COLUMN q2_demo_rc_history.collposition1; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.collposition1 IS 'Primary position #1:';


--
-- Name: COLUMN q2_demo_rc_history.collposition2; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.collposition2 IS 'Primary position #2:';


--
-- Name: COLUMN q2_demo_rc_history.yrsplayed_coll; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.yrsplayed_coll IS 'How many years did you play football during college before going pro?';


--
-- Name: COLUMN q2_demo_rc_history.college_div; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.college_div IS 'If you played after the college \"division\" system was created, which division did you play in?';


--
-- Name: COLUMN q2_demo_rc_history.collpreprac; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.collpreprac IS 'During your college football career, on average, how often did you practice per week during pre-season?';


--
-- Name: COLUMN q2_demo_rc_history.collpreprac_pads; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.collpreprac_pads IS 'During your college football career, on average, how many practices a week did you wear full pads or shoulder pads during pre-season?';


--
-- Name: COLUMN q2_demo_rc_history.collregprac; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.collregprac IS 'During your college football career, on average, how often did you practice per week during the regular season?';


--
-- Name: COLUMN q2_demo_rc_history.collregprac_pads; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.collregprac_pads IS 'During your college football career, on average, how many practices a week did you wear full pads or shoulder pads during the regular season?';


--
-- Name: COLUMN q2_demo_rc_history.collsnap_ol; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.collsnap_ol IS 'Offensive line:';


--
-- Name: COLUMN q2_demo_rc_history.collsnap_wr; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.collsnap_wr IS 'Wide receiver:';


--
-- Name: COLUMN q2_demo_rc_history.collsnap_dl; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.collsnap_dl IS 'Defensive line:';


--
-- Name: COLUMN q2_demo_rc_history.collsnap_te; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.collsnap_te IS 'Tight end:';


--
-- Name: COLUMN q2_demo_rc_history.collsnap_lb; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.collsnap_lb IS 'Linebacker:';


--
-- Name: COLUMN q2_demo_rc_history.collsnap_qb; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.collsnap_qb IS 'Quarterback:';


--
-- Name: COLUMN q2_demo_rc_history.collsnap_db; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.collsnap_db IS 'Defensive back:';


--
-- Name: COLUMN q2_demo_rc_history.collsnap_kick; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.collsnap_kick IS 'Kicker/punter:';


--
-- Name: COLUMN q2_demo_rc_history.collsnap_rb; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.collsnap_rb IS 'Running back:';


--
-- Name: COLUMN q2_demo_rc_history.collsnap_special; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.collsnap_special IS 'Special teams:';


--
-- Name: COLUMN q2_demo_rc_history.nflpreprac; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.nflpreprac IS 'Over your NFL career, on average, how often did you practice per week during pre-season?';


--
-- Name: COLUMN q2_demo_rc_history.nflpreprac_pads; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.nflpreprac_pads IS 'Over your NFL career, on average, how many practices a week did you wear full pads or shoulder pads during pre-season?';


--
-- Name: COLUMN q2_demo_rc_history.nflregprac; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.nflregprac IS 'Over your NFL career, on average, how often did you practice per week during the regular season?';


--
-- Name: COLUMN q2_demo_rc_history.nflregprac_pads; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.nflregprac_pads IS 'Over your NFL career, on average, how many practices a week did you wear full pads or shoulder pads during the regular season?';


--
-- Name: COLUMN q2_demo_rc_history.prosnap_ol; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.prosnap_ol IS 'Offensive line:';


--
-- Name: COLUMN q2_demo_rc_history.prosnap_wr; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.prosnap_wr IS 'Wide receiver:';


--
-- Name: COLUMN q2_demo_rc_history.prosnap_dl; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.prosnap_dl IS 'Defensive line:';


--
-- Name: COLUMN q2_demo_rc_history.prosnap_te; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.prosnap_te IS 'Tight end:';


--
-- Name: COLUMN q2_demo_rc_history.prosnap_lb; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.prosnap_lb IS 'Linebacker:';


--
-- Name: COLUMN q2_demo_rc_history.prosnap_qb; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.prosnap_qb IS 'Quarterback:';


--
-- Name: COLUMN q2_demo_rc_history.prosnap_db; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.prosnap_db IS 'Defensive back:';


--
-- Name: COLUMN q2_demo_rc_history.prosnap_kick; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.prosnap_kick IS 'Kicker/punter:';


--
-- Name: COLUMN q2_demo_rc_history.prosnap_rb; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.prosnap_rb IS 'Running back:';


--
-- Name: COLUMN q2_demo_rc_history.prosnap_special; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.prosnap_special IS 'Special teams:';


--
-- Name: COLUMN q2_demo_rc_history.gmsplyd_career; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.gmsplyd_career IS 'Over your whole professional football career, approximately how many games were you on an active roster?';


--
-- Name: COLUMN q2_demo_rc_history.gmsplyd_season; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.gmsplyd_season IS 'Over your whole professional football career, on average, how many games were you on an active roster per season?';


--
-- Name: COLUMN q2_demo_rc_history.prsqd; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.prsqd IS 'Did you ever spend time on a practice squad for an NFL team?';


--
-- Name: COLUMN q2_demo_rc_history.prsqd_seasons; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.prsqd_seasons IS 'Number of seasons:';


--
-- Name: COLUMN q2_demo_rc_history.othleague; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.othleague IS 'Did you play any seasons for a professional team that was not in the NFL? (CFL, EFL, etc.)';


--
-- Name: COLUMN q2_demo_rc_history.othleague_seasons; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.othleague_seasons IS 'How many seasons did you play for a professional team not in the NFL? (CFL, EFL, etc.)';


--
-- Name: COLUMN q2_demo_rc_history.othleaguenm___afl; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.othleaguenm___afl IS 'Arena Football League (AFL)';


--
-- Name: COLUMN q2_demo_rc_history.othleaguenm___cfl; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.othleaguenm___cfl IS 'Canadian Football League (CFL)';


--
-- Name: COLUMN q2_demo_rc_history.othleaguenm___efl; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.othleaguenm___efl IS 'European Football League (EFL)';


--
-- Name: COLUMN q2_demo_rc_history.othleaguenm___ufl; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.othleaguenm___ufl IS 'United Football League (UFL)';


--
-- Name: COLUMN q2_demo_rc_history.othleaguenm___wfl; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.othleaguenm___wfl IS 'World Football League (WFL)';


--
-- Name: COLUMN q2_demo_rc_history.othleaguenm___xfl; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.othleaguenm___xfl IS 'XFL';


--
-- Name: COLUMN q2_demo_rc_history.othleaguenm___oth; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.othleaguenm___oth IS 'Other';


--
-- Name: COLUMN q2_demo_rc_history.othleague_exp; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.othleague_exp IS 'If "Other", please explain:';


--
-- Name: COLUMN q2_demo_rc_history.nonnfl_seasons; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.nonnfl_seasons IS 'How many seasons did you collectively play that were not in the NFL?';


--
-- Name: COLUMN q2_demo_rc_history.prsqd_nonnfl; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.prsqd_nonnfl IS 'Did you ever spend time on a practice squad for another professional non-NFL Team?';


--
-- Name: COLUMN q2_demo_rc_history.prsqd_nonnfl_seasons; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.prsqd_nonnfl_seasons IS 'Non-NFL Practice Squad:';


--
-- Name: COLUMN q2_demo_rc_history.firstpro_age; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.firstpro_age IS 'How old were you when you played your first professional football game (NFL, CFL, EFL, etc.)?';


--
-- Name: COLUMN q2_demo_rc_history.finalpro_age; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.finalpro_age IS 'How old were you when you played your final professional football game (NFL, CFL, EFL, etc.)?';


--
-- Name: COLUMN q2_demo_rc_history.leftfb___age; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.leftfb___age IS 'Age';


--
-- Name: COLUMN q2_demo_rc_history.leftfb___cut; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.leftfb___cut IS 'Cut from roster';


--
-- Name: COLUMN q2_demo_rc_history.leftfb___fbinj; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.leftfb___fbinj IS 'Injury or health problem related to football';


--
-- Name: COLUMN q2_demo_rc_history.leftfb___inj; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.leftfb___inj IS 'Injury or health problem not related to football';


--
-- Name: COLUMN q2_demo_rc_history.leftfb___retire; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.leftfb___retire IS 'Personal decision (retired)';


--
-- Name: COLUMN q2_demo_rc_history.postfb_hlthprac; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.postfb_hlthprac IS '...First see a healthcare practitioner?';


--
-- Name: COLUMN q2_demo_rc_history.postfb_degree; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.postfb_degree IS '...Go back to school to complete a degree or obtain an advanced degree?';


--
-- Name: COLUMN q2_demo_rc_history.postfb_charity; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.postfb_charity IS '...Begin participating in volunteer or charity work?';


--
-- Name: COLUMN q2_demo_rc_history.postfb_fbjob; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.postfb_fbjob IS '...Become employed in a football related activity?(e.g. coach, scout, administration, media, television, reporting etc.)';


--
-- Name: COLUMN q2_demo_rc_history.postfb_job; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.postfb_job IS '...Become employed in a non-football related activity?';


--
-- Name: COLUMN q2_demo_rc_history.postfbjob_occ; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.postfbjob_occ IS 'What was your first job after leaving football? (Please provide the job title)';


--
-- Name: COLUMN q2_demo_rc_history.postfbjob_occexp; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.postfbjob_occexp IS 'Please explain:';


--
-- Name: COLUMN q2_demo_rc_history.postfbex_walk; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.postfbex_walk IS 'Walking for exercise or walking to work';


--
-- Name: COLUMN q2_demo_rc_history.postfbex_jog; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.postfbex_jog IS 'Jogging (slower than 10min/mile)';


--
-- Name: COLUMN q2_demo_rc_history.postfbex_run; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.postfbex_run IS 'Running (10min/mile or faster)';


--
-- Name: COLUMN q2_demo_rc_history.postfbex_other; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.postfbex_other IS 'Other aerobic exercise (e.g. bicycling, stationary bike, elliptical machine, stairmaster)';


--
-- Name: COLUMN q2_demo_rc_history.postfbex_lowint; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.postfbex_lowint IS 'Low intensity exercise (e.g. yoga, pilates, stretching)';


--
-- Name: COLUMN q2_demo_rc_history.postfbex_wttrain; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.postfbex_wttrain IS 'Weight training (e.g. lifting free weights, using weight machines)';


--
-- Name: COLUMN q2_demo_rc_history.postfbex_endsprt; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.postfbex_endsprt IS 'Competitive endurance sports (e.g. marathon, triathlon)';


--
-- Name: COLUMN q2_demo_rc_history.postfbex_reclg; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.postfbex_reclg IS 'Recreational team leagues (e.g. soccer, basketball, flag football, volleyball)';


--
-- Name: COLUMN q2_demo_rc_history.pastyrex_walk; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pastyrex_walk IS 'Walking for exercise or walking to work';


--
-- Name: COLUMN q2_demo_rc_history.pastyrex_jog; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pastyrex_jog IS 'Jogging (slower than 10min/mile)';


--
-- Name: COLUMN q2_demo_rc_history.pastyrex_run; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pastyrex_run IS 'Running (10min/mile or faster)';


--
-- Name: COLUMN q2_demo_rc_history.pastyrex_oth; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pastyrex_oth IS 'Other aerobic exercise (e.g. bicycling, stationary bike, elliptical machine, stairmaster)';


--
-- Name: COLUMN q2_demo_rc_history.pastyrex_lowint; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pastyrex_lowint IS 'Low intensity exercise (e.g. yoga, pilates, stretching)';


--
-- Name: COLUMN q2_demo_rc_history.pastyrex_wttrain; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pastyrex_wttrain IS 'Weight training (e.g. lifting free weights, using weight machines)';


--
-- Name: COLUMN q2_demo_rc_history.pastyrex_endsprt; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pastyrex_endsprt IS 'Competitive endurance sports (e.g. marathon, triathlon)';


--
-- Name: COLUMN q2_demo_rc_history.pastyrex_reclg; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pastyrex_reclg IS 'Recreational team leagues (e.g. soccer, basketball, flag football, volleyball)';


--
-- Name: COLUMN q2_demo_rc_history.ex150min; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.ex150min IS 'Do you do 2.5 hours or more of moderate intensity aerobic activity per week? (e.g. brisk walking, jogging, cycling, etc.).';


--
-- Name: COLUMN q2_demo_rc_history.ex150min_exp; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.ex150min_exp IS 'Please select the reason that best explains why you do not do at least 2.5 hours of moderate intensity aerobic activity per week:';


--
-- Name: COLUMN q2_demo_rc_history.ex150min_oth; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.ex150min_oth IS 'If other, please explain:';


--
-- Name: COLUMN q2_demo_rc_history.demog___complete; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.demog___complete IS 'Check this box and press "Next Page" to save your answers and move on to the next section.';


--
-- Name: COLUMN q2_demo_rc_history.postfb_wt2yr; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.postfb_wt2yr IS '2 years after leaving professional football play?';


--
-- Name: COLUMN q2_demo_rc_history.postfb_wt5yr; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.postfb_wt5yr IS '5 years after leaving professional football play?';


--
-- Name: COLUMN q2_demo_rc_history.cardiac_rehab; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.cardiac_rehab IS 'Have you participated in cardiac rehab therapy based on a health care provider\''s recommendation?';


--
-- Name: COLUMN q2_demo_rc_history.cvtest_ecg; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.cvtest_ecg IS '12 lead ECG (electrocardiogram)';


--
-- Name: COLUMN q2_demo_rc_history.cvtest_ecg_exp; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.cvtest_ecg_exp IS 'Please specify the diagnosis, if known:';


--
-- Name: COLUMN q2_demo_rc_history.cvtest_echo; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.cvtest_echo IS 'Heart ultrasound (echocardiogram)';


--
-- Name: COLUMN q2_demo_rc_history.cvtest_echo_exp; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.cvtest_echo_exp IS 'Please specify the diagnosis, if known:';


--
-- Name: COLUMN q2_demo_rc_history.cvtest_cpxt; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.cvtest_cpxt IS 'Exercise stress test';


--
-- Name: COLUMN q2_demo_rc_history.cvtest_cpxt_exp; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.cvtest_cpxt_exp IS 'Please specify the diagnosis, if known:';


--
-- Name: COLUMN q2_demo_rc_history.cvtest_cvmri; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.cvtest_cvmri IS 'Cardiac MRI';


--
-- Name: COLUMN q2_demo_rc_history.cvtest_cvmri_exp; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.cvtest_cvmri_exp IS 'Please specify the diagnosis, if known:';


--
-- Name: COLUMN q2_demo_rc_history.cvtest_corct; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.cvtest_corct IS 'Coronary artery CT scan';


--
-- Name: COLUMN q2_demo_rc_history.cvtest_corct_exp; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.cvtest_corct_exp IS 'Please specify the diagnosis, if known:';


--
-- Name: COLUMN q2_demo_rc_history.cvtest_cvcath; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.cvtest_cvcath IS 'Cardiac catheterization (coronary angiogram)';


--
-- Name: COLUMN q2_demo_rc_history.cvtest_cvcath_exp; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.cvtest_cvcath_exp IS 'Please specify the diagnosis, if known:';


--
-- Name: COLUMN q2_demo_rc_history.cvdx_mi; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.cvdx_mi IS 'Heart attack';


--
-- Name: COLUMN q2_demo_rc_history.cvdx_stroke; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.cvdx_stroke IS 'Stroke (CVA)';


--
-- Name: COLUMN q2_demo_rc_history.cvdx_tia; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.cvdx_tia IS 'TIA (Transient ischemic attack/mini-stroke)';


--
-- Name: COLUMN q2_demo_rc_history.cvmedrec_highbp; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.cvmedrec_highbp IS 'High blood pressure';


--
-- Name: COLUMN q2_demo_rc_history.cvmedrec_hrtfail; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.cvmedrec_hrtfail IS 'Heart failure';


--
-- Name: COLUMN q2_demo_rc_history.cvmedrec_afib; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.cvmedrec_afib IS 'Atrial fibrillation';


--
-- Name: COLUMN q2_demo_rc_history.cvmedrec_otharrhyth; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.cvmedrec_otharrhyth IS 'Other arrhythmias (e.g. SVT)';


--
-- Name: COLUMN q2_demo_rc_history.cvmedrec_highchol; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.cvmedrec_highchol IS 'High cholesterol';


--
-- Name: COLUMN q2_demo_rc_history.cvmedrec_diabetes; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.cvmedrec_diabetes IS 'Diabetes or high blood sugar';


--
-- Name: COLUMN q2_demo_rc_history.cvsurg_bypass; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.cvsurg_bypass IS 'Heart bypass, angioplasty, or stent placement';


--
-- Name: COLUMN q2_demo_rc_history.cvsurg_ablation; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.cvsurg_ablation IS 'Ablation for atrial fibrillation';


--
-- Name: COLUMN q2_demo_rc_history.cvsurg_carotidart; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.cvsurg_carotidart IS 'Carotid artery surgery';


--
-- Name: COLUMN q2_demo_rc_history.cvmed_chol; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.cvmed_chol IS '\"Statin\" cholesterol lowering drugs \[e.g. Mervacor (lovastatin), Pravachol (pravastatin), Xocor (simvastatin), Lipitor\]';


--
-- Name: COLUMN q2_demo_rc_history.cvmed_othchol; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.cvmed_othchol IS 'Other cholesterol-lowering drugs \[e.g. Niaspan, Slo-Niacin (niacin), Lopid (gemfibrozil), Tricor (fenofibrate), Questran (cholestyramine)\]';


--
-- Name: COLUMN q2_demo_rc_history.cvmed_novchol; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.cvmed_novchol IS 'Novel cholesterol lowering drugs (PCSK-9 inhibitors) \[e.g. Repatha (evolocumab), Praluent (alirocumab)\]';


--
-- Name: COLUMN q2_demo_rc_history.cvmed_bldthin; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.cvmed_bldthin IS 'Non-aspirin blood thinners \[e.g. Coumadin (warfarin)\]';


--
-- Name: COLUMN q2_demo_rc_history.cvmed_anticoag; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.cvmed_anticoag IS 'Novel oral anti-coagulant \[e.g. Eliquis (apixaban), Pradaxa (dabigatran), Xarelto (rivaroxaban)\]';


--
-- Name: COLUMN q2_demo_rc_history.cvmed_arrhyth; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.cvmed_arrhyth IS 'Anti-arrhythmia drugs for atrial fibrillation \[e.g. beta blockers (Sectral, Tenormin), sotalol (Betapace, Sotylize, Sorine), flecainide (Tambocor), droedarone (Multaq)\]';


--
-- Name: COLUMN q2_demo_rc_history.cvmed_digoxin; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.cvmed_digoxin IS 'Digoxin \[e.g. Lenoxin\]';


--
-- Name: COLUMN q2_demo_rc_history.cvmed_furosemide; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.cvmed_furosemide IS 'Furosemide-like diuretic drug \[e.g. Lasix, Bumex\]';


--
-- Name: COLUMN q2_demo_rc_history.cvmed_thiazide; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.cvmed_thiazide IS 'Thiazide diuretic \[e.g. HCTZ, Microzide\]';


--
-- Name: COLUMN q2_demo_rc_history.cvmed_calciumblk; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.cvmed_calciumblk IS 'Calcium blocker \[e.g. Calan (verapamil), Procardia (nifedipine), Cardizem (diltiazem)\]';


--
-- Name: COLUMN q2_demo_rc_history.cvmed_antihyp; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.cvmed_antihyp IS 'Other antihypertensive \[e.g. Vasotec (enalapril), Capoten (captopril)\]';


--
-- Name: COLUMN q2_demo_rc_history.dbmed_metformin; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.dbmed_metformin IS 'Metformin \[e.g. Glumetza, Glucophage, Fortamet\]';


--
-- Name: COLUMN q2_demo_rc_history.dbmed_glimeperide; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.dbmed_glimeperide IS 'Glimeperide';


--
-- Name: COLUMN q2_demo_rc_history.dbmed_insulin; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.dbmed_insulin IS 'Insulin';


--
-- Name: COLUMN q2_demo_rc_history.dbmed_other; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.dbmed_other IS 'Other diabetes medication';


--
-- Name: COLUMN q2_demo_rc_history.cardiac___complete; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.cardiac___complete IS 'Check this box and press "Next Page" if you are ready to move on to the next section';


--
-- Name: COLUMN q2_demo_rc_history.ad8_1; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.ad8_1 IS 'Problems with judgment. (e.g., problems making decisions, bad financial decisions, problems with thinking)';


--
-- Name: COLUMN q2_demo_rc_history.ad8_2; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.ad8_2 IS 'Less interest in hobbies/activities.';


--
-- Name: COLUMN q2_demo_rc_history.ad8_3; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.ad8_3 IS 'Repeats the same things over and over (questions, stories, or statements).';


--
-- Name: COLUMN q2_demo_rc_history.ad8_4; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.ad8_4 IS 'Trouble learning how to use a tool, appliance, or gadget. (e.g., VCR, computer, microwave, remote control)';


--
-- Name: COLUMN q2_demo_rc_history.ad8_5; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.ad8_5 IS 'Forgets correct month or year.';


--
-- Name: COLUMN q2_demo_rc_history.ad8_6; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.ad8_6 IS 'Trouble handling complicated financial affairs. (e.g. balancing checkbook, income taxes, paying bills).';


--
-- Name: COLUMN q2_demo_rc_history.ad8_7; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.ad8_7 IS 'Trouble remembering appointments.';


--
-- Name: COLUMN q2_demo_rc_history.ad8_8; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.ad8_8 IS 'Daily problems with thinking and/or memory.';


--
-- Name: COLUMN q2_demo_rc_history.nqcog64q2; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.nqcog64q2 IS 'I had to read something several times to understand it.';


--
-- Name: COLUMN q2_demo_rc_history.nqcog65q2; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.nqcog65q2 IS 'I had trouble keeping track of what I was doing if I was interrupted.';


--
-- Name: COLUMN q2_demo_rc_history.nqcog66q2; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.nqcog66q2 IS 'I had difficulty doing more than one thing at a time.';


--
-- Name: COLUMN q2_demo_rc_history.nqcog68q2; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.nqcog68q2 IS 'I had trouble remembering new information, like phone numbers or simple instructions.';


--
-- Name: COLUMN q2_demo_rc_history.nqcog72q2; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.nqcog72q2 IS 'I had trouble thinking clearly.';


--
-- Name: COLUMN q2_demo_rc_history.nqcog75q2; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.nqcog75q2 IS 'My thinking was slow.';


--
-- Name: COLUMN q2_demo_rc_history.nqcog77q2; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.nqcog77q2 IS 'I had to work really hard to pay attention or I would make a mistake.';


--
-- Name: COLUMN q2_demo_rc_history.nqcog80q2; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.nqcog80q2 IS 'I had trouble concentrating.';


--
-- Name: COLUMN q2_demo_rc_history.nqper02; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.nqper02 IS 'I had trouble controlling my temper.';


--
-- Name: COLUMN q2_demo_rc_history.nqper05; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.nqper05 IS 'It was hard to control my behavior.';


--
-- Name: COLUMN q2_demo_rc_history.nqper06; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.nqper06 IS 'I said or did things without thinking.';


--
-- Name: COLUMN q2_demo_rc_history.nqper07; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.nqper07 IS 'I got impatient with other people.';


--
-- Name: COLUMN q2_demo_rc_history.nqper11; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.nqper11 IS 'I was irritable around other people.';


--
-- Name: COLUMN q2_demo_rc_history.nqper12; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.nqper12 IS 'I was bothered by little things.';


--
-- Name: COLUMN q2_demo_rc_history.nqper17; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.nqper17 IS 'I became easily upset.';


--
-- Name: COLUMN q2_demo_rc_history.nqper19; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.nqper19 IS 'I was in conflict with others.';


--
-- Name: COLUMN q2_demo_rc_history.phq1; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.phq1 IS 'Little interest or pleasure in doing things.';


--
-- Name: COLUMN q2_demo_rc_history.phq2; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.phq2 IS 'Feeling down, depressed, or hopeless.';


--
-- Name: COLUMN q2_demo_rc_history.phq3; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.phq3 IS 'Trouble falling or staying asleep, or sleeping too much.';


--
-- Name: COLUMN q2_demo_rc_history.phq4; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.phq4 IS 'Feeling tired or having little energy.';


--
-- Name: COLUMN q2_demo_rc_history.phq5; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.phq5 IS 'Poor appetite or overeating.';


--
-- Name: COLUMN q2_demo_rc_history.phq6; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.phq6 IS 'Feeling bad about yourself - or that you are a failure or have let yourself or your family down.';


--
-- Name: COLUMN q2_demo_rc_history.phq7; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.phq7 IS 'Trouble concentrating on things, such as reading the newspaper or watching television.';


--
-- Name: COLUMN q2_demo_rc_history.phq8; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.phq8 IS 'Moving or speaking so slowly that other people could have noticed. Or the opposite - being so fidgety or restless that you have been moving around a lot more than usual.';


--
-- Name: COLUMN q2_demo_rc_history.phq9; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.phq9 IS 'Thoughts that you would be better off dead or of hurting yourself.';


--
-- Name: COLUMN q2_demo_rc_history.gad7_1; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.gad7_1 IS 'Feeling nervous, anxious or on edge.';


--
-- Name: COLUMN q2_demo_rc_history.gad7_2; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.gad7_2 IS 'Not being able to stop or control worrying.';


--
-- Name: COLUMN q2_demo_rc_history.gad7_3; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.gad7_3 IS 'Worrying too much about different things.';


--
-- Name: COLUMN q2_demo_rc_history.gad7_4; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.gad7_4 IS 'Trouble relaxing.';


--
-- Name: COLUMN q2_demo_rc_history.gad7_5; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.gad7_5 IS 'Being so restless that it is hard to sit still.';


--
-- Name: COLUMN q2_demo_rc_history.gad7_6; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.gad7_6 IS 'Becoming easily annoyed or irritable.';


--
-- Name: COLUMN q2_demo_rc_history.gad7_7; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.gad7_7 IS 'Feeling afraid as if something awful might happen.';


--
-- Name: COLUMN q2_demo_rc_history.lotr1; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.lotr1 IS 'In uncertain times, I usually expect the best.';


--
-- Name: COLUMN q2_demo_rc_history.lotr3; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.lotr3 IS 'If something can go wrong for me, it will.';


--
-- Name: COLUMN q2_demo_rc_history.lotr4; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.lotr4 IS 'I\''m always optimistic about my future.';


--
-- Name: COLUMN q2_demo_rc_history.lotr7; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.lotr7 IS 'I hardly ever expect things to go my way.';


--
-- Name: COLUMN q2_demo_rc_history.lotr9; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.lotr9 IS 'I rarely count on good things happening to me.';


--
-- Name: COLUMN q2_demo_rc_history.lotr10; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.lotr10 IS 'Overall, I expect more good things to happen to me than bad.';


--
-- Name: COLUMN q2_demo_rc_history.stpbng_snore; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.stpbng_snore IS 'Do you SNORE loudly (loud enough to be heard through closed doors or your bed-partner elbows you for snoring at night)?';


--
-- Name: COLUMN q2_demo_rc_history.stpbng_tired; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.stpbng_tired IS 'Do you often feel TIRED, fatigued, or sleepy during the daytime? (such as falling asleep during driving or talking to someone)?';


--
-- Name: COLUMN q2_demo_rc_history.stpbng_obser; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.stpbng_obser IS 'Has anyone observed you stop breathing or choking/gasping during your sleep?';


--
-- Name: COLUMN q2_demo_rc_history.stpbng_bp; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.stpbng_bp IS 'Do you have or are you being treated for high blood pressure?';


--
-- Name: COLUMN q2_demo_rc_history.stpbng_neck; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.stpbng_neck IS 'What is your neck circumference (your collar size when buying a dress shirt)?';


--
-- Name: COLUMN q2_demo_rc_history.cpapuse; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.cpapuse IS 'Do you currently use a CPAP device for sleep apnea?';


--
-- Name: COLUMN q2_demo_rc_history.cpapuse_days; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.cpapuse_days IS 'About how many days per week do you use your CPAP device?';


--
-- Name: COLUMN q2_demo_rc_history.ncmedrec_hdache; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.ncmedrec_hdache IS 'Headaches';


--
-- Name: COLUMN q2_demo_rc_history.ncmedrec_anx; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.ncmedrec_anx IS 'Anxiety';


--
-- Name: COLUMN q2_demo_rc_history.ncmedrec_dep; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.ncmedrec_dep IS 'Depression';


--
-- Name: COLUMN q2_demo_rc_history.ncmedrec_memloss; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.ncmedrec_memloss IS 'Memory loss';


--
-- Name: COLUMN q2_demo_rc_history.ncmedrec_add; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.ncmedrec_add IS 'ADD/ADHD';


--
-- Name: COLUMN q2_demo_rc_history.ncdx_alz; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.ncdx_alz IS 'Alzheimer\''s disease';


--
-- Name: COLUMN q2_demo_rc_history.ncdx_cte; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.ncdx_cte IS 'Chronic traumatic encephalopathy (CTE)';


--
-- Name: COLUMN q2_demo_rc_history.ncdx_vascdem; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.ncdx_vascdem IS 'Vascular dementia';


--
-- Name: COLUMN q2_demo_rc_history.ncdx_othdem; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.ncdx_othdem IS 'Other dementia';


--
-- Name: COLUMN q2_demo_rc_history.ncdx_als; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.ncdx_als IS 'Amyotrophic lateral sclerosis (ALS, Lou Gehrig\''s disease)';


--
-- Name: COLUMN q2_demo_rc_history.ncdx_parkins; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.ncdx_parkins IS 'Parkinson\''s disease';


--
-- Name: COLUMN q2_demo_rc_history.ncdx_ms; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.ncdx_ms IS 'Multiple sclerosis (MS)';


--
-- Name: COLUMN q2_demo_rc_history.ncmed_ssri; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.ncmed_ssri IS 'Prozac, Zoloft, Paxil, Celexa';


--
-- Name: COLUMN q2_demo_rc_history.ncmed_tricydep; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.ncmed_tricydep IS 'Tricyclic antidepressant \[e.g. Elavil, Sinequan\]';


--
-- Name: COLUMN q2_demo_rc_history.ncmed_othdep; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.ncmed_othdep IS 'Other antidepressant \[e.g. Nardil, Marplan\]';


--
-- Name: COLUMN q2_demo_rc_history.ncmed_slpaid; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.ncmed_slpaid IS 'Sleep aid';


--
-- Name: COLUMN q2_demo_rc_history.neurocog___complete; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.neurocog___complete IS 'Check this box and press "Next Page" if you are ready to move on to the next section';


--
-- Name: COLUMN q2_demo_rc_history.bpi1; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.bpi1 IS 'Have you had pain other than these \"everyday\" kinds of pain today?';


--
-- Name: COLUMN q2_demo_rc_history.bpi2___head; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.bpi2___head IS 'Head';


--
-- Name: COLUMN q2_demo_rc_history.bpi2___neck; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.bpi2___neck IS 'Neck';


--
-- Name: COLUMN q2_demo_rc_history.bpi2___shoul; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.bpi2___shoul IS 'Shoulder';


--
-- Name: COLUMN q2_demo_rc_history.bpi2___chest; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.bpi2___chest IS 'Chest';


--
-- Name: COLUMN q2_demo_rc_history.bpi2___arm; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.bpi2___arm IS 'Arm';


--
-- Name: COLUMN q2_demo_rc_history.bpi2___hand; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.bpi2___hand IS 'Hand';


--
-- Name: COLUMN q2_demo_rc_history.bpi2___uback; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.bpi2___uback IS 'Upper back';


--
-- Name: COLUMN q2_demo_rc_history.bpi2___lbak; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.bpi2___lbak IS 'Lower back';


--
-- Name: COLUMN q2_demo_rc_history.bpi2___hip; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.bpi2___hip IS 'Hip';


--
-- Name: COLUMN q2_demo_rc_history.bpi2___leg; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.bpi2___leg IS 'Leg
';


--
-- Name: COLUMN q2_demo_rc_history.bpi2___knee; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.bpi2___knee IS 'Knee';


--
-- Name: COLUMN q2_demo_rc_history.bpi2___ankle; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.bpi2___ankle IS 'Ankle';


--
-- Name: COLUMN q2_demo_rc_history.bpi2___foot; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.bpi2___foot IS 'Foot';


--
-- Name: COLUMN q2_demo_rc_history.bpi2___oth; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.bpi2___oth IS 'Other';


--
-- Name: COLUMN q2_demo_rc_history.bpi2_othexp; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.bpi2_othexp IS 'If you selected \"Other\", please explain:';


--
-- Name: COLUMN q2_demo_rc_history.bpi2most; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.bpi2most IS 'Please indicate the area where you feel the most pain.';


--
-- Name: COLUMN q2_demo_rc_history.bpi2most_othexp; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.bpi2most_othexp IS 'If you selected \"Other\", please explain:';


--
-- Name: COLUMN q2_demo_rc_history.bpi3; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.bpi3 IS 'Please rate your pain by marking the box beside the number that best describes your pain at its *worst* in the last 24 hours.';


--
-- Name: COLUMN q2_demo_rc_history.bpi4; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.bpi4 IS 'Please rate your pain by marking the box beside the number that best describes your pain at its *least* in the last 24 hours.';


--
-- Name: COLUMN q2_demo_rc_history.bpi5; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.bpi5 IS 'Please rate your pain by marking the box beside the number that best describes your pain on the *average*.';


--
-- Name: COLUMN q2_demo_rc_history.bpi6; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.bpi6 IS 'Please rate your pain by marking the box beside the number that tells how much pain you have *right now*.';


--
-- Name: COLUMN q2_demo_rc_history.bpi7___none; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.bpi7___none IS 'None';


--
-- Name: COLUMN q2_demo_rc_history.bpi7___otc; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.bpi7___otc IS 'Over the counter medication';


--
-- Name: COLUMN q2_demo_rc_history.bpi7___prmed; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.bpi7___prmed IS 'Prescribed medication';


--
-- Name: COLUMN q2_demo_rc_history.bpi7___mass; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.bpi7___mass IS 'Massage/acupressure';


--
-- Name: COLUMN q2_demo_rc_history.bpi7___pt; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.bpi7___pt IS 'Physical therapy';


--
-- Name: COLUMN q2_demo_rc_history.bpi7___acup; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.bpi7___acup IS 'Acupuncture';


--
-- Name: COLUMN q2_demo_rc_history.bpi7___marij; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.bpi7___marij IS 'Marijuana or medical marijuana';


--
-- Name: COLUMN q2_demo_rc_history.bpi7___intpm; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.bpi7___intpm IS 'Interventional pain management (nerve
 blocks, joint injections or radiotherapy)';


--
-- Name: COLUMN q2_demo_rc_history.bpi7___oth; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.bpi7___oth IS 'Other';


--
-- Name: COLUMN q2_demo_rc_history.bpi7_othexp; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.bpi7_othexp IS 'If you selected \"Other\", please explain:';


--
-- Name: COLUMN q2_demo_rc_history.bpi8; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.bpi8 IS 'In the last 24 hours, how much relief have pain treatments or medications provided? Please mark the box below the percentage that most shows how much relief you have received.';


--
-- Name: COLUMN q2_demo_rc_history.bpi9a; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.bpi9a IS 'General activity';


--
-- Name: COLUMN q2_demo_rc_history.bpi9b; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.bpi9b IS 'Mood';


--
-- Name: COLUMN q2_demo_rc_history.bpi9c; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.bpi9c IS 'Walking ability';


--
-- Name: COLUMN q2_demo_rc_history.bpi9d; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.bpi9d IS 'Normal work (includes both work outside the home and housework)';


--
-- Name: COLUMN q2_demo_rc_history.bpi9e; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.bpi9e IS 'Relations with other people';


--
-- Name: COLUMN q2_demo_rc_history.bpi9f; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.bpi9f IS 'Sleep';


--
-- Name: COLUMN q2_demo_rc_history.bpi9g; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.bpi9g IS 'Enjoyment of life';


--
-- Name: COLUMN q2_demo_rc_history.bpi9h; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.bpi9h IS 'Exercise for health and wellness';


--
-- Name: COLUMN q2_demo_rc_history.pnmedfb_acetamin; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pnmedfb_acetamin IS 'Acetaminophen \[e.g. Tylenol\]';


--
-- Name: COLUMN q2_demo_rc_history.pnmedfb_aspirin; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pnmedfb_aspirin IS 'Aspirin or aspirin containing products \[e.g. Excedrin Migraine, Alka-Seltzer with aspirin\]';


--
-- Name: COLUMN q2_demo_rc_history.pnmedfb_ibuprof; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pnmedfb_ibuprof IS 'Ibuprofen \[e.g. Motrin, Advil\]';


--
-- Name: COLUMN q2_demo_rc_history.pnmedfb_othantiinf; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pnmedfb_othantiinf IS 'Other anti-inflammatory analgesics \[e.g. Aleve, Naprosyn, Relafen, Frotek, Anaprox\]';


--
-- Name: COLUMN q2_demo_rc_history.pnmedfb_oralster; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pnmedfb_oralster IS 'Steroid taken orally \[e.g. Prednisone, Medrol\]';


--
-- Name: COLUMN q2_demo_rc_history.pnmedfb_opioid; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pnmedfb_opioid IS 'Opioid-based pain medication \[e.g. Percocet, Vicodin\]';


--
-- Name: COLUMN q2_demo_rc_history.pnmed5yr_acetamin; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pnmed5yr_acetamin IS 'Acetaminophen \[e.g. Tylenol\]';


--
-- Name: COLUMN q2_demo_rc_history.pnmed5yr_aspirin; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pnmed5yr_aspirin IS 'Aspirin or aspirin containing products \[e.g. Excedrin Migraine, Alka-Seltzer with aspirin\]';


--
-- Name: COLUMN q2_demo_rc_history.pnmed5yr_ibuprof; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pnmed5yr_ibuprof IS 'Ibuprofen \[e.g. Motrin, Advil\]';


--
-- Name: COLUMN q2_demo_rc_history.pnmed5yr_antiinf; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pnmed5yr_antiinf IS 'Other anti-inflammatory analgesics \[e.g. Aleve, Naprosyn, Relafen, Ketoprofen, Anaprox\]';


--
-- Name: COLUMN q2_demo_rc_history.pnmed5yr_oralster; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pnmed5yr_oralster IS 'Steroid taken orally \[e.g. Prednisone, Medrol\]';


--
-- Name: COLUMN q2_demo_rc_history.pnmed5yr_opioid; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pnmed5yr_opioid IS 'Opioid-based pain medication \[e.g. Percocet, Vicodin\]';


--
-- Name: COLUMN q2_demo_rc_history.pnmed_acetamin; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pnmed_acetamin IS 'Acetaminophen \[e.g. Tylenol\]';


--
-- Name: COLUMN q2_demo_rc_history.pnmed_acetamin_days; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pnmed_acetamin_days IS 'Days per week';


--
-- Name: COLUMN q2_demo_rc_history.pnmed_acetamin_tabs; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pnmed_acetamin_tabs IS 'Tablets per day';


--
-- Name: COLUMN q2_demo_rc_history.pnmed_acetamin_dose; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pnmed_acetamin_dose IS 'Usual dose per tab';


--
-- Name: COLUMN q2_demo_rc_history.pnmed_aspirin; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pnmed_aspirin IS 'Aspirin or aspirin containing products \[e.g. Excedrin Migraine, Alka-Seltzer with aspirin\]';


--
-- Name: COLUMN q2_demo_rc_history.pnmed_aspirin_days; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pnmed_aspirin_days IS 'Days per week';


--
-- Name: COLUMN q2_demo_rc_history.pnmed_aspirin_tabs; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pnmed_aspirin_tabs IS 'Tablets per day';


--
-- Name: COLUMN q2_demo_rc_history.pnmed_aspirin_dose; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pnmed_aspirin_dose IS 'Usual dose per tab';


--
-- Name: COLUMN q2_demo_rc_history.pnmed_ibuprof; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pnmed_ibuprof IS 'Ibuprofen \[e.g. Motrin, Advil\]';


--
-- Name: COLUMN q2_demo_rc_history.pnmed_ibuprof_days; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pnmed_ibuprof_days IS 'Days per week';


--
-- Name: COLUMN q2_demo_rc_history.pnmed_ibuprof_tabs; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pnmed_ibuprof_tabs IS 'Tablets per day';


--
-- Name: COLUMN q2_demo_rc_history.pnmed_ibuprof_dose; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pnmed_ibuprof_dose IS 'Usual dose per tab';


--
-- Name: COLUMN q2_demo_rc_history.pnmed_antiinf; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pnmed_antiinf IS 'Other anti-inflammatory analgesics \[e.g. Aleve, Naprosyn, Relafen, Ketoprofen, Anaprox\]';


--
-- Name: COLUMN q2_demo_rc_history.pnmed_antiinf_days; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pnmed_antiinf_days IS 'Days per week';


--
-- Name: COLUMN q2_demo_rc_history.pnmed_antiinf_tabs; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pnmed_antiinf_tabs IS 'Tablets per day';


--
-- Name: COLUMN q2_demo_rc_history.pnmed_antiinf_dose; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pnmed_antiinf_dose IS 'Usual dose per tab';


--
-- Name: COLUMN q2_demo_rc_history.pnmed_oralster; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pnmed_oralster IS 'Steroid taken orally \[e.g. Prednisone, Medrol\]';


--
-- Name: COLUMN q2_demo_rc_history.pnmed_oralster_days; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pnmed_oralster_days IS 'Days per week';


--
-- Name: COLUMN q2_demo_rc_history.pnmed_oralster_tabs; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pnmed_oralster_tabs IS 'Tablets per day';


--
-- Name: COLUMN q2_demo_rc_history.pnmed_oralster_dose; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pnmed_oralster_dose IS 'Usual dose per tab';


--
-- Name: COLUMN q2_demo_rc_history.pnmed_opioid; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pnmed_opioid IS 'Opioid-based pain medication \[e.g. Percocet, Vicodin\]';


--
-- Name: COLUMN q2_demo_rc_history.pnmed_opioid_days; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pnmed_opioid_days IS 'Days per week';


--
-- Name: COLUMN q2_demo_rc_history.pnmed_opioid_tab; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pnmed_opioid_tab IS 'Tablets per days';


--
-- Name: COLUMN q2_demo_rc_history.pnmed_opioid_dose; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pnmed_opioid_dose IS 'Usual dose per tab';


--
-- Name: COLUMN q2_demo_rc_history.pnsurg_nckspin; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pnsurg_nckspin IS 'Neck/spine surgery';


--
-- Name: COLUMN q2_demo_rc_history.pnsurg_back; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pnsurg_back IS 'Back (lumbar) surgery';


--
-- Name: COLUMN q2_demo_rc_history.pnsurg_hip; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pnsurg_hip IS 'Hip replacement';


--
-- Name: COLUMN q2_demo_rc_history.pnsurg_knee; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pnsurg_knee IS 'Knee replacement';


--
-- Name: COLUMN q2_demo_rc_history.pain___complete; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pain___complete IS 'Check this box and press "Next Page" if you are ready to move on to the next section';


--
-- Name: COLUMN q2_demo_rc_history.wealth; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.wealth IS 'What is your approximate household net worth? \[the value of all the assets of people in your household (like housing, cars, stock, retirement funds, and business ownership) minus any debt or loans you and household members may have (like mortgages, credit card debt or car, school, or business loans\].';


--
-- Name: COLUMN q2_demo_rc_history.wealth_emerg___1; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.wealth_emerg___1 IS 'Put it on my credit card and pay it off in full at thenext statement';


--
-- Name: COLUMN q2_demo_rc_history.wealth_emerg___2; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.wealth_emerg___2 IS 'Put it on my credit card and pay it off over time';


--
-- Name: COLUMN q2_demo_rc_history.wealth_emerg___3; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.wealth_emerg___3 IS 'With the money currently in my checking/savings account or with cash';


--
-- Name: COLUMN q2_demo_rc_history.wealth_emerg___4; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.wealth_emerg___4 IS 'Using money from a bank loan or line of credit';


--
-- Name: COLUMN q2_demo_rc_history.wealth_emerg___5; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.wealth_emerg___5 IS 'By borrowing from a friend or family member';


--
-- Name: COLUMN q2_demo_rc_history.wealth_emerg___6; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.wealth_emerg___6 IS 'Using a payday loan, deposit advance, oroverdraft';


--
-- Name: COLUMN q2_demo_rc_history.wealth_emerg___7; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.wealth_emerg___7 IS 'By selling something';


--
-- Name: COLUMN q2_demo_rc_history.wealth_emerg___8; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.wealth_emerg___8 IS 'I wouldn''t be able to pay for the expense right now';


--
-- Name: COLUMN q2_demo_rc_history.wealth_emerg___9; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.wealth_emerg___9 IS 'Other';


--
-- Name: COLUMN q2_demo_rc_history.wealth_emerg_oth; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.wealth_emerg_oth IS 'Please explain:';


--
-- Name: COLUMN q2_demo_rc_history.ladder_wealth; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.ladder_wealth IS 'Where would you place yourself on this ladder? (Select the number that
best represents where you think you stand, relative to other people in
the United States)';


--
-- Name: COLUMN q2_demo_rc_history.ladder_comm; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.ladder_comm IS 'Where would you place yourself on this ladder? (Select the number that
best represents where you think you stand, relative to other people in
the United States)';


--
-- Name: COLUMN q2_demo_rc_history.household_number; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.household_number IS 'How many people are in your household?';


--
-- Name: COLUMN q2_demo_rc_history.hcutil_pcp; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.hcutil_pcp IS 'Have you seen you seen your primary care physician (PCP) in the past 3 years?';


--
-- Name: COLUMN q2_demo_rc_history.hcutil_pcp_exp; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.hcutil_pcp_exp IS 'If not, why?';


--
-- Name: COLUMN q2_demo_rc_history.hcutil_pcp_oth; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.hcutil_pcp_oth IS 'If "Other", please explain:';


--
-- Name: COLUMN q2_demo_rc_history.hcutil_othprov; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.hcutil_othprov IS 'Have you seen a physician or healthcare provider other than your PCP in the past 3 years? (e.g. physical therapist, cardiologist, endocrinologist, etc.)';


--
-- Name: COLUMN q2_demo_rc_history.selfrpt_cte; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.selfrpt_cte IS 'Do *you* believe you have Chronic Traumatic Encephalopathy (CTE)?';


--
-- Name: COLUMN q2_demo_rc_history.otdx_arthritis; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.otdx_arthritis IS 'Arthritis (e.g. osteoarthritis)';


--
-- Name: COLUMN q2_demo_rc_history.otdx_slpapnea; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.otdx_slpapnea IS 'Sleep apnea';


--
-- Name: COLUMN q2_demo_rc_history.otdx_prostcanc; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.otdx_prostcanc IS 'Prostate cancer';


--
-- Name: COLUMN q2_demo_rc_history.otdx_basalcanc; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.otdx_basalcanc IS 'Basal cell skin cancer';


--
-- Name: COLUMN q2_demo_rc_history.otdx_squamcanc; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.otdx_squamcanc IS 'Squamous cell skin cancer';


--
-- Name: COLUMN q2_demo_rc_history.otdx_melanom; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.otdx_melanom IS 'Melanoma';


--
-- Name: COLUMN q2_demo_rc_history.otdx_lymphom; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.otdx_lymphom IS 'Lymphoma';


--
-- Name: COLUMN q2_demo_rc_history.otdx_othcanc; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.otdx_othcanc IS 'Other cancer';


--
-- Name: COLUMN q2_demo_rc_history.otdx_renalfail; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.otdx_renalfail IS 'Chronic renal failure';


--
-- Name: COLUMN q2_demo_rc_history.otdx_alcdep; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.otdx_alcdep IS 'Alcohol dependence problem';


--
-- Name: COLUMN q2_demo_rc_history.otdx_livcirrhosis; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.otdx_livcirrhosis IS 'Liver cirrhosis';


--
-- Name: COLUMN q2_demo_rc_history.otdx_livfail; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.otdx_livfail IS 'Liver failure';


--
-- Name: COLUMN q2_demo_rc_history.otmedrec_pncond; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.otmedrec_pncond IS 'Pain related condition';


--
-- Name: COLUMN q2_demo_rc_history.otmedrec_livprob; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.otmedrec_livprob IS 'Liver problem';


--
-- Name: COLUMN q2_demo_rc_history.otmedrec_lowtest; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.otmedrec_lowtest IS 'Low testosterone';


--
-- Name: COLUMN q2_demo_rc_history.otmedrec_ed; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.otmedrec_ed IS 'Erectile dysfunction (E.D.)';


--
-- Name: COLUMN q2_demo_rc_history.massage; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.massage IS 'Massage';


--
-- Name: COLUMN q2_demo_rc_history.acupuncture; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.acupuncture IS 'Acupuncture';


--
-- Name: COLUMN q2_demo_rc_history.chiropractic; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.chiropractic IS 'Chiropractic treatment';


--
-- Name: COLUMN q2_demo_rc_history.yoga; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.yoga IS 'Yoga';


--
-- Name: COLUMN q2_demo_rc_history.taichi; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.taichi IS 'Tai chi';


--
-- Name: COLUMN q2_demo_rc_history.meditation; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.meditation IS 'Meditation';


--
-- Name: COLUMN q2_demo_rc_history.othaltmed; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.othaltmed IS 'Other alternative medication';


--
-- Name: COLUMN q2_demo_rc_history.othaltmed_exp; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.othaltmed_exp IS 'Please specify:';


--
-- Name: COLUMN q2_demo_rc_history.famhxmoth___na; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.famhxmoth___na IS 'Not applicable
';


--
-- Name: COLUMN q2_demo_rc_history.famhxmoth___lung; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.famhxmoth___lung IS 'Lung
 cancer';


--
-- Name: COLUMN q2_demo_rc_history.famhxmoth___colrec; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.famhxmoth___colrec IS 'Colon 
or rectal cancer';


--
-- Name: COLUMN q2_demo_rc_history.famhxmoth___diab; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.famhxmoth___diab IS 'Diabetes ';


--
-- Name: COLUMN q2_demo_rc_history.famhxmoth___mela; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.famhxmoth___mela IS 'Melanoma';


--
-- Name: COLUMN q2_demo_rc_history.famhxmoth___hypert; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.famhxmoth___hypert IS 'Hypertension';


--
-- Name: COLUMN q2_demo_rc_history.famhxmoth___dem; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.famhxmoth___dem IS 'Dementia before
age 70';


--
-- Name: COLUMN q2_demo_rc_history.famhxmoth___alc; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.famhxmoth___alc IS 'Alcohol problem';


--
-- Name: COLUMN q2_demo_rc_history.famhxfsib___na; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.famhxfsib___na IS 'Not applicable
';


--
-- Name: COLUMN q2_demo_rc_history.famhxfsib___lung; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.famhxfsib___lung IS 'Lung
 cancer';


--
-- Name: COLUMN q2_demo_rc_history.famhxfsib___colrec; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.famhxfsib___colrec IS 'Colon 
or rectal cancer';


--
-- Name: COLUMN q2_demo_rc_history.famhxfsib___diab; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.famhxfsib___diab IS 'Diabetes ';


--
-- Name: COLUMN q2_demo_rc_history.famhxfsib___mela; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.famhxfsib___mela IS 'Melanoma';


--
-- Name: COLUMN q2_demo_rc_history.famhxfsib___hypert; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.famhxfsib___hypert IS 'Hypertension';


--
-- Name: COLUMN q2_demo_rc_history.famhxfsib___dem; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.famhxfsib___dem IS 'Dementia before
age 70';


--
-- Name: COLUMN q2_demo_rc_history.famhxfsib___alc; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.famhxfsib___alc IS 'Alcohol problem';


--
-- Name: COLUMN q2_demo_rc_history.femsib_number; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.femsib_number IS 'How many full female siblings do you have?';


--
-- Name: COLUMN q2_demo_rc_history.famhxfath___na; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.famhxfath___na IS 'Not applicable';


--
-- Name: COLUMN q2_demo_rc_history.famhxfath___lung; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.famhxfath___lung IS 'Lung cancer';


--
-- Name: COLUMN q2_demo_rc_history.famhxfath___colrec; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.famhxfath___colrec IS 'Colon 
or rectal cancer';


--
-- Name: COLUMN q2_demo_rc_history.famhxfath___prost; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.famhxfath___prost IS 'Prostate cancer';


--
-- Name: COLUMN q2_demo_rc_history.famhxfath___diab; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.famhxfath___diab IS 'Diabetes ';


--
-- Name: COLUMN q2_demo_rc_history.famhxfath___mela; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.famhxfath___mela IS 'Melanoma';


--
-- Name: COLUMN q2_demo_rc_history.famhxfath___hypert; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.famhxfath___hypert IS 'Hypertension';


--
-- Name: COLUMN q2_demo_rc_history.famhxfath___dem; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.famhxfath___dem IS 'Dementia before age
70';


--
-- Name: COLUMN q2_demo_rc_history.famhxfath___alc; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.famhxfath___alc IS 'Alcohol problem';


--
-- Name: COLUMN q2_demo_rc_history.famhxmsib___na; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.famhxmsib___na IS 'Not applicable';


--
-- Name: COLUMN q2_demo_rc_history.famhxmsib___lung; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.famhxmsib___lung IS 'Lung cancer';


--
-- Name: COLUMN q2_demo_rc_history.famhxmsib___colrec; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.famhxmsib___colrec IS 'Colon 
or rectal cancer';


--
-- Name: COLUMN q2_demo_rc_history.famhxmsib___prost; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.famhxmsib___prost IS 'Prostate cancer';


--
-- Name: COLUMN q2_demo_rc_history.famhxmsib___diab; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.famhxmsib___diab IS 'Diabetes ';


--
-- Name: COLUMN q2_demo_rc_history.famhxmsib___mela; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.famhxmsib___mela IS 'Melanoma';


--
-- Name: COLUMN q2_demo_rc_history.famhxmsib___hypert; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.famhxmsib___hypert IS 'Hypertension';


--
-- Name: COLUMN q2_demo_rc_history.famhxmsib___dem; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.famhxmsib___dem IS 'Dementia before age
70';


--
-- Name: COLUMN q2_demo_rc_history.famhxmsib___alc; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.famhxmsib___alc IS 'Alcohol problem';


--
-- Name: COLUMN q2_demo_rc_history.sib_number; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.sib_number IS 'How many full male siblings do you have?';


--
-- Name: COLUMN q2_demo_rc_history.sib1age; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.sib1age IS 'Current age:';


--
-- Name: COLUMN q2_demo_rc_history.sib1ht_feet; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.sib1ht_feet IS 'Height (feet):';


--
-- Name: COLUMN q2_demo_rc_history.sib1ht_inch; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.sib1ht_inch IS 'Height (inches):';


--
-- Name: COLUMN q2_demo_rc_history.sib1sport___none; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.sib1sport___none IS 'Did not play sports';


--
-- Name: COLUMN q2_demo_rc_history.sib1sport___hsfb; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.sib1sport___hsfb IS 'Played H.S. football';


--
-- Name: COLUMN q2_demo_rc_history.sib1sport___colfb; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.sib1sport___colfb IS 'Played college football';


--
-- Name: COLUMN q2_demo_rc_history.sib1sport___oth; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.sib1sport___oth IS 'Other';


--
-- Name: COLUMN q2_demo_rc_history.sib1sport_oth; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.sib1sport_oth IS 'Please specify:';


--
-- Name: COLUMN q2_demo_rc_history.sib2age; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.sib2age IS 'Current age:';


--
-- Name: COLUMN q2_demo_rc_history.sib2ht_feet; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.sib2ht_feet IS 'Height (feet):';


--
-- Name: COLUMN q2_demo_rc_history.sib2ht_inch; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.sib2ht_inch IS 'Height (inches):';


--
-- Name: COLUMN q2_demo_rc_history.sib2sport___none; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.sib2sport___none IS 'Did not play sports';


--
-- Name: COLUMN q2_demo_rc_history.sib2sport___hsfb; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.sib2sport___hsfb IS 'Played H.S. football';


--
-- Name: COLUMN q2_demo_rc_history.sib2sport___colfb; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.sib2sport___colfb IS 'Played college football';


--
-- Name: COLUMN q2_demo_rc_history.sib2sport___oth; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.sib2sport___oth IS 'Other';


--
-- Name: COLUMN q2_demo_rc_history.sib2sport_oth; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.sib2sport_oth IS 'Please specify:';


--
-- Name: COLUMN q2_demo_rc_history.sib3age; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.sib3age IS 'Current age:';


--
-- Name: COLUMN q2_demo_rc_history.sib3ht_feet; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.sib3ht_feet IS 'Height (feet):';


--
-- Name: COLUMN q2_demo_rc_history.sib3ht_inch; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.sib3ht_inch IS 'Height (inches):';


--
-- Name: COLUMN q2_demo_rc_history.sib3sport___none; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.sib3sport___none IS 'Did not play sports';


--
-- Name: COLUMN q2_demo_rc_history.sib3sport___hsfb; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.sib3sport___hsfb IS 'Played H.S. football';


--
-- Name: COLUMN q2_demo_rc_history.sib3sport___colfb; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.sib3sport___colfb IS 'Played college football';


--
-- Name: COLUMN q2_demo_rc_history.sib3sport___oth; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.sib3sport___oth IS 'Other';


--
-- Name: COLUMN q2_demo_rc_history.sib3sport_oth; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.sib3sport_oth IS 'Please specify:';


--
-- Name: COLUMN q2_demo_rc_history.sib4age; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.sib4age IS 'Current age:';


--
-- Name: COLUMN q2_demo_rc_history.sib4ht_feet; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.sib4ht_feet IS 'Height (feet):';


--
-- Name: COLUMN q2_demo_rc_history.sib4ht_inch; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.sib4ht_inch IS 'Height (inches):';


--
-- Name: COLUMN q2_demo_rc_history.sib4sport___none; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.sib4sport___none IS 'Did not play sports';


--
-- Name: COLUMN q2_demo_rc_history.sib4sport___hsfb; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.sib4sport___hsfb IS 'Played H.S. football';


--
-- Name: COLUMN q2_demo_rc_history.sib4sport___colfb; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.sib4sport___colfb IS 'Played college football';


--
-- Name: COLUMN q2_demo_rc_history.sib4sport___oth; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.sib4sport___oth IS 'Other';


--
-- Name: COLUMN q2_demo_rc_history.sib4sportoth; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.sib4sportoth IS 'Please specify:';


--
-- Name: COLUMN q2_demo_rc_history.sib5age; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.sib5age IS 'Current age:';


--
-- Name: COLUMN q2_demo_rc_history.sib5ht_feet; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.sib5ht_feet IS 'Height (feet):';


--
-- Name: COLUMN q2_demo_rc_history.sib5ht_inch; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.sib5ht_inch IS 'Height (inches):';


--
-- Name: COLUMN q2_demo_rc_history.sib5sport___none; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.sib5sport___none IS 'Did not play sports';


--
-- Name: COLUMN q2_demo_rc_history.sib5sport___hsfb; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.sib5sport___hsfb IS 'Played H.S. football';


--
-- Name: COLUMN q2_demo_rc_history.sib5sport___colfb; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.sib5sport___colfb IS 'Played college football';


--
-- Name: COLUMN q2_demo_rc_history.sib5sport___oth; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.sib5sport___oth IS 'Other';


--
-- Name: COLUMN q2_demo_rc_history.sib5sport_oth; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.sib5sport_oth IS 'Please specify:';


--
-- Name: COLUMN q2_demo_rc_history.pedcaff___noans; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pedcaff___noans IS 'Prefer not
 to answer';


--
-- Name: COLUMN q2_demo_rc_history.pedcaff___no; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pedcaff___no IS 'No';


--
-- Name: COLUMN q2_demo_rc_history.pedcaff___fb; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pedcaff___fb IS 'Yes, during
active play';


--
-- Name: COLUMN q2_demo_rc_history.pedcaff___cur; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pedcaff___cur IS 'Yes,
currently';


--
-- Name: COLUMN q2_demo_rc_history.pededrink___noans; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pededrink___noans IS 'Prefer not
 to answer';


--
-- Name: COLUMN q2_demo_rc_history.pededrink___no; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pededrink___no IS 'No';


--
-- Name: COLUMN q2_demo_rc_history.pededrink___fb; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pededrink___fb IS 'Yes, during
active play';


--
-- Name: COLUMN q2_demo_rc_history.pededrink___cur; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pededrink___cur IS 'Yes,
currently';


--
-- Name: COLUMN q2_demo_rc_history.pedcreat___noans; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pedcreat___noans IS 'Prefer not
 to answer';


--
-- Name: COLUMN q2_demo_rc_history.pedcreat___no; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pedcreat___no IS 'No';


--
-- Name: COLUMN q2_demo_rc_history.pedcreat___fb; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pedcreat___fb IS 'Yes, during
active play';


--
-- Name: COLUMN q2_demo_rc_history.pedcreat___cur; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pedcreat___cur IS 'Yes,
currently';


--
-- Name: COLUMN q2_demo_rc_history.pedsteroid___noans; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pedsteroid___noans IS 'Prefer not
 to answer';


--
-- Name: COLUMN q2_demo_rc_history.pedsteroid___no; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pedsteroid___no IS 'No';


--
-- Name: COLUMN q2_demo_rc_history.pedsteroid___fb; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pedsteroid___fb IS 'Yes, during
active play';


--
-- Name: COLUMN q2_demo_rc_history.pedsteroid___cur; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pedsteroid___cur IS 'Yes,
currently';


--
-- Name: COLUMN q2_demo_rc_history.pedgh___noans; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pedgh___noans IS 'Prefer not
 to answer';


--
-- Name: COLUMN q2_demo_rc_history.pedgh___no; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pedgh___no IS 'No';


--
-- Name: COLUMN q2_demo_rc_history.pedgh___fb; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pedgh___fb IS 'Yes, during
active play';


--
-- Name: COLUMN q2_demo_rc_history.pedgh___cur; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pedgh___cur IS 'Yes,
currently';


--
-- Name: COLUMN q2_demo_rc_history.pedephed___noans; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pedephed___noans IS 'Prefer not
 to answer';


--
-- Name: COLUMN q2_demo_rc_history.pedephed___no; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pedephed___no IS 'No';


--
-- Name: COLUMN q2_demo_rc_history.pedephed___fb; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pedephed___fb IS 'Yes, during
active play';


--
-- Name: COLUMN q2_demo_rc_history.pedephed___cur; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pedephed___cur IS 'Yes,
currently';


--
-- Name: COLUMN q2_demo_rc_history.pedbetahy___noans; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pedbetahy___noans IS 'Prefer not
 to answer';


--
-- Name: COLUMN q2_demo_rc_history.pedbetahy___no; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pedbetahy___no IS 'No';


--
-- Name: COLUMN q2_demo_rc_history.pedbetahy___fb; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pedbetahy___fb IS 'Yes, during
active play';


--
-- Name: COLUMN q2_demo_rc_history.pedbetahy___cur; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pedbetahy___cur IS 'Yes,
currently';


--
-- Name: COLUMN q2_demo_rc_history.pednoncaf___noans; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pednoncaf___noans IS 'Prefer not
 to answer';


--
-- Name: COLUMN q2_demo_rc_history.pednoncaf___no; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pednoncaf___no IS 'No';


--
-- Name: COLUMN q2_demo_rc_history.pednoncaf___fb; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pednoncaf___fb IS 'Yes, during
active play';


--
-- Name: COLUMN q2_demo_rc_history.pednoncaf___cur; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pednoncaf___cur IS 'Yes,
currently';


--
-- Name: COLUMN q2_demo_rc_history.pedrcell___noans; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pedrcell___noans IS 'Prefer not
 to answer';


--
-- Name: COLUMN q2_demo_rc_history.pedrcell___no; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pedrcell___no IS 'No';


--
-- Name: COLUMN q2_demo_rc_history.pedrcell___fb; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pedrcell___fb IS 'Yes, during
active play';


--
-- Name: COLUMN q2_demo_rc_history.pedrcell___cur; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pedrcell___cur IS 'Yes,
currently';


--
-- Name: COLUMN q2_demo_rc_history.pedinos___noans; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pedinos___noans IS 'Prefer not
 to answer';


--
-- Name: COLUMN q2_demo_rc_history.pedinos___no; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pedinos___no IS 'No';


--
-- Name: COLUMN q2_demo_rc_history.pedinos___fb; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pedinos___fb IS 'Yes, during
active play';


--
-- Name: COLUMN q2_demo_rc_history.pedinos___cur; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pedinos___cur IS 'Yes,
currently';


--
-- Name: COLUMN q2_demo_rc_history.alcohol_days; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.alcohol_days IS 'In a typical week, how many days do you drink a beverage containing alcohol?';


--
-- Name: COLUMN q2_demo_rc_history.alcohol_drinks; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.alcohol_drinks IS 'On a typical day that you drink, how many alcoholic beverages do you usually have?';


--
-- Name: COLUMN q2_demo_rc_history.marijuana; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.marijuana IS 'Do you smoke or ingest marijuana?';


--
-- Name: COLUMN q2_demo_rc_history.marijuana_start; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.marijuana_start IS 'How old were you when you started smoking marijuana?';


--
-- Name: COLUMN q2_demo_rc_history.marijuana_stop; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.marijuana_stop IS 'How old were you when you stopped smoking marijuana?';


--
-- Name: COLUMN q2_demo_rc_history.marijuana_totyrs; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.marijuana_totyrs IS 'How many years, in total, have you smoked marijuana? (if you quit more than once, estimate the total years you considered yourself an active smoker)';


--
-- Name: COLUMN q2_demo_rc_history.marijtime___pnfl; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.marijtime___pnfl IS 'Before playing in the NFL';


--
-- Name: COLUMN q2_demo_rc_history.marijtime___dnfl; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.marijtime___dnfl IS 'While playing in the NFL';


--
-- Name: COLUMN q2_demo_rc_history.marijtime___anfl; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.marijtime___anfl IS 'After playing in the NFL';


--
-- Name: COLUMN q2_demo_rc_history.marijreas___fun; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.marijreas___fun IS 'Fun';


--
-- Name: COLUMN q2_demo_rc_history.marijreas___relx; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.marijreas___relx IS 'Relaxation';


--
-- Name: COLUMN q2_demo_rc_history.marijreas___pain; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.marijreas___pain IS 'Pain';


--
-- Name: COLUMN q2_demo_rc_history.marijreas___anx; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.marijreas___anx IS 'Anxiety';


--
-- Name: COLUMN q2_demo_rc_history.marijreas___dep; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.marijreas___dep IS 'Depression';


--
-- Name: COLUMN q2_demo_rc_history.marijreas___oth; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.marijreas___oth IS 'Other';


--
-- Name: COLUMN q2_demo_rc_history.marijreas_exp; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.marijreas_exp IS 'If \"Other\" reason, please explain:';


--
-- Name: COLUMN q2_demo_rc_history.born_address; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.born_address IS 'Address:';


--
-- Name: COLUMN q2_demo_rc_history.born_city; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.born_city IS 'City:';


--
-- Name: COLUMN q2_demo_rc_history.born_state; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.born_state IS 'State:';


--
-- Name: COLUMN q2_demo_rc_history.born_zip; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.born_zip IS 'Zip code (if known)';


--
-- Name: COLUMN q2_demo_rc_history.twelveyrs_address; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.twelveyrs_address IS 'Address:';


--
-- Name: COLUMN q2_demo_rc_history.twelveyrs_city; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.twelveyrs_city IS 'City:';


--
-- Name: COLUMN q2_demo_rc_history.twelveyrs_state; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.twelveyrs_state IS 'State:';


--
-- Name: COLUMN q2_demo_rc_history.twelveyrs_zip; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.twelveyrs_zip IS 'Zip code (if known)';


--
-- Name: COLUMN q2_demo_rc_history.infertility; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.infertility IS 'Have you and a female spouse or partner ever tried to become pregnant for 12 consecutive months without becoming pregnant (even if she ultimately became pregnant)?';


--
-- Name: COLUMN q2_demo_rc_history.infert_age; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.infert_age IS 'How old were you when this first happened?';


--
-- Name: COLUMN q2_demo_rc_history.infert_hcp; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.infert_hcp IS 'Did you seek help from a healthcare provider?';


--
-- Name: COLUMN q2_demo_rc_history.infertreas___fem; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.infertreas___fem IS 'Female factor';


--
-- Name: COLUMN q2_demo_rc_history.infertreas___mal; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.infertreas___mal IS 'Male factor';


--
-- Name: COLUMN q2_demo_rc_history.infertreas___unex; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.infertreas___unex IS 'Unexplained';


--
-- Name: COLUMN q2_demo_rc_history.infertreas___oth; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.infertreas___oth IS 'Other';


--
-- Name: COLUMN q2_demo_rc_history.infertreas_oth; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.infertreas_oth IS 'If "Other", please explain:';


--
-- Name: COLUMN q2_demo_rc_history.actout_dreams; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.actout_dreams IS 'Has your spouse \[or sleep partner\] told you that you appear to \''act out your dreams\'' while sleeping \[punched or flailed arms in the air, shouted, screamed\], which has occurred at least three times?';


--
-- Name: COLUMN q2_demo_rc_history.smell_problem; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.smell_problem IS 'Have you had any problems with your sense of smell, such as not being able to smell things or things not smelling the way they are supposed to for at least three months?';


--
-- Name: COLUMN q2_demo_rc_history.taste_problem; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.taste_problem IS 'Have you had any problems with your sense of taste, such as not being able to taste salt or sugar or with tastes in the mouth that shouldn\''t be there, like bitter, salty, sour, or sweet tastes for at least three months?';


--
-- Name: COLUMN q2_demo_rc_history.bowel_move; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.bowel_move IS 'How frequently do you have a bowel movement?';


--
-- Name: COLUMN q2_demo_rc_history.laxative_use; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.laxative_use IS 'How often do you use a laxative? (Such as softeners, bulking agents, fiber supplements, or suppositories)';


--
-- Name: COLUMN q2_demo_rc_history.workplace_harass; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.workplace_harass IS 'Was there a period of time when you frequently experienced any of the following from teammates, coaches or trainers: social isolation, threats or other actions aimed at harassing you?';


--
-- Name: COLUMN q2_demo_rc_history.coach_discrim; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.coach_discrim IS 'How many times were you treated unfairly by COACHES OR TRAINERS because of your race or ethnicity?';


--
-- Name: COLUMN q2_demo_rc_history.coach_discrimstr; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.coach_discrimstr IS 'How stressful was this for you?';


--
-- Name: COLUMN q2_demo_rc_history.player_discrim; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.player_discrim IS 'How many times were you treated unfairly by OTHER PLAYERS because of your race or ethnicity?';


--
-- Name: COLUMN q2_demo_rc_history.player_discrimstr; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.player_discrimstr IS 'How stressful was this for you?';


--
-- Name: COLUMN q2_demo_rc_history.job_discrim; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.job_discrim IS 'How many times were you treated unfairly in being hired for a job or promoted because of your race or ethnicity?';


--
-- Name: COLUMN q2_demo_rc_history.job_discrimstr; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.job_discrimstr IS 'How stressful was this for you?';


--
-- Name: COLUMN q2_demo_rc_history.ace1; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.ace1 IS 'Did a parent or other adult in the household often or very often...  
  
*Swear at you, insult you, put you down, or humiliate you?* or *Act in a way that made you afraid that you might be physically hurt*?';


--
-- Name: COLUMN q2_demo_rc_history.ace2; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.ace2 IS 'Did a parent or other adult in the household often or very often...  
  
*Push, grab, slap, or throw something at you?* or  Ever hit you so hard that you had marks or were injured?';


--
-- Name: COLUMN q2_demo_rc_history.ace3; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.ace3 IS 'Did an adult or person at least 5 years older than you ever...  
  
*Touch or fondle you or have you touch their body in a sexual way?* or Attempt or actually have oral, anal, or vaginal intercourse with you?';


--
-- Name: COLUMN q2_demo_rc_history.ace4; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.ace4 IS 'Did you often or very often feel that...  
  
*No one in your family loved you or thought you were important or special?* or *Your family didn\''t look out for each other, feel close to each other, or support each other?*';


--
-- Name: COLUMN q2_demo_rc_history.ace5; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.ace5 IS 'Did you often or very often feel that...  
  
*You didn\''t have enough to eat, had to wear dirty clothes, and had no one to protect you?* or Your parents were too drunk or high to take care of you or take you to the doctor if you needed it?';


--
-- Name: COLUMN q2_demo_rc_history.ace6; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.ace6 IS 'Were your parents ever separated or divorced?';


--
-- Name: COLUMN q2_demo_rc_history.ace7; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.ace7 IS 'Was your mother or stepmother:  
  
*Often or very often pushed, grabbed, slapped, or had something thrown at her?* or *Sometimes, often, or very often kicked, bitten, hit with a fist, or hit with something hard?* or *Ever repeatedly hit over at least a few minutes or threatened with a gun or knife?*';


--
-- Name: COLUMN q2_demo_rc_history.ace8; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.ace8 IS 'Did you live with anyone who was a problem drinker or alcoholic, or who used street drugs?';


--
-- Name: COLUMN q2_demo_rc_history.ace9; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.ace9 IS 'Was a household member depressed or mentally ill, or did a household member attempt suicide?';


--
-- Name: COLUMN q2_demo_rc_history.ace10; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.ace10 IS 'Did a household member go to prison?';


--
-- Name: COLUMN q2_demo_rc_history.foodins_worry; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.foodins_worry IS 'I worried whether our food would run out before we got money to buy more';


--
-- Name: COLUMN q2_demo_rc_history.foodins_ranout; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.foodins_ranout IS 'The food my family bought just didn\''t last and we didn\''t have money to get more';


--
-- Name: COLUMN q2_demo_rc_history.q2help; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.q2help IS 'Did someone help you fill out the questionnaire?';


--
-- Name: COLUMN q2_demo_rc_history.othealth___complete; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.othealth___complete IS 'Check this box and press "Submit" to complete the questionnaire!';


--
-- Name: COLUMN q2_demo_rc_history.sdfsdaf___0; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.sdfsdaf___0 IS 'Very Poor';


--
-- Name: COLUMN q2_demo_rc_history.sdfsdaf___1; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.sdfsdaf___1 IS 'Average';


--
-- Name: COLUMN q2_demo_rc_history.sdfsdaf___2; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.sdfsdaf___2 IS 'Excellent';


--
-- Name: COLUMN q2_demo_rc_history.rtyrtyrt___0; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.rtyrtyrt___0 IS 'Very Poor';


--
-- Name: COLUMN q2_demo_rc_history.rtyrtyrt___1; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.rtyrtyrt___1 IS 'Average';


--
-- Name: COLUMN q2_demo_rc_history.rtyrtyrt___2; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.rtyrtyrt___2 IS 'Excellent';


--
-- Name: COLUMN q2_demo_rc_history.test_field; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.test_field IS 'Hello';


--
-- Name: COLUMN q2_demo_rc_history.test_phone; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.test_phone IS 'test phone';


--
-- Name: COLUMN q2_demo_rc_history.i57; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.i57 IS 'Integer (0-57)';


--
-- Name: COLUMN q2_demo_rc_history.f57; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.f57 IS 'Float (0-57)';


--
-- Name: COLUMN q2_demo_rc_history.dd; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.dd IS 'dd';


--
-- Name: COLUMN q2_demo_rc_history.yes_or_no; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.yes_or_no IS 'Yes or now';


--
-- Name: COLUMN q2_demo_rc_history.true_or_false; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.true_or_false IS 'True or false';


--
-- Name: COLUMN q2_demo_rc_history.file1; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.file1 IS 'File upload';


--
-- Name: COLUMN q2_demo_rc_history.signature; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.signature IS 'Signature';


--
-- Name: COLUMN q2_demo_rc_history.slider; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.slider IS 'Slider';


--
-- Name: COLUMN q2_demo_rc_history.base_field; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.base_field IS 'Base Field';


--
-- Name: COLUMN q2_demo_rc_history.smoketime_chosen_array; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.smoketime_chosen_array IS 'Please indicate the time-frames during which you smoked cigarettes? (Please select all that apply)';


--
-- Name: COLUMN q2_demo_rc_history.othleaguenm_chosen_array; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.othleaguenm_chosen_array IS 'Indicate the professional, non-NFL, league(s) for which you have played. Please mark all that apply:';


--
-- Name: COLUMN q2_demo_rc_history.leftfb_chosen_array; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.leftfb_chosen_array IS 'Please indicate the main reason(s) why you stopped playing professional football? Select all that apply.';


--
-- Name: COLUMN q2_demo_rc_history.bpi2_chosen_array; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.bpi2_chosen_array IS 'Please indicate the areas where you feel pain. (Select all that apply)';


--
-- Name: COLUMN q2_demo_rc_history.bpi7_chosen_array; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.bpi7_chosen_array IS 'What treatments or medications are you receiving for your pain? (Please select all that apply)';


--
-- Name: COLUMN q2_demo_rc_history.wealth_emerg_chosen_array; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.wealth_emerg_chosen_array IS 'Based on your current financial situation, how would you pay for this
expense? If you would use more than one method to cover this expense,
please select all that apply.';


--
-- Name: COLUMN q2_demo_rc_history.famhxmoth_chosen_array; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.famhxmoth_chosen_array IS 'Mother';


--
-- Name: COLUMN q2_demo_rc_history.famhxfsib_chosen_array; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.famhxfsib_chosen_array IS 'Female Sibling';


--
-- Name: COLUMN q2_demo_rc_history.famhxfath_chosen_array; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.famhxfath_chosen_array IS 'Father';


--
-- Name: COLUMN q2_demo_rc_history.famhxmsib_chosen_array; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.famhxmsib_chosen_array IS 'Male Sibling';


--
-- Name: COLUMN q2_demo_rc_history.sib4sport_chosen_array; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.sib4sport_chosen_array IS 'Select all that apply:';


--
-- Name: COLUMN q2_demo_rc_history.sib5sport_chosen_array; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.sib5sport_chosen_array IS 'Select all that apply:';


--
-- Name: COLUMN q2_demo_rc_history.pedcaff_chosen_array; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pedcaff_chosen_array IS 'Caffeine (Commonly found in soda, coffee, and tea. Also found in supplements like No Doz, Stay Awake, Vivarin, Cafcit, Enerjets, etc.)';


--
-- Name: COLUMN q2_demo_rc_history.pededrink_chosen_array; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pededrink_chosen_array IS 'Energy drinks (**aka:** Red Bull, Monster, 5-Hour Energy, AMP Energy, Full Throttle, Jolt, Liquid X, mountain dew MDX, Red Rooster, Rockstar, RELOAD, SoBe Adrenaline Rush, Vault, XS energy drink, etc.)';


--
-- Name: COLUMN q2_demo_rc_history.pedcreat_chosen_array; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pedcreat_chosen_array IS 'Creatine (**aka:** creatine phosphate, creatine monohydrate, CreaPure, legal steroid, muscle candy, etc.)';


--
-- Name: COLUMN q2_demo_rc_history.pedsteroid_chosen_array; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pedsteroid_chosen_array IS 'Steroids (**aka:** anabolic steroids, testosterone, androstenedione, dihydroepiandrosterone, DHEA, Arnolds, gym candy, pumpers, roids, stackers, weight trainers, gear, and juice)';


--
-- Name: COLUMN q2_demo_rc_history.pedgh_chosen_array; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pedgh_chosen_array IS 'Growth hormone or insulin-like growth factor (**aka:** human growth hormone, insulin-like growth factor-1, insulin-like growth factor, IGF, IGF-1, Genotropin, Humatrope, Norditropin, Nutropin, Saizen, Serostim)';


--
-- Name: COLUMN q2_demo_rc_history.pedephed_chosen_array; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pedephed_chosen_array IS 'Ephedra (**aka:** ephedrine, Ma Huang, desert tea, Mormon tea, American ephedra, European ephedra, Pakistani ephedra, ephedrine, ephedrine alkaloids, pseudoephedrine)';


--
-- Name: COLUMN q2_demo_rc_history.pedbetahy_chosen_array; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pedbetahy_chosen_array IS 'Beta-hydroxy beta-methylbutyrate (**aka:** HMB, beta-hydroxy, beta-methylbutyrate, beta-hydroxy, beta-methylbutyric acid)';


--
-- Name: COLUMN q2_demo_rc_history.pednoncaf_chosen_array; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pednoncaf_chosen_array IS 'Non-caffeine stimulants (**aka:** amphetamine, dextroamphetamine (Adderall), methylphenidate (Ritalin))';


--
-- Name: COLUMN q2_demo_rc_history.pedrcell_chosen_array; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pedrcell_chosen_array IS 'Red-cell boosting agents or techniques (**aka:** Erythropoeitin (EPO), auto-transfusion, hypoxic sleep tents)';


--
-- Name: COLUMN q2_demo_rc_history.pedinos_chosen_array; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.pedinos_chosen_array IS 'Other cardiovascular enhancement agent (**aka:** inosine or inosine-containing products)';


--
-- Name: COLUMN q2_demo_rc_history.marijtime_chosen_array; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.marijtime_chosen_array IS 'Please indicate the time-frames during which you smoked marijuana (select all that apply):';


--
-- Name: COLUMN q2_demo_rc_history.marijreas_chosen_array; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.marijreas_chosen_array IS 'Please indicate the reasons why you use, or have previously used, marijuana (select all that apply):';


--
-- Name: COLUMN q2_demo_rc_history.infertreas_chosen_array; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.infertreas_chosen_array IS 'Did he or she find a reason why you and your female spouse or partner
had difficulty getting pregnant? Please choose all that apply:';


--
-- Name: COLUMN q2_demo_rc_history.sdfsdaf_chosen_array; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.sdfsdaf_chosen_array IS 'sdfsdaf';


--
-- Name: COLUMN q2_demo_rc_history.rtyrtyrt_chosen_array; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rc_history.rtyrtyrt_chosen_array IS 'rtyrtyrt';


--
-- Name: q2_demo_rc_history_id_seq; Type: SEQUENCE; Schema: redcap; Owner: -
--

CREATE SEQUENCE redcap.q2_demo_rc_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: q2_demo_rc_history_id_seq; Type: SEQUENCE OWNED BY; Schema: redcap; Owner: -
--

ALTER SEQUENCE redcap.q2_demo_rc_history_id_seq OWNED BY redcap.q2_demo_rc_history.id;


--
-- Name: q2_demo_rcs; Type: TABLE; Schema: redcap; Owner: -
--

CREATE TABLE redcap.q2_demo_rcs (
    id bigint NOT NULL,
    record_id character varying,
    dob date,
    current_weight numeric,
    domestic_status character varying,
    living_situation character varying,
    current_employment character varying,
    student_looking character varying,
    current_fbjob character varying,
    current_fbjob_oth character varying,
    job_industry character varying,
    job_title character varying,
    job_title_entry character varying,
    smoke character varying,
    smoketime___pnfl boolean,
    smoketime___dnfl boolean,
    smoketime___anfl boolean,
    smoke_start numeric,
    smoke_stop numeric,
    smoke_curr character varying,
    smoke_totyrs numeric,
    smoke_prenfl character varying,
    smoke_nfl character varying,
    smoke_postnfl character varying,
    edu_player character varying,
    edu_mother character varying,
    edu_father character varying,
    occ_mother character varying,
    occ_mother_exp character varying,
    occ_father character varying,
    occ_father_exp character varying,
    yrsplayed_prehs numeric,
    playhsfb___no boolean,
    hsposition1 character varying,
    hsposition2 character varying,
    yrsplayed_hs character varying,
    collposition1 character varying,
    collposition2 character varying,
    yrsplayed_coll character varying,
    college_div character varying,
    collpreprac character varying,
    collpreprac_pads character varying,
    collregprac character varying,
    collregprac_pads character varying,
    collsnap_ol character varying,
    collsnap_wr character varying,
    collsnap_dl character varying,
    collsnap_te character varying,
    collsnap_lb character varying,
    collsnap_qb character varying,
    collsnap_db character varying,
    collsnap_kick character varying,
    collsnap_rb character varying,
    collsnap_special character varying,
    nflpreprac character varying,
    nflpreprac_pads character varying,
    nflregprac character varying,
    nflregprac_pads character varying,
    prosnap_ol character varying,
    prosnap_wr character varying,
    prosnap_dl character varying,
    prosnap_te character varying,
    prosnap_lb character varying,
    prosnap_qb character varying,
    prosnap_db character varying,
    prosnap_kick character varying,
    prosnap_rb character varying,
    prosnap_special character varying,
    gmsplyd_career numeric,
    gmsplyd_season character varying,
    prsqd boolean,
    prsqd_seasons numeric,
    othleague boolean,
    othleague_seasons character varying,
    othleaguenm___afl boolean,
    othleaguenm___cfl boolean,
    othleaguenm___efl boolean,
    othleaguenm___ufl boolean,
    othleaguenm___wfl boolean,
    othleaguenm___xfl boolean,
    othleaguenm___oth boolean,
    othleague_exp character varying,
    nonnfl_seasons numeric,
    prsqd_nonnfl boolean,
    prsqd_nonnfl_seasons numeric,
    firstpro_age numeric,
    finalpro_age numeric,
    leftfb___age boolean,
    leftfb___cut boolean,
    leftfb___fbinj boolean,
    leftfb___inj boolean,
    leftfb___retire boolean,
    postfb_hlthprac character varying,
    postfb_degree character varying,
    postfb_charity character varying,
    postfb_fbjob character varying,
    postfb_job character varying,
    postfbjob_occ character varying,
    postfbjob_occexp character varying,
    postfbex_walk character varying,
    postfbex_jog character varying,
    postfbex_run character varying,
    postfbex_other character varying,
    postfbex_lowint character varying,
    postfbex_wttrain character varying,
    postfbex_endsprt character varying,
    postfbex_reclg character varying,
    pastyrex_walk character varying,
    pastyrex_jog character varying,
    pastyrex_run character varying,
    pastyrex_oth character varying,
    pastyrex_lowint character varying,
    pastyrex_wttrain character varying,
    pastyrex_endsprt character varying,
    pastyrex_reclg character varying,
    ex150min boolean,
    ex150min_exp character varying,
    ex150min_oth character varying,
    demog___complete boolean,
    demog_date timestamp without time zone,
    postfb_wt2yr character varying,
    postfb_wt2yrdelta character varying,
    postfb_wt5yr character varying,
    postfb_wt5yrdelta character varying,
    cardiac_rehab boolean,
    cvtest_ecg character varying,
    cvtest_ecg_exp character varying,
    cvtest_echo character varying,
    cvtest_echo_exp character varying,
    cvtest_cpxt character varying,
    cvtest_cpxt_exp character varying,
    cvtest_cvmri character varying,
    cvtest_cvmri_exp character varying,
    cvtest_corct character varying,
    cvtest_corct_exp character varying,
    cvtest_cvcath character varying,
    cvtest_cvcath_exp character varying,
    cvdx_mi character varying,
    cvdx_stroke character varying,
    cvdx_tia character varying,
    cvmedrec_highbp character varying,
    cvmedrec_hrtfail character varying,
    cvmedrec_afib character varying,
    cvmedrec_otharrhyth character varying,
    cvmedrec_highchol character varying,
    cvmedrec_diabetes character varying,
    cvsurg_bypass character varying,
    cvsurg_ablation character varying,
    cvsurg_carotidart character varying,
    cvmed_chol character varying,
    cvmed_othchol character varying,
    cvmed_novchol character varying,
    cvmed_bldthin character varying,
    cvmed_anticoag character varying,
    cvmed_arrhyth character varying,
    cvmed_digoxin character varying,
    cvmed_furosemide character varying,
    cvmed_thiazide character varying,
    cvmed_calciumblk character varying,
    cvmed_antihyp character varying,
    dbmed_metformin character varying,
    dbmed_glimeperide character varying,
    dbmed_insulin character varying,
    dbmed_other character varying,
    cardiac___complete boolean,
    cardiac_date timestamp without time zone,
    ad8_1 character varying,
    ad8_2 character varying,
    ad8_3 character varying,
    ad8_4 character varying,
    ad8_5 character varying,
    ad8_6 character varying,
    ad8_7 character varying,
    ad8_8 character varying,
    nqcog64q2 character varying,
    nqcog65q2 character varying,
    nqcog66q2 character varying,
    nqcog68q2 character varying,
    nqcog72q2 character varying,
    nqcog75q2 character varying,
    nqcog77q2 character varying,
    nqcog80q2 character varying,
    nqper02 character varying,
    nqper05 character varying,
    nqper06 character varying,
    nqper07 character varying,
    nqper11 character varying,
    nqper12 character varying,
    nqper17 character varying,
    nqper19 character varying,
    phq1 character varying,
    phq2 character varying,
    phq3 character varying,
    phq4 character varying,
    phq5 character varying,
    phq6 character varying,
    phq7 character varying,
    phq8 character varying,
    phq9 character varying,
    gad7_1 character varying,
    gad7_2 character varying,
    gad7_3 character varying,
    gad7_4 character varying,
    gad7_5 character varying,
    gad7_6 character varying,
    gad7_7 character varying,
    lotr1 character varying,
    lotr3 character varying,
    lotr4 character varying,
    lotr7 character varying,
    lotr9 character varying,
    lotr10 character varying,
    stpbng_snore character varying,
    stpbng_tired character varying,
    stpbng_obser character varying,
    stpbng_bp character varying,
    stpbng_neck character varying,
    cpapuse boolean,
    cpapuse_days character varying,
    ncmedrec_hdache character varying,
    ncmedrec_anx character varying,
    ncmedrec_dep character varying,
    ncmedrec_memloss character varying,
    ncmedrec_add character varying,
    ncdx_alz character varying,
    ncdx_cte character varying,
    ncdx_vascdem character varying,
    ncdx_othdem character varying,
    ncdx_als character varying,
    ncdx_parkins character varying,
    ncdx_ms character varying,
    ncmed_ssri character varying,
    ncmed_tricydep character varying,
    ncmed_othdep character varying,
    ncmed_slpaid character varying,
    neurocog___complete boolean,
    neurocog_date timestamp without time zone,
    bpi1 boolean,
    bpi2___head boolean,
    bpi2___neck boolean,
    bpi2___shoul boolean,
    bpi2___chest boolean,
    bpi2___arm boolean,
    bpi2___hand boolean,
    bpi2___uback boolean,
    bpi2___lbak boolean,
    bpi2___hip boolean,
    bpi2___leg boolean,
    bpi2___knee boolean,
    bpi2___ankle boolean,
    bpi2___foot boolean,
    bpi2___oth boolean,
    bpi2_othexp character varying,
    bpi2most character varying,
    bpi2most_othexp character varying,
    bpi3 character varying,
    bpi4 character varying,
    bpi5 character varying,
    bpi6 character varying,
    bpi7___none boolean,
    bpi7___otc boolean,
    bpi7___prmed boolean,
    bpi7___mass boolean,
    bpi7___pt boolean,
    bpi7___acup boolean,
    bpi7___marij boolean,
    bpi7___intpm boolean,
    bpi7___oth boolean,
    bpi7_othexp character varying,
    bpi8 character varying,
    bpi9a character varying,
    bpi9b character varying,
    bpi9c character varying,
    bpi9d character varying,
    bpi9e character varying,
    bpi9f character varying,
    bpi9g character varying,
    bpi9h character varying,
    pnmedfb_acetamin character varying,
    pnmedfb_aspirin character varying,
    pnmedfb_ibuprof character varying,
    pnmedfb_othantiinf character varying,
    pnmedfb_oralster character varying,
    pnmedfb_opioid character varying,
    pnmed5yr_acetamin character varying,
    pnmed5yr_aspirin character varying,
    pnmed5yr_ibuprof character varying,
    pnmed5yr_antiinf character varying,
    pnmed5yr_oralster character varying,
    pnmed5yr_opioid character varying,
    pnmed_acetamin boolean,
    pnmed_acetamin_days character varying,
    pnmed_acetamin_tabs character varying,
    pnmed_acetamin_dose character varying,
    pnmed_aspirin boolean,
    pnmed_aspirin_days character varying,
    pnmed_aspirin_tabs character varying,
    pnmed_aspirin_dose character varying,
    pnmed_ibuprof boolean,
    pnmed_ibuprof_days character varying,
    pnmed_ibuprof_tabs character varying,
    pnmed_ibuprof_dose character varying,
    pnmed_antiinf boolean,
    pnmed_antiinf_days character varying,
    pnmed_antiinf_tabs character varying,
    pnmed_antiinf_dose character varying,
    pnmed_oralster boolean,
    pnmed_oralster_days character varying,
    pnmed_oralster_tabs character varying,
    pnmed_oralster_dose character varying,
    pnmed_opioid boolean,
    pnmed_opioid_days character varying,
    pnmed_opioid_tab character varying,
    pnmed_opioid_dose character varying,
    pnsurg_nckspin character varying,
    pnsurg_back character varying,
    pnsurg_hip character varying,
    pnsurg_knee character varying,
    pain___complete boolean,
    pain_date timestamp without time zone,
    wealth character varying,
    wealth_emerg___1 boolean,
    wealth_emerg___2 boolean,
    wealth_emerg___3 boolean,
    wealth_emerg___4 boolean,
    wealth_emerg___5 boolean,
    wealth_emerg___6 boolean,
    wealth_emerg___7 boolean,
    wealth_emerg___8 boolean,
    wealth_emerg___9 boolean,
    wealth_emerg_oth character varying,
    ladder_wealth character varying,
    ladder_comm character varying,
    household_number character varying,
    hcutil_pcp boolean,
    hcutil_pcp_exp character varying,
    hcutil_pcp_oth character varying,
    hcutil_othprov boolean,
    selfrpt_cte boolean,
    otdx_arthritis character varying,
    otdx_slpapnea character varying,
    otdx_prostcanc character varying,
    otdx_basalcanc character varying,
    otdx_squamcanc character varying,
    otdx_melanom character varying,
    otdx_lymphom character varying,
    otdx_othcanc character varying,
    otdx_renalfail character varying,
    otdx_alcdep character varying,
    otdx_livcirrhosis character varying,
    otdx_livfail character varying,
    otmedrec_pncond character varying,
    otmedrec_livprob character varying,
    otmedrec_lowtest character varying,
    otmedrec_ed character varying,
    massage boolean,
    acupuncture boolean,
    chiropractic boolean,
    yoga boolean,
    taichi boolean,
    meditation boolean,
    othaltmed boolean,
    othaltmed_exp character varying,
    famhxmoth___na boolean,
    famhxmoth___lung boolean,
    famhxmoth___colrec boolean,
    famhxmoth___diab boolean,
    famhxmoth___mela boolean,
    famhxmoth___hypert boolean,
    famhxmoth___dem boolean,
    famhxmoth___alc boolean,
    famhxfsib___na boolean,
    famhxfsib___lung boolean,
    famhxfsib___colrec boolean,
    famhxfsib___diab boolean,
    famhxfsib___mela boolean,
    famhxfsib___hypert boolean,
    famhxfsib___dem boolean,
    famhxfsib___alc boolean,
    femsib_number character varying,
    famhxfath___na boolean,
    famhxfath___lung boolean,
    famhxfath___colrec boolean,
    famhxfath___prost boolean,
    famhxfath___diab boolean,
    famhxfath___mela boolean,
    famhxfath___hypert boolean,
    famhxfath___dem boolean,
    famhxfath___alc boolean,
    famhxmsib___na boolean,
    famhxmsib___lung boolean,
    famhxmsib___colrec boolean,
    famhxmsib___prost boolean,
    famhxmsib___diab boolean,
    famhxmsib___mela boolean,
    famhxmsib___hypert boolean,
    famhxmsib___dem boolean,
    famhxmsib___alc boolean,
    sib_number character varying,
    sib1age numeric,
    sib1ht_feet numeric,
    sib1ht_inch numeric,
    sib1sport___none boolean,
    sib1sport___hsfb boolean,
    sib1sport___colfb boolean,
    sib1sport___oth boolean,
    sib1sport_oth character varying,
    sib2age numeric,
    sib2ht_feet numeric,
    sib2ht_inch numeric,
    sib2sport___none boolean,
    sib2sport___hsfb boolean,
    sib2sport___colfb boolean,
    sib2sport___oth boolean,
    sib2sport_oth character varying,
    sib3age numeric,
    sib3ht_feet numeric,
    sib3ht_inch numeric,
    sib3sport___none boolean,
    sib3sport___hsfb boolean,
    sib3sport___colfb boolean,
    sib3sport___oth boolean,
    sib3sport_oth character varying,
    sib4age numeric,
    sib4ht_feet numeric,
    sib4ht_inch numeric,
    sib4sport___none boolean,
    sib4sport___hsfb boolean,
    sib4sport___colfb boolean,
    sib4sport___oth boolean,
    sib4sportoth character varying,
    sib5age numeric,
    sib5ht_feet numeric,
    sib5ht_inch numeric,
    sib5sport___none boolean,
    sib5sport___hsfb boolean,
    sib5sport___colfb boolean,
    sib5sport___oth boolean,
    sib5sport_oth character varying,
    pedcaff___noans boolean,
    pedcaff___no boolean,
    pedcaff___fb boolean,
    pedcaff___cur boolean,
    pededrink___noans boolean,
    pededrink___no boolean,
    pededrink___fb boolean,
    pededrink___cur boolean,
    pedcreat___noans boolean,
    pedcreat___no boolean,
    pedcreat___fb boolean,
    pedcreat___cur boolean,
    pedsteroid___noans boolean,
    pedsteroid___no boolean,
    pedsteroid___fb boolean,
    pedsteroid___cur boolean,
    pedgh___noans boolean,
    pedgh___no boolean,
    pedgh___fb boolean,
    pedgh___cur boolean,
    pedephed___noans boolean,
    pedephed___no boolean,
    pedephed___fb boolean,
    pedephed___cur boolean,
    pedbetahy___noans boolean,
    pedbetahy___no boolean,
    pedbetahy___fb boolean,
    pedbetahy___cur boolean,
    pednoncaf___noans boolean,
    pednoncaf___no boolean,
    pednoncaf___fb boolean,
    pednoncaf___cur boolean,
    pedrcell___noans boolean,
    pedrcell___no boolean,
    pedrcell___fb boolean,
    pedrcell___cur boolean,
    pedinos___noans boolean,
    pedinos___no boolean,
    pedinos___fb boolean,
    pedinos___cur boolean,
    alcohol_days character varying,
    alcohol_drinks character varying,
    marijuana character varying,
    marijuana_start numeric,
    marijuana_stop numeric,
    marijuana_totyrs numeric,
    marijtime___pnfl boolean,
    marijtime___dnfl boolean,
    marijtime___anfl boolean,
    marijreas___fun boolean,
    marijreas___relx boolean,
    marijreas___pain boolean,
    marijreas___anx boolean,
    marijreas___dep boolean,
    marijreas___oth boolean,
    marijreas_exp character varying,
    born_address character varying,
    born_city character varying,
    born_state character varying,
    born_zip character varying,
    twelveyrs_address character varying,
    twelveyrs_city character varying,
    twelveyrs_state character varying,
    twelveyrs_zip character varying,
    infertility boolean,
    infert_age numeric,
    infert_hcp boolean,
    infertreas___fem boolean,
    infertreas___mal boolean,
    infertreas___unex boolean,
    infertreas___oth boolean,
    infertreas_oth character varying,
    actout_dreams character varying,
    smell_problem character varying,
    taste_problem character varying,
    bowel_move character varying,
    laxative_use character varying,
    workplace_harass character varying,
    coach_discrim character varying,
    coach_discrimstr character varying,
    player_discrim character varying,
    player_discrimstr character varying,
    job_discrim character varying,
    job_discrimstr character varying,
    ace1 boolean,
    ace2 boolean,
    ace3 boolean,
    ace4 boolean,
    ace5 boolean,
    ace6 boolean,
    ace7 boolean,
    ace8 boolean,
    ace9 boolean,
    ace10 boolean,
    foodins_worry character varying,
    foodins_ranout character varying,
    q2help character varying,
    othealth___complete boolean,
    othealth_date timestamp without time zone,
    q2_survey_complete integer,
    q2_survey_timestamp timestamp without time zone,
    sdfsdaf___0 boolean,
    sdfsdaf___1 boolean,
    sdfsdaf___2 boolean,
    rtyrtyrt___0 boolean,
    rtyrtyrt___1 boolean,
    rtyrtyrt___2 boolean,
    test_field character varying,
    test_phone character varying,
    i57 integer,
    f57 numeric,
    dd timestamp without time zone,
    yes_or_no boolean,
    true_or_false boolean,
    file1 character varying,
    signature character varying,
    slider integer,
    test_complete integer,
    test_timestamp timestamp without time zone,
    base_field character varying,
    non_survey_complete integer,
    non_survey_timestamp timestamp without time zone,
    redcap_survey_identifier character varying,
    user_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    smoketime_chosen_array character varying[],
    othleaguenm_chosen_array character varying[],
    leftfb_chosen_array character varying[],
    bpi2_chosen_array character varying[],
    bpi7_chosen_array character varying[],
    wealth_emerg_chosen_array character varying[],
    famhxmoth_chosen_array character varying[],
    famhxfsib_chosen_array character varying[],
    famhxfath_chosen_array character varying[],
    famhxmsib_chosen_array character varying[],
    sib1sport_chosen_array character varying[],
    sib2sport_chosen_array character varying[],
    sib3sport_chosen_array character varying[],
    sib4sport_chosen_array character varying[],
    sib5sport_chosen_array character varying[],
    pedcaff_chosen_array character varying[],
    pededrink_chosen_array character varying[],
    pedcreat_chosen_array character varying[],
    pedsteroid_chosen_array character varying[],
    pedgh_chosen_array character varying[],
    pedephed_chosen_array character varying[],
    pedbetahy_chosen_array character varying[],
    pednoncaf_chosen_array character varying[],
    pedrcell_chosen_array character varying[],
    pedinos_chosen_array character varying[],
    marijtime_chosen_array character varying[],
    marijreas_chosen_array character varying[],
    infertreas_chosen_array character varying[],
    sdfsdaf_chosen_array character varying[],
    rtyrtyrt_chosen_array character varying[]
);


--
-- Name: TABLE q2_demo_rcs; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON TABLE redcap.q2_demo_rcs IS 'Dynamicmodel: Q2 Demo Rc';


--
-- Name: COLUMN q2_demo_rcs.record_id; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.record_id IS 'Record ID';


--
-- Name: COLUMN q2_demo_rcs.dob; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.dob IS 'Date of birth:';


--
-- Name: COLUMN q2_demo_rcs.current_weight; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.current_weight IS 'What is your current weight?';


--
-- Name: COLUMN q2_demo_rcs.domestic_status; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.domestic_status IS 'What is your current marital status?';


--
-- Name: COLUMN q2_demo_rcs.living_situation; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.living_situation IS 'How would you describe your current living situation?';


--
-- Name: COLUMN q2_demo_rcs.current_employment; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.current_employment IS 'Are you currently employed?';


--
-- Name: COLUMN q2_demo_rcs.student_looking; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.student_looking IS 'If you are unemployed, are you currently a student or looking for work?';


--
-- Name: COLUMN q2_demo_rcs.current_fbjob; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.current_fbjob IS 'If you work in football, please provide additional information:';


--
-- Name: COLUMN q2_demo_rcs.current_fbjob_oth; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.current_fbjob_oth IS 'If "Other", please specify:';


--
-- Name: COLUMN q2_demo_rcs.job_industry; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.job_industry IS 'Specify your employment industry. (If you are retired, specify the last industry in
which you were employed.)';


--
-- Name: COLUMN q2_demo_rcs.job_title; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.job_title IS 'Select the option that best represents your job title. (If you are retired,
indicate the title of your last job)';


--
-- Name: COLUMN q2_demo_rcs.job_title_entry; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.job_title_entry IS 'Enter your job title: (If you are retired, enter the title of your last
job)';


--
-- Name: COLUMN q2_demo_rcs.smoke; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.smoke IS 'Have you ever smoked cigarettes?  (Smoked at least 100 cigarettes in your lifetime. Do not include pipe and cigars)';


--
-- Name: COLUMN q2_demo_rcs.smoketime___pnfl; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.smoketime___pnfl IS 'Before playing in the NFL';


--
-- Name: COLUMN q2_demo_rcs.smoketime___dnfl; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.smoketime___dnfl IS 'While playing in the NFL';


--
-- Name: COLUMN q2_demo_rcs.smoketime___anfl; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.smoketime___anfl IS 'After playing in the NFL';


--
-- Name: COLUMN q2_demo_rcs.smoke_start; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.smoke_start IS 'How old were you when you started smoking?';


--
-- Name: COLUMN q2_demo_rcs.smoke_stop; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.smoke_stop IS 'How old were you when you stopped smoking?';


--
-- Name: COLUMN q2_demo_rcs.smoke_curr; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.smoke_curr IS 'On average, how many cigarettes do you currently smoke per day?';


--
-- Name: COLUMN q2_demo_rcs.smoke_totyrs; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.smoke_totyrs IS 'How many years, in total, have you smoked? (if you quit more than once, estimate the total years you considered yourself an active smoker)';


--
-- Name: COLUMN q2_demo_rcs.smoke_prenfl; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.smoke_prenfl IS 'How many cigarettes did you smoke per day, on average, before playing in the NFL?';


--
-- Name: COLUMN q2_demo_rcs.smoke_nfl; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.smoke_nfl IS 'How many cigarettes did you smoke per day, on average, while playing in the NFL?';


--
-- Name: COLUMN q2_demo_rcs.smoke_postnfl; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.smoke_postnfl IS 'How many cigarettes have you smoked per day, on average, since leaving the NFL? (If you have quit smoking, please provide the average number of cigarettes smoked per day while you considered yourself an active smoker)';


--
-- Name: COLUMN q2_demo_rcs.edu_player; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.edu_player IS 'You:';


--
-- Name: COLUMN q2_demo_rcs.edu_mother; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.edu_mother IS 'Mother:';


--
-- Name: COLUMN q2_demo_rcs.edu_father; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.edu_father IS 'Father:';


--
-- Name: COLUMN q2_demo_rcs.occ_mother; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.occ_mother IS 'Mother:';


--
-- Name: COLUMN q2_demo_rcs.occ_mother_exp; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.occ_mother_exp IS 'Please explain:';


--
-- Name: COLUMN q2_demo_rcs.occ_father; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.occ_father IS 'Father:';


--
-- Name: COLUMN q2_demo_rcs.occ_father_exp; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.occ_father_exp IS 'Please explain:';


--
-- Name: COLUMN q2_demo_rcs.yrsplayed_prehs; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.yrsplayed_prehs IS 'How many years did you play football before starting high school?';


--
-- Name: COLUMN q2_demo_rcs.hsposition1; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.hsposition1 IS 'Primary position #1:';


--
-- Name: COLUMN q2_demo_rcs.hsposition2; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.hsposition2 IS 'Primary position #2:';


--
-- Name: COLUMN q2_demo_rcs.yrsplayed_hs; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.yrsplayed_hs IS 'How many years did you play football during high school?';


--
-- Name: COLUMN q2_demo_rcs.collposition1; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.collposition1 IS 'Primary position #1:';


--
-- Name: COLUMN q2_demo_rcs.collposition2; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.collposition2 IS 'Primary position #2:';


--
-- Name: COLUMN q2_demo_rcs.yrsplayed_coll; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.yrsplayed_coll IS 'How many years did you play football during college before going pro?';


--
-- Name: COLUMN q2_demo_rcs.college_div; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.college_div IS 'If you played after the college \"division\" system was created, which division did you play in?';


--
-- Name: COLUMN q2_demo_rcs.collpreprac; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.collpreprac IS 'During your college football career, on average, how often did you practice per week during pre-season?';


--
-- Name: COLUMN q2_demo_rcs.collpreprac_pads; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.collpreprac_pads IS 'During your college football career, on average, how many practices a week did you wear full pads or shoulder pads during pre-season?';


--
-- Name: COLUMN q2_demo_rcs.collregprac; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.collregprac IS 'During your college football career, on average, how often did you practice per week during the regular season?';


--
-- Name: COLUMN q2_demo_rcs.collregprac_pads; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.collregprac_pads IS 'During your college football career, on average, how many practices a week did you wear full pads or shoulder pads during the regular season?';


--
-- Name: COLUMN q2_demo_rcs.collsnap_ol; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.collsnap_ol IS 'Offensive line:';


--
-- Name: COLUMN q2_demo_rcs.collsnap_wr; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.collsnap_wr IS 'Wide receiver:';


--
-- Name: COLUMN q2_demo_rcs.collsnap_dl; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.collsnap_dl IS 'Defensive line:';


--
-- Name: COLUMN q2_demo_rcs.collsnap_te; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.collsnap_te IS 'Tight end:';


--
-- Name: COLUMN q2_demo_rcs.collsnap_lb; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.collsnap_lb IS 'Linebacker:';


--
-- Name: COLUMN q2_demo_rcs.collsnap_qb; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.collsnap_qb IS 'Quarterback:';


--
-- Name: COLUMN q2_demo_rcs.collsnap_db; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.collsnap_db IS 'Defensive back:';


--
-- Name: COLUMN q2_demo_rcs.collsnap_kick; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.collsnap_kick IS 'Kicker/punter:';


--
-- Name: COLUMN q2_demo_rcs.collsnap_rb; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.collsnap_rb IS 'Running back:';


--
-- Name: COLUMN q2_demo_rcs.collsnap_special; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.collsnap_special IS 'Special teams:';


--
-- Name: COLUMN q2_demo_rcs.nflpreprac; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.nflpreprac IS 'Over your NFL career, on average, how often did you practice per week during pre-season?';


--
-- Name: COLUMN q2_demo_rcs.nflpreprac_pads; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.nflpreprac_pads IS 'Over your NFL career, on average, how many practices a week did you wear full pads or shoulder pads during pre-season?';


--
-- Name: COLUMN q2_demo_rcs.nflregprac; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.nflregprac IS 'Over your NFL career, on average, how often did you practice per week during the regular season?';


--
-- Name: COLUMN q2_demo_rcs.nflregprac_pads; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.nflregprac_pads IS 'Over your NFL career, on average, how many practices a week did you wear full pads or shoulder pads during the regular season?';


--
-- Name: COLUMN q2_demo_rcs.prosnap_ol; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.prosnap_ol IS 'Offensive line:';


--
-- Name: COLUMN q2_demo_rcs.prosnap_wr; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.prosnap_wr IS 'Wide receiver:';


--
-- Name: COLUMN q2_demo_rcs.prosnap_dl; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.prosnap_dl IS 'Defensive line:';


--
-- Name: COLUMN q2_demo_rcs.prosnap_te; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.prosnap_te IS 'Tight end:';


--
-- Name: COLUMN q2_demo_rcs.prosnap_lb; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.prosnap_lb IS 'Linebacker:';


--
-- Name: COLUMN q2_demo_rcs.prosnap_qb; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.prosnap_qb IS 'Quarterback:';


--
-- Name: COLUMN q2_demo_rcs.prosnap_db; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.prosnap_db IS 'Defensive back:';


--
-- Name: COLUMN q2_demo_rcs.prosnap_kick; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.prosnap_kick IS 'Kicker/punter:';


--
-- Name: COLUMN q2_demo_rcs.prosnap_rb; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.prosnap_rb IS 'Running back:';


--
-- Name: COLUMN q2_demo_rcs.prosnap_special; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.prosnap_special IS 'Special teams:';


--
-- Name: COLUMN q2_demo_rcs.gmsplyd_career; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.gmsplyd_career IS 'Over your whole professional football career, approximately how many games were you on an active roster?';


--
-- Name: COLUMN q2_demo_rcs.gmsplyd_season; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.gmsplyd_season IS 'Over your whole professional football career, on average, how many games were you on an active roster per season?';


--
-- Name: COLUMN q2_demo_rcs.prsqd; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.prsqd IS 'Did you ever spend time on a practice squad for an NFL team?';


--
-- Name: COLUMN q2_demo_rcs.prsqd_seasons; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.prsqd_seasons IS 'Number of seasons:';


--
-- Name: COLUMN q2_demo_rcs.othleague; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.othleague IS 'Did you play any seasons for a professional team that was not in the NFL? (CFL, EFL, etc.)';


--
-- Name: COLUMN q2_demo_rcs.othleague_seasons; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.othleague_seasons IS 'How many seasons did you play for a professional team not in the NFL? (CFL, EFL, etc.)';


--
-- Name: COLUMN q2_demo_rcs.othleaguenm___afl; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.othleaguenm___afl IS 'Arena Football League (AFL)';


--
-- Name: COLUMN q2_demo_rcs.othleaguenm___cfl; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.othleaguenm___cfl IS 'Canadian Football League (CFL)';


--
-- Name: COLUMN q2_demo_rcs.othleaguenm___efl; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.othleaguenm___efl IS 'European Football League (EFL)';


--
-- Name: COLUMN q2_demo_rcs.othleaguenm___ufl; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.othleaguenm___ufl IS 'United Football League (UFL)';


--
-- Name: COLUMN q2_demo_rcs.othleaguenm___wfl; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.othleaguenm___wfl IS 'World Football League (WFL)';


--
-- Name: COLUMN q2_demo_rcs.othleaguenm___xfl; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.othleaguenm___xfl IS 'XFL';


--
-- Name: COLUMN q2_demo_rcs.othleaguenm___oth; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.othleaguenm___oth IS 'Other';


--
-- Name: COLUMN q2_demo_rcs.othleague_exp; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.othleague_exp IS 'If "Other", please explain:';


--
-- Name: COLUMN q2_demo_rcs.nonnfl_seasons; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.nonnfl_seasons IS 'How many seasons did you collectively play that were not in the NFL?';


--
-- Name: COLUMN q2_demo_rcs.prsqd_nonnfl; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.prsqd_nonnfl IS 'Did you ever spend time on a practice squad for another professional non-NFL Team?';


--
-- Name: COLUMN q2_demo_rcs.prsqd_nonnfl_seasons; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.prsqd_nonnfl_seasons IS 'Non-NFL Practice Squad:';


--
-- Name: COLUMN q2_demo_rcs.firstpro_age; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.firstpro_age IS 'How old were you when you played your first professional football game (NFL, CFL, EFL, etc.)?';


--
-- Name: COLUMN q2_demo_rcs.finalpro_age; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.finalpro_age IS 'How old were you when you played your final professional football game (NFL, CFL, EFL, etc.)?';


--
-- Name: COLUMN q2_demo_rcs.leftfb___age; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.leftfb___age IS 'Age';


--
-- Name: COLUMN q2_demo_rcs.leftfb___cut; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.leftfb___cut IS 'Cut from roster';


--
-- Name: COLUMN q2_demo_rcs.leftfb___fbinj; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.leftfb___fbinj IS 'Injury or health problem related to football';


--
-- Name: COLUMN q2_demo_rcs.leftfb___inj; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.leftfb___inj IS 'Injury or health problem not related to football';


--
-- Name: COLUMN q2_demo_rcs.leftfb___retire; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.leftfb___retire IS 'Personal decision (retired)';


--
-- Name: COLUMN q2_demo_rcs.postfb_hlthprac; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.postfb_hlthprac IS '...First see a healthcare practitioner?';


--
-- Name: COLUMN q2_demo_rcs.postfb_degree; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.postfb_degree IS '...Go back to school to complete a degree or obtain an advanced degree?';


--
-- Name: COLUMN q2_demo_rcs.postfb_charity; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.postfb_charity IS '...Begin participating in volunteer or charity work?';


--
-- Name: COLUMN q2_demo_rcs.postfb_fbjob; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.postfb_fbjob IS '...Become employed in a football related activity?(e.g. coach, scout, administration, media, television, reporting etc.)';


--
-- Name: COLUMN q2_demo_rcs.postfb_job; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.postfb_job IS '...Become employed in a non-football related activity?';


--
-- Name: COLUMN q2_demo_rcs.postfbjob_occ; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.postfbjob_occ IS 'What was your first job after leaving football? (Please provide the job title)';


--
-- Name: COLUMN q2_demo_rcs.postfbjob_occexp; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.postfbjob_occexp IS 'Please explain:';


--
-- Name: COLUMN q2_demo_rcs.postfbex_walk; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.postfbex_walk IS 'Walking for exercise or walking to work';


--
-- Name: COLUMN q2_demo_rcs.postfbex_jog; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.postfbex_jog IS 'Jogging (slower than 10min/mile)';


--
-- Name: COLUMN q2_demo_rcs.postfbex_run; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.postfbex_run IS 'Running (10min/mile or faster)';


--
-- Name: COLUMN q2_demo_rcs.postfbex_other; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.postfbex_other IS 'Other aerobic exercise (e.g. bicycling, stationary bike, elliptical machine, stairmaster)';


--
-- Name: COLUMN q2_demo_rcs.postfbex_lowint; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.postfbex_lowint IS 'Low intensity exercise (e.g. yoga, pilates, stretching)';


--
-- Name: COLUMN q2_demo_rcs.postfbex_wttrain; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.postfbex_wttrain IS 'Weight training (e.g. lifting free weights, using weight machines)';


--
-- Name: COLUMN q2_demo_rcs.postfbex_endsprt; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.postfbex_endsprt IS 'Competitive endurance sports (e.g. marathon, triathlon)';


--
-- Name: COLUMN q2_demo_rcs.postfbex_reclg; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.postfbex_reclg IS 'Recreational team leagues (e.g. soccer, basketball, flag football, volleyball)';


--
-- Name: COLUMN q2_demo_rcs.pastyrex_walk; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pastyrex_walk IS 'Walking for exercise or walking to work';


--
-- Name: COLUMN q2_demo_rcs.pastyrex_jog; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pastyrex_jog IS 'Jogging (slower than 10min/mile)';


--
-- Name: COLUMN q2_demo_rcs.pastyrex_run; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pastyrex_run IS 'Running (10min/mile or faster)';


--
-- Name: COLUMN q2_demo_rcs.pastyrex_oth; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pastyrex_oth IS 'Other aerobic exercise (e.g. bicycling, stationary bike, elliptical machine, stairmaster)';


--
-- Name: COLUMN q2_demo_rcs.pastyrex_lowint; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pastyrex_lowint IS 'Low intensity exercise (e.g. yoga, pilates, stretching)';


--
-- Name: COLUMN q2_demo_rcs.pastyrex_wttrain; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pastyrex_wttrain IS 'Weight training (e.g. lifting free weights, using weight machines)';


--
-- Name: COLUMN q2_demo_rcs.pastyrex_endsprt; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pastyrex_endsprt IS 'Competitive endurance sports (e.g. marathon, triathlon)';


--
-- Name: COLUMN q2_demo_rcs.pastyrex_reclg; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pastyrex_reclg IS 'Recreational team leagues (e.g. soccer, basketball, flag football, volleyball)';


--
-- Name: COLUMN q2_demo_rcs.ex150min; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.ex150min IS 'Do you do 2.5 hours or more of moderate intensity aerobic activity per week? (e.g. brisk walking, jogging, cycling, etc.).';


--
-- Name: COLUMN q2_demo_rcs.ex150min_exp; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.ex150min_exp IS 'Please select the reason that best explains why you do not do at least 2.5 hours of moderate intensity aerobic activity per week:';


--
-- Name: COLUMN q2_demo_rcs.ex150min_oth; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.ex150min_oth IS 'If other, please explain:';


--
-- Name: COLUMN q2_demo_rcs.demog___complete; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.demog___complete IS 'Check this box and press "Next Page" to save your answers and move on to the next section.';


--
-- Name: COLUMN q2_demo_rcs.postfb_wt2yr; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.postfb_wt2yr IS '2 years after leaving professional football play?';


--
-- Name: COLUMN q2_demo_rcs.postfb_wt5yr; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.postfb_wt5yr IS '5 years after leaving professional football play?';


--
-- Name: COLUMN q2_demo_rcs.cardiac_rehab; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.cardiac_rehab IS 'Have you participated in cardiac rehab therapy based on a health care provider\''s recommendation?';


--
-- Name: COLUMN q2_demo_rcs.cvtest_ecg; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.cvtest_ecg IS '12 lead ECG (electrocardiogram)';


--
-- Name: COLUMN q2_demo_rcs.cvtest_ecg_exp; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.cvtest_ecg_exp IS 'Please specify the diagnosis, if known:';


--
-- Name: COLUMN q2_demo_rcs.cvtest_echo; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.cvtest_echo IS 'Heart ultrasound (echocardiogram)';


--
-- Name: COLUMN q2_demo_rcs.cvtest_echo_exp; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.cvtest_echo_exp IS 'Please specify the diagnosis, if known:';


--
-- Name: COLUMN q2_demo_rcs.cvtest_cpxt; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.cvtest_cpxt IS 'Exercise stress test';


--
-- Name: COLUMN q2_demo_rcs.cvtest_cpxt_exp; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.cvtest_cpxt_exp IS 'Please specify the diagnosis, if known:';


--
-- Name: COLUMN q2_demo_rcs.cvtest_cvmri; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.cvtest_cvmri IS 'Cardiac MRI';


--
-- Name: COLUMN q2_demo_rcs.cvtest_cvmri_exp; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.cvtest_cvmri_exp IS 'Please specify the diagnosis, if known:';


--
-- Name: COLUMN q2_demo_rcs.cvtest_corct; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.cvtest_corct IS 'Coronary artery CT scan';


--
-- Name: COLUMN q2_demo_rcs.cvtest_corct_exp; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.cvtest_corct_exp IS 'Please specify the diagnosis, if known:';


--
-- Name: COLUMN q2_demo_rcs.cvtest_cvcath; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.cvtest_cvcath IS 'Cardiac catheterization (coronary angiogram)';


--
-- Name: COLUMN q2_demo_rcs.cvtest_cvcath_exp; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.cvtest_cvcath_exp IS 'Please specify the diagnosis, if known:';


--
-- Name: COLUMN q2_demo_rcs.cvdx_mi; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.cvdx_mi IS 'Heart attack';


--
-- Name: COLUMN q2_demo_rcs.cvdx_stroke; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.cvdx_stroke IS 'Stroke (CVA)';


--
-- Name: COLUMN q2_demo_rcs.cvdx_tia; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.cvdx_tia IS 'TIA (Transient ischemic attack/mini-stroke)';


--
-- Name: COLUMN q2_demo_rcs.cvmedrec_highbp; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.cvmedrec_highbp IS 'High blood pressure';


--
-- Name: COLUMN q2_demo_rcs.cvmedrec_hrtfail; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.cvmedrec_hrtfail IS 'Heart failure';


--
-- Name: COLUMN q2_demo_rcs.cvmedrec_afib; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.cvmedrec_afib IS 'Atrial fibrillation';


--
-- Name: COLUMN q2_demo_rcs.cvmedrec_otharrhyth; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.cvmedrec_otharrhyth IS 'Other arrhythmias (e.g. SVT)';


--
-- Name: COLUMN q2_demo_rcs.cvmedrec_highchol; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.cvmedrec_highchol IS 'High cholesterol';


--
-- Name: COLUMN q2_demo_rcs.cvmedrec_diabetes; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.cvmedrec_diabetes IS 'Diabetes or high blood sugar';


--
-- Name: COLUMN q2_demo_rcs.cvsurg_bypass; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.cvsurg_bypass IS 'Heart bypass, angioplasty, or stent placement';


--
-- Name: COLUMN q2_demo_rcs.cvsurg_ablation; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.cvsurg_ablation IS 'Ablation for atrial fibrillation';


--
-- Name: COLUMN q2_demo_rcs.cvsurg_carotidart; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.cvsurg_carotidart IS 'Carotid artery surgery';


--
-- Name: COLUMN q2_demo_rcs.cvmed_chol; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.cvmed_chol IS '\"Statin\" cholesterol lowering drugs \[e.g. Mervacor (lovastatin), Pravachol (pravastatin), Xocor (simvastatin), Lipitor\]';


--
-- Name: COLUMN q2_demo_rcs.cvmed_othchol; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.cvmed_othchol IS 'Other cholesterol-lowering drugs \[e.g. Niaspan, Slo-Niacin (niacin), Lopid (gemfibrozil), Tricor (fenofibrate), Questran (cholestyramine)\]';


--
-- Name: COLUMN q2_demo_rcs.cvmed_novchol; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.cvmed_novchol IS 'Novel cholesterol lowering drugs (PCSK-9 inhibitors) \[e.g. Repatha (evolocumab), Praluent (alirocumab)\]';


--
-- Name: COLUMN q2_demo_rcs.cvmed_bldthin; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.cvmed_bldthin IS 'Non-aspirin blood thinners \[e.g. Coumadin (warfarin)\]';


--
-- Name: COLUMN q2_demo_rcs.cvmed_anticoag; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.cvmed_anticoag IS 'Novel oral anti-coagulant \[e.g. Eliquis (apixaban), Pradaxa (dabigatran), Xarelto (rivaroxaban)\]';


--
-- Name: COLUMN q2_demo_rcs.cvmed_arrhyth; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.cvmed_arrhyth IS 'Anti-arrhythmia drugs for atrial fibrillation \[e.g. beta blockers (Sectral, Tenormin), sotalol (Betapace, Sotylize, Sorine), flecainide (Tambocor), droedarone (Multaq)\]';


--
-- Name: COLUMN q2_demo_rcs.cvmed_digoxin; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.cvmed_digoxin IS 'Digoxin \[e.g. Lenoxin\]';


--
-- Name: COLUMN q2_demo_rcs.cvmed_furosemide; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.cvmed_furosemide IS 'Furosemide-like diuretic drug \[e.g. Lasix, Bumex\]';


--
-- Name: COLUMN q2_demo_rcs.cvmed_thiazide; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.cvmed_thiazide IS 'Thiazide diuretic \[e.g. HCTZ, Microzide\]';


--
-- Name: COLUMN q2_demo_rcs.cvmed_calciumblk; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.cvmed_calciumblk IS 'Calcium blocker \[e.g. Calan (verapamil), Procardia (nifedipine), Cardizem (diltiazem)\]';


--
-- Name: COLUMN q2_demo_rcs.cvmed_antihyp; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.cvmed_antihyp IS 'Other antihypertensive \[e.g. Vasotec (enalapril), Capoten (captopril)\]';


--
-- Name: COLUMN q2_demo_rcs.dbmed_metformin; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.dbmed_metformin IS 'Metformin \[e.g. Glumetza, Glucophage, Fortamet\]';


--
-- Name: COLUMN q2_demo_rcs.dbmed_glimeperide; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.dbmed_glimeperide IS 'Glimeperide';


--
-- Name: COLUMN q2_demo_rcs.dbmed_insulin; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.dbmed_insulin IS 'Insulin';


--
-- Name: COLUMN q2_demo_rcs.dbmed_other; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.dbmed_other IS 'Other diabetes medication';


--
-- Name: COLUMN q2_demo_rcs.cardiac___complete; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.cardiac___complete IS 'Check this box and press "Next Page" if you are ready to move on to the next section';


--
-- Name: COLUMN q2_demo_rcs.ad8_1; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.ad8_1 IS 'Problems with judgment. (e.g., problems making decisions, bad financial decisions, problems with thinking)';


--
-- Name: COLUMN q2_demo_rcs.ad8_2; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.ad8_2 IS 'Less interest in hobbies/activities.';


--
-- Name: COLUMN q2_demo_rcs.ad8_3; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.ad8_3 IS 'Repeats the same things over and over (questions, stories, or statements).';


--
-- Name: COLUMN q2_demo_rcs.ad8_4; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.ad8_4 IS 'Trouble learning how to use a tool, appliance, or gadget. (e.g., VCR, computer, microwave, remote control)';


--
-- Name: COLUMN q2_demo_rcs.ad8_5; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.ad8_5 IS 'Forgets correct month or year.';


--
-- Name: COLUMN q2_demo_rcs.ad8_6; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.ad8_6 IS 'Trouble handling complicated financial affairs. (e.g. balancing checkbook, income taxes, paying bills).';


--
-- Name: COLUMN q2_demo_rcs.ad8_7; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.ad8_7 IS 'Trouble remembering appointments.';


--
-- Name: COLUMN q2_demo_rcs.ad8_8; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.ad8_8 IS 'Daily problems with thinking and/or memory.';


--
-- Name: COLUMN q2_demo_rcs.nqcog64q2; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.nqcog64q2 IS 'I had to read something several times to understand it.';


--
-- Name: COLUMN q2_demo_rcs.nqcog65q2; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.nqcog65q2 IS 'I had trouble keeping track of what I was doing if I was interrupted.';


--
-- Name: COLUMN q2_demo_rcs.nqcog66q2; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.nqcog66q2 IS 'I had difficulty doing more than one thing at a time.';


--
-- Name: COLUMN q2_demo_rcs.nqcog68q2; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.nqcog68q2 IS 'I had trouble remembering new information, like phone numbers or simple instructions.';


--
-- Name: COLUMN q2_demo_rcs.nqcog72q2; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.nqcog72q2 IS 'I had trouble thinking clearly.';


--
-- Name: COLUMN q2_demo_rcs.nqcog75q2; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.nqcog75q2 IS 'My thinking was slow.';


--
-- Name: COLUMN q2_demo_rcs.nqcog77q2; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.nqcog77q2 IS 'I had to work really hard to pay attention or I would make a mistake.';


--
-- Name: COLUMN q2_demo_rcs.nqcog80q2; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.nqcog80q2 IS 'I had trouble concentrating.';


--
-- Name: COLUMN q2_demo_rcs.nqper02; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.nqper02 IS 'I had trouble controlling my temper.';


--
-- Name: COLUMN q2_demo_rcs.nqper05; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.nqper05 IS 'It was hard to control my behavior.';


--
-- Name: COLUMN q2_demo_rcs.nqper06; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.nqper06 IS 'I said or did things without thinking.';


--
-- Name: COLUMN q2_demo_rcs.nqper07; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.nqper07 IS 'I got impatient with other people.';


--
-- Name: COLUMN q2_demo_rcs.nqper11; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.nqper11 IS 'I was irritable around other people.';


--
-- Name: COLUMN q2_demo_rcs.nqper12; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.nqper12 IS 'I was bothered by little things.';


--
-- Name: COLUMN q2_demo_rcs.nqper17; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.nqper17 IS 'I became easily upset.';


--
-- Name: COLUMN q2_demo_rcs.nqper19; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.nqper19 IS 'I was in conflict with others.';


--
-- Name: COLUMN q2_demo_rcs.phq1; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.phq1 IS 'Little interest or pleasure in doing things.';


--
-- Name: COLUMN q2_demo_rcs.phq2; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.phq2 IS 'Feeling down, depressed, or hopeless.';


--
-- Name: COLUMN q2_demo_rcs.phq3; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.phq3 IS 'Trouble falling or staying asleep, or sleeping too much.';


--
-- Name: COLUMN q2_demo_rcs.phq4; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.phq4 IS 'Feeling tired or having little energy.';


--
-- Name: COLUMN q2_demo_rcs.phq5; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.phq5 IS 'Poor appetite or overeating.';


--
-- Name: COLUMN q2_demo_rcs.phq6; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.phq6 IS 'Feeling bad about yourself - or that you are a failure or have let yourself or your family down.';


--
-- Name: COLUMN q2_demo_rcs.phq7; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.phq7 IS 'Trouble concentrating on things, such as reading the newspaper or watching television.';


--
-- Name: COLUMN q2_demo_rcs.phq8; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.phq8 IS 'Moving or speaking so slowly that other people could have noticed. Or the opposite - being so fidgety or restless that you have been moving around a lot more than usual.';


--
-- Name: COLUMN q2_demo_rcs.phq9; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.phq9 IS 'Thoughts that you would be better off dead or of hurting yourself.';


--
-- Name: COLUMN q2_demo_rcs.gad7_1; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.gad7_1 IS 'Feeling nervous, anxious or on edge.';


--
-- Name: COLUMN q2_demo_rcs.gad7_2; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.gad7_2 IS 'Not being able to stop or control worrying.';


--
-- Name: COLUMN q2_demo_rcs.gad7_3; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.gad7_3 IS 'Worrying too much about different things.';


--
-- Name: COLUMN q2_demo_rcs.gad7_4; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.gad7_4 IS 'Trouble relaxing.';


--
-- Name: COLUMN q2_demo_rcs.gad7_5; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.gad7_5 IS 'Being so restless that it is hard to sit still.';


--
-- Name: COLUMN q2_demo_rcs.gad7_6; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.gad7_6 IS 'Becoming easily annoyed or irritable.';


--
-- Name: COLUMN q2_demo_rcs.gad7_7; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.gad7_7 IS 'Feeling afraid as if something awful might happen.';


--
-- Name: COLUMN q2_demo_rcs.lotr1; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.lotr1 IS 'In uncertain times, I usually expect the best.';


--
-- Name: COLUMN q2_demo_rcs.lotr3; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.lotr3 IS 'If something can go wrong for me, it will.';


--
-- Name: COLUMN q2_demo_rcs.lotr4; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.lotr4 IS 'I\''m always optimistic about my future.';


--
-- Name: COLUMN q2_demo_rcs.lotr7; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.lotr7 IS 'I hardly ever expect things to go my way.';


--
-- Name: COLUMN q2_demo_rcs.lotr9; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.lotr9 IS 'I rarely count on good things happening to me.';


--
-- Name: COLUMN q2_demo_rcs.lotr10; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.lotr10 IS 'Overall, I expect more good things to happen to me than bad.';


--
-- Name: COLUMN q2_demo_rcs.stpbng_snore; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.stpbng_snore IS 'Do you SNORE loudly (loud enough to be heard through closed doors or your bed-partner elbows you for snoring at night)?';


--
-- Name: COLUMN q2_demo_rcs.stpbng_tired; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.stpbng_tired IS 'Do you often feel TIRED, fatigued, or sleepy during the daytime? (such as falling asleep during driving or talking to someone)?';


--
-- Name: COLUMN q2_demo_rcs.stpbng_obser; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.stpbng_obser IS 'Has anyone observed you stop breathing or choking/gasping during your sleep?';


--
-- Name: COLUMN q2_demo_rcs.stpbng_bp; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.stpbng_bp IS 'Do you have or are you being treated for high blood pressure?';


--
-- Name: COLUMN q2_demo_rcs.stpbng_neck; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.stpbng_neck IS 'What is your neck circumference (your collar size when buying a dress shirt)?';


--
-- Name: COLUMN q2_demo_rcs.cpapuse; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.cpapuse IS 'Do you currently use a CPAP device for sleep apnea?';


--
-- Name: COLUMN q2_demo_rcs.cpapuse_days; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.cpapuse_days IS 'About how many days per week do you use your CPAP device?';


--
-- Name: COLUMN q2_demo_rcs.ncmedrec_hdache; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.ncmedrec_hdache IS 'Headaches';


--
-- Name: COLUMN q2_demo_rcs.ncmedrec_anx; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.ncmedrec_anx IS 'Anxiety';


--
-- Name: COLUMN q2_demo_rcs.ncmedrec_dep; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.ncmedrec_dep IS 'Depression';


--
-- Name: COLUMN q2_demo_rcs.ncmedrec_memloss; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.ncmedrec_memloss IS 'Memory loss';


--
-- Name: COLUMN q2_demo_rcs.ncmedrec_add; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.ncmedrec_add IS 'ADD/ADHD';


--
-- Name: COLUMN q2_demo_rcs.ncdx_alz; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.ncdx_alz IS 'Alzheimer\''s disease';


--
-- Name: COLUMN q2_demo_rcs.ncdx_cte; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.ncdx_cte IS 'Chronic traumatic encephalopathy (CTE)';


--
-- Name: COLUMN q2_demo_rcs.ncdx_vascdem; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.ncdx_vascdem IS 'Vascular dementia';


--
-- Name: COLUMN q2_demo_rcs.ncdx_othdem; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.ncdx_othdem IS 'Other dementia';


--
-- Name: COLUMN q2_demo_rcs.ncdx_als; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.ncdx_als IS 'Amyotrophic lateral sclerosis (ALS, Lou Gehrig\''s disease)';


--
-- Name: COLUMN q2_demo_rcs.ncdx_parkins; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.ncdx_parkins IS 'Parkinson\''s disease';


--
-- Name: COLUMN q2_demo_rcs.ncdx_ms; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.ncdx_ms IS 'Multiple sclerosis (MS)';


--
-- Name: COLUMN q2_demo_rcs.ncmed_ssri; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.ncmed_ssri IS 'Prozac, Zoloft, Paxil, Celexa';


--
-- Name: COLUMN q2_demo_rcs.ncmed_tricydep; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.ncmed_tricydep IS 'Tricyclic antidepressant \[e.g. Elavil, Sinequan\]';


--
-- Name: COLUMN q2_demo_rcs.ncmed_othdep; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.ncmed_othdep IS 'Other antidepressant \[e.g. Nardil, Marplan\]';


--
-- Name: COLUMN q2_demo_rcs.ncmed_slpaid; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.ncmed_slpaid IS 'Sleep aid';


--
-- Name: COLUMN q2_demo_rcs.neurocog___complete; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.neurocog___complete IS 'Check this box and press "Next Page" if you are ready to move on to the next section';


--
-- Name: COLUMN q2_demo_rcs.bpi1; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.bpi1 IS 'Have you had pain other than these \"everyday\" kinds of pain today?';


--
-- Name: COLUMN q2_demo_rcs.bpi2___head; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.bpi2___head IS 'Head';


--
-- Name: COLUMN q2_demo_rcs.bpi2___neck; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.bpi2___neck IS 'Neck';


--
-- Name: COLUMN q2_demo_rcs.bpi2___shoul; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.bpi2___shoul IS 'Shoulder';


--
-- Name: COLUMN q2_demo_rcs.bpi2___chest; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.bpi2___chest IS 'Chest';


--
-- Name: COLUMN q2_demo_rcs.bpi2___arm; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.bpi2___arm IS 'Arm';


--
-- Name: COLUMN q2_demo_rcs.bpi2___hand; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.bpi2___hand IS 'Hand';


--
-- Name: COLUMN q2_demo_rcs.bpi2___uback; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.bpi2___uback IS 'Upper back';


--
-- Name: COLUMN q2_demo_rcs.bpi2___lbak; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.bpi2___lbak IS 'Lower back';


--
-- Name: COLUMN q2_demo_rcs.bpi2___hip; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.bpi2___hip IS 'Hip';


--
-- Name: COLUMN q2_demo_rcs.bpi2___leg; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.bpi2___leg IS 'Leg
';


--
-- Name: COLUMN q2_demo_rcs.bpi2___knee; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.bpi2___knee IS 'Knee';


--
-- Name: COLUMN q2_demo_rcs.bpi2___ankle; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.bpi2___ankle IS 'Ankle';


--
-- Name: COLUMN q2_demo_rcs.bpi2___foot; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.bpi2___foot IS 'Foot';


--
-- Name: COLUMN q2_demo_rcs.bpi2___oth; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.bpi2___oth IS 'Other';


--
-- Name: COLUMN q2_demo_rcs.bpi2_othexp; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.bpi2_othexp IS 'If you selected \"Other\", please explain:';


--
-- Name: COLUMN q2_demo_rcs.bpi2most; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.bpi2most IS 'Please indicate the area where you feel the most pain.';


--
-- Name: COLUMN q2_demo_rcs.bpi2most_othexp; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.bpi2most_othexp IS 'If you selected \"Other\", please explain:';


--
-- Name: COLUMN q2_demo_rcs.bpi3; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.bpi3 IS 'Please rate your pain by marking the box beside the number that best describes your pain at its *worst* in the last 24 hours.';


--
-- Name: COLUMN q2_demo_rcs.bpi4; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.bpi4 IS 'Please rate your pain by marking the box beside the number that best describes your pain at its *least* in the last 24 hours.';


--
-- Name: COLUMN q2_demo_rcs.bpi5; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.bpi5 IS 'Please rate your pain by marking the box beside the number that best describes your pain on the *average*.';


--
-- Name: COLUMN q2_demo_rcs.bpi6; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.bpi6 IS 'Please rate your pain by marking the box beside the number that tells how much pain you have *right now*.';


--
-- Name: COLUMN q2_demo_rcs.bpi7___none; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.bpi7___none IS 'None';


--
-- Name: COLUMN q2_demo_rcs.bpi7___otc; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.bpi7___otc IS 'Over the counter medication';


--
-- Name: COLUMN q2_demo_rcs.bpi7___prmed; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.bpi7___prmed IS 'Prescribed medication';


--
-- Name: COLUMN q2_demo_rcs.bpi7___mass; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.bpi7___mass IS 'Massage/acupressure';


--
-- Name: COLUMN q2_demo_rcs.bpi7___pt; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.bpi7___pt IS 'Physical therapy';


--
-- Name: COLUMN q2_demo_rcs.bpi7___acup; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.bpi7___acup IS 'Acupuncture';


--
-- Name: COLUMN q2_demo_rcs.bpi7___marij; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.bpi7___marij IS 'Marijuana or medical marijuana';


--
-- Name: COLUMN q2_demo_rcs.bpi7___intpm; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.bpi7___intpm IS 'Interventional pain management (nerve
 blocks, joint injections or radiotherapy)';


--
-- Name: COLUMN q2_demo_rcs.bpi7___oth; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.bpi7___oth IS 'Other';


--
-- Name: COLUMN q2_demo_rcs.bpi7_othexp; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.bpi7_othexp IS 'If you selected \"Other\", please explain:';


--
-- Name: COLUMN q2_demo_rcs.bpi8; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.bpi8 IS 'In the last 24 hours, how much relief have pain treatments or medications provided? Please mark the box below the percentage that most shows how much relief you have received.';


--
-- Name: COLUMN q2_demo_rcs.bpi9a; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.bpi9a IS 'General activity';


--
-- Name: COLUMN q2_demo_rcs.bpi9b; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.bpi9b IS 'Mood';


--
-- Name: COLUMN q2_demo_rcs.bpi9c; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.bpi9c IS 'Walking ability';


--
-- Name: COLUMN q2_demo_rcs.bpi9d; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.bpi9d IS 'Normal work (includes both work outside the home and housework)';


--
-- Name: COLUMN q2_demo_rcs.bpi9e; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.bpi9e IS 'Relations with other people';


--
-- Name: COLUMN q2_demo_rcs.bpi9f; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.bpi9f IS 'Sleep';


--
-- Name: COLUMN q2_demo_rcs.bpi9g; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.bpi9g IS 'Enjoyment of life';


--
-- Name: COLUMN q2_demo_rcs.bpi9h; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.bpi9h IS 'Exercise for health and wellness';


--
-- Name: COLUMN q2_demo_rcs.pnmedfb_acetamin; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pnmedfb_acetamin IS 'Acetaminophen \[e.g. Tylenol\]';


--
-- Name: COLUMN q2_demo_rcs.pnmedfb_aspirin; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pnmedfb_aspirin IS 'Aspirin or aspirin containing products \[e.g. Excedrin Migraine, Alka-Seltzer with aspirin\]';


--
-- Name: COLUMN q2_demo_rcs.pnmedfb_ibuprof; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pnmedfb_ibuprof IS 'Ibuprofen \[e.g. Motrin, Advil\]';


--
-- Name: COLUMN q2_demo_rcs.pnmedfb_othantiinf; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pnmedfb_othantiinf IS 'Other anti-inflammatory analgesics \[e.g. Aleve, Naprosyn, Relafen, Frotek, Anaprox\]';


--
-- Name: COLUMN q2_demo_rcs.pnmedfb_oralster; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pnmedfb_oralster IS 'Steroid taken orally \[e.g. Prednisone, Medrol\]';


--
-- Name: COLUMN q2_demo_rcs.pnmedfb_opioid; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pnmedfb_opioid IS 'Opioid-based pain medication \[e.g. Percocet, Vicodin\]';


--
-- Name: COLUMN q2_demo_rcs.pnmed5yr_acetamin; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pnmed5yr_acetamin IS 'Acetaminophen \[e.g. Tylenol\]';


--
-- Name: COLUMN q2_demo_rcs.pnmed5yr_aspirin; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pnmed5yr_aspirin IS 'Aspirin or aspirin containing products \[e.g. Excedrin Migraine, Alka-Seltzer with aspirin\]';


--
-- Name: COLUMN q2_demo_rcs.pnmed5yr_ibuprof; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pnmed5yr_ibuprof IS 'Ibuprofen \[e.g. Motrin, Advil\]';


--
-- Name: COLUMN q2_demo_rcs.pnmed5yr_antiinf; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pnmed5yr_antiinf IS 'Other anti-inflammatory analgesics \[e.g. Aleve, Naprosyn, Relafen, Ketoprofen, Anaprox\]';


--
-- Name: COLUMN q2_demo_rcs.pnmed5yr_oralster; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pnmed5yr_oralster IS 'Steroid taken orally \[e.g. Prednisone, Medrol\]';


--
-- Name: COLUMN q2_demo_rcs.pnmed5yr_opioid; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pnmed5yr_opioid IS 'Opioid-based pain medication \[e.g. Percocet, Vicodin\]';


--
-- Name: COLUMN q2_demo_rcs.pnmed_acetamin; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pnmed_acetamin IS 'Acetaminophen \[e.g. Tylenol\]';


--
-- Name: COLUMN q2_demo_rcs.pnmed_acetamin_days; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pnmed_acetamin_days IS 'Days per week';


--
-- Name: COLUMN q2_demo_rcs.pnmed_acetamin_tabs; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pnmed_acetamin_tabs IS 'Tablets per day';


--
-- Name: COLUMN q2_demo_rcs.pnmed_acetamin_dose; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pnmed_acetamin_dose IS 'Usual dose per tab';


--
-- Name: COLUMN q2_demo_rcs.pnmed_aspirin; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pnmed_aspirin IS 'Aspirin or aspirin containing products \[e.g. Excedrin Migraine, Alka-Seltzer with aspirin\]';


--
-- Name: COLUMN q2_demo_rcs.pnmed_aspirin_days; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pnmed_aspirin_days IS 'Days per week';


--
-- Name: COLUMN q2_demo_rcs.pnmed_aspirin_tabs; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pnmed_aspirin_tabs IS 'Tablets per day';


--
-- Name: COLUMN q2_demo_rcs.pnmed_aspirin_dose; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pnmed_aspirin_dose IS 'Usual dose per tab';


--
-- Name: COLUMN q2_demo_rcs.pnmed_ibuprof; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pnmed_ibuprof IS 'Ibuprofen \[e.g. Motrin, Advil\]';


--
-- Name: COLUMN q2_demo_rcs.pnmed_ibuprof_days; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pnmed_ibuprof_days IS 'Days per week';


--
-- Name: COLUMN q2_demo_rcs.pnmed_ibuprof_tabs; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pnmed_ibuprof_tabs IS 'Tablets per day';


--
-- Name: COLUMN q2_demo_rcs.pnmed_ibuprof_dose; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pnmed_ibuprof_dose IS 'Usual dose per tab';


--
-- Name: COLUMN q2_demo_rcs.pnmed_antiinf; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pnmed_antiinf IS 'Other anti-inflammatory analgesics \[e.g. Aleve, Naprosyn, Relafen, Ketoprofen, Anaprox\]';


--
-- Name: COLUMN q2_demo_rcs.pnmed_antiinf_days; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pnmed_antiinf_days IS 'Days per week';


--
-- Name: COLUMN q2_demo_rcs.pnmed_antiinf_tabs; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pnmed_antiinf_tabs IS 'Tablets per day';


--
-- Name: COLUMN q2_demo_rcs.pnmed_antiinf_dose; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pnmed_antiinf_dose IS 'Usual dose per tab';


--
-- Name: COLUMN q2_demo_rcs.pnmed_oralster; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pnmed_oralster IS 'Steroid taken orally \[e.g. Prednisone, Medrol\]';


--
-- Name: COLUMN q2_demo_rcs.pnmed_oralster_days; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pnmed_oralster_days IS 'Days per week';


--
-- Name: COLUMN q2_demo_rcs.pnmed_oralster_tabs; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pnmed_oralster_tabs IS 'Tablets per day';


--
-- Name: COLUMN q2_demo_rcs.pnmed_oralster_dose; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pnmed_oralster_dose IS 'Usual dose per tab';


--
-- Name: COLUMN q2_demo_rcs.pnmed_opioid; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pnmed_opioid IS 'Opioid-based pain medication \[e.g. Percocet, Vicodin\]';


--
-- Name: COLUMN q2_demo_rcs.pnmed_opioid_days; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pnmed_opioid_days IS 'Days per week';


--
-- Name: COLUMN q2_demo_rcs.pnmed_opioid_tab; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pnmed_opioid_tab IS 'Tablets per days';


--
-- Name: COLUMN q2_demo_rcs.pnmed_opioid_dose; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pnmed_opioid_dose IS 'Usual dose per tab';


--
-- Name: COLUMN q2_demo_rcs.pnsurg_nckspin; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pnsurg_nckspin IS 'Neck/spine surgery';


--
-- Name: COLUMN q2_demo_rcs.pnsurg_back; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pnsurg_back IS 'Back (lumbar) surgery';


--
-- Name: COLUMN q2_demo_rcs.pnsurg_hip; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pnsurg_hip IS 'Hip replacement';


--
-- Name: COLUMN q2_demo_rcs.pnsurg_knee; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pnsurg_knee IS 'Knee replacement';


--
-- Name: COLUMN q2_demo_rcs.pain___complete; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pain___complete IS 'Check this box and press "Next Page" if you are ready to move on to the next section';


--
-- Name: COLUMN q2_demo_rcs.wealth; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.wealth IS 'What is your approximate household net worth? \[the value of all the assets of people in your household (like housing, cars, stock, retirement funds, and business ownership) minus any debt or loans you and household members may have (like mortgages, credit card debt or car, school, or business loans\].';


--
-- Name: COLUMN q2_demo_rcs.wealth_emerg___1; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.wealth_emerg___1 IS 'Put it on my credit card and pay it off in full at thenext statement';


--
-- Name: COLUMN q2_demo_rcs.wealth_emerg___2; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.wealth_emerg___2 IS 'Put it on my credit card and pay it off over time';


--
-- Name: COLUMN q2_demo_rcs.wealth_emerg___3; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.wealth_emerg___3 IS 'With the money currently in my checking/savings account or with cash';


--
-- Name: COLUMN q2_demo_rcs.wealth_emerg___4; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.wealth_emerg___4 IS 'Using money from a bank loan or line of credit';


--
-- Name: COLUMN q2_demo_rcs.wealth_emerg___5; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.wealth_emerg___5 IS 'By borrowing from a friend or family member';


--
-- Name: COLUMN q2_demo_rcs.wealth_emerg___6; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.wealth_emerg___6 IS 'Using a payday loan, deposit advance, oroverdraft';


--
-- Name: COLUMN q2_demo_rcs.wealth_emerg___7; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.wealth_emerg___7 IS 'By selling something';


--
-- Name: COLUMN q2_demo_rcs.wealth_emerg___8; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.wealth_emerg___8 IS 'I wouldn''t be able to pay for the expense right now';


--
-- Name: COLUMN q2_demo_rcs.wealth_emerg___9; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.wealth_emerg___9 IS 'Other';


--
-- Name: COLUMN q2_demo_rcs.wealth_emerg_oth; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.wealth_emerg_oth IS 'Please explain:';


--
-- Name: COLUMN q2_demo_rcs.ladder_wealth; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.ladder_wealth IS 'Where would you place yourself on this ladder? (Select the number that
best represents where you think you stand, relative to other people in
the United States)';


--
-- Name: COLUMN q2_demo_rcs.ladder_comm; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.ladder_comm IS 'Where would you place yourself on this ladder? (Select the number that
best represents where you think you stand, relative to other people in
the United States)';


--
-- Name: COLUMN q2_demo_rcs.household_number; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.household_number IS 'How many people are in your household?';


--
-- Name: COLUMN q2_demo_rcs.hcutil_pcp; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.hcutil_pcp IS 'Have you seen you seen your primary care physician (PCP) in the past 3 years?';


--
-- Name: COLUMN q2_demo_rcs.hcutil_pcp_exp; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.hcutil_pcp_exp IS 'If not, why?';


--
-- Name: COLUMN q2_demo_rcs.hcutil_pcp_oth; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.hcutil_pcp_oth IS 'If "Other", please explain:';


--
-- Name: COLUMN q2_demo_rcs.hcutil_othprov; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.hcutil_othprov IS 'Have you seen a physician or healthcare provider other than your PCP in the past 3 years? (e.g. physical therapist, cardiologist, endocrinologist, etc.)';


--
-- Name: COLUMN q2_demo_rcs.selfrpt_cte; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.selfrpt_cte IS 'Do *you* believe you have Chronic Traumatic Encephalopathy (CTE)?';


--
-- Name: COLUMN q2_demo_rcs.otdx_arthritis; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.otdx_arthritis IS 'Arthritis (e.g. osteoarthritis)';


--
-- Name: COLUMN q2_demo_rcs.otdx_slpapnea; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.otdx_slpapnea IS 'Sleep apnea';


--
-- Name: COLUMN q2_demo_rcs.otdx_prostcanc; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.otdx_prostcanc IS 'Prostate cancer';


--
-- Name: COLUMN q2_demo_rcs.otdx_basalcanc; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.otdx_basalcanc IS 'Basal cell skin cancer';


--
-- Name: COLUMN q2_demo_rcs.otdx_squamcanc; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.otdx_squamcanc IS 'Squamous cell skin cancer';


--
-- Name: COLUMN q2_demo_rcs.otdx_melanom; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.otdx_melanom IS 'Melanoma';


--
-- Name: COLUMN q2_demo_rcs.otdx_lymphom; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.otdx_lymphom IS 'Lymphoma';


--
-- Name: COLUMN q2_demo_rcs.otdx_othcanc; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.otdx_othcanc IS 'Other cancer';


--
-- Name: COLUMN q2_demo_rcs.otdx_renalfail; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.otdx_renalfail IS 'Chronic renal failure';


--
-- Name: COLUMN q2_demo_rcs.otdx_alcdep; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.otdx_alcdep IS 'Alcohol dependence problem';


--
-- Name: COLUMN q2_demo_rcs.otdx_livcirrhosis; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.otdx_livcirrhosis IS 'Liver cirrhosis';


--
-- Name: COLUMN q2_demo_rcs.otdx_livfail; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.otdx_livfail IS 'Liver failure';


--
-- Name: COLUMN q2_demo_rcs.otmedrec_pncond; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.otmedrec_pncond IS 'Pain related condition';


--
-- Name: COLUMN q2_demo_rcs.otmedrec_livprob; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.otmedrec_livprob IS 'Liver problem';


--
-- Name: COLUMN q2_demo_rcs.otmedrec_lowtest; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.otmedrec_lowtest IS 'Low testosterone';


--
-- Name: COLUMN q2_demo_rcs.otmedrec_ed; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.otmedrec_ed IS 'Erectile dysfunction (E.D.)';


--
-- Name: COLUMN q2_demo_rcs.massage; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.massage IS 'Massage';


--
-- Name: COLUMN q2_demo_rcs.acupuncture; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.acupuncture IS 'Acupuncture';


--
-- Name: COLUMN q2_demo_rcs.chiropractic; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.chiropractic IS 'Chiropractic treatment';


--
-- Name: COLUMN q2_demo_rcs.yoga; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.yoga IS 'Yoga';


--
-- Name: COLUMN q2_demo_rcs.taichi; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.taichi IS 'Tai chi';


--
-- Name: COLUMN q2_demo_rcs.meditation; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.meditation IS 'Meditation';


--
-- Name: COLUMN q2_demo_rcs.othaltmed; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.othaltmed IS 'Other alternative medication';


--
-- Name: COLUMN q2_demo_rcs.othaltmed_exp; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.othaltmed_exp IS 'Please specify:';


--
-- Name: COLUMN q2_demo_rcs.famhxmoth___na; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.famhxmoth___na IS 'Not applicable
';


--
-- Name: COLUMN q2_demo_rcs.famhxmoth___lung; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.famhxmoth___lung IS 'Lung
 cancer';


--
-- Name: COLUMN q2_demo_rcs.famhxmoth___colrec; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.famhxmoth___colrec IS 'Colon 
or rectal cancer';


--
-- Name: COLUMN q2_demo_rcs.famhxmoth___diab; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.famhxmoth___diab IS 'Diabetes ';


--
-- Name: COLUMN q2_demo_rcs.famhxmoth___mela; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.famhxmoth___mela IS 'Melanoma';


--
-- Name: COLUMN q2_demo_rcs.famhxmoth___hypert; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.famhxmoth___hypert IS 'Hypertension';


--
-- Name: COLUMN q2_demo_rcs.famhxmoth___dem; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.famhxmoth___dem IS 'Dementia before
age 70';


--
-- Name: COLUMN q2_demo_rcs.famhxmoth___alc; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.famhxmoth___alc IS 'Alcohol problem';


--
-- Name: COLUMN q2_demo_rcs.famhxfsib___na; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.famhxfsib___na IS 'Not applicable
';


--
-- Name: COLUMN q2_demo_rcs.famhxfsib___lung; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.famhxfsib___lung IS 'Lung
 cancer';


--
-- Name: COLUMN q2_demo_rcs.famhxfsib___colrec; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.famhxfsib___colrec IS 'Colon 
or rectal cancer';


--
-- Name: COLUMN q2_demo_rcs.famhxfsib___diab; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.famhxfsib___diab IS 'Diabetes ';


--
-- Name: COLUMN q2_demo_rcs.famhxfsib___mela; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.famhxfsib___mela IS 'Melanoma';


--
-- Name: COLUMN q2_demo_rcs.famhxfsib___hypert; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.famhxfsib___hypert IS 'Hypertension';


--
-- Name: COLUMN q2_demo_rcs.famhxfsib___dem; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.famhxfsib___dem IS 'Dementia before
age 70';


--
-- Name: COLUMN q2_demo_rcs.famhxfsib___alc; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.famhxfsib___alc IS 'Alcohol problem';


--
-- Name: COLUMN q2_demo_rcs.femsib_number; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.femsib_number IS 'How many full female siblings do you have?';


--
-- Name: COLUMN q2_demo_rcs.famhxfath___na; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.famhxfath___na IS 'Not applicable';


--
-- Name: COLUMN q2_demo_rcs.famhxfath___lung; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.famhxfath___lung IS 'Lung cancer';


--
-- Name: COLUMN q2_demo_rcs.famhxfath___colrec; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.famhxfath___colrec IS 'Colon 
or rectal cancer';


--
-- Name: COLUMN q2_demo_rcs.famhxfath___prost; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.famhxfath___prost IS 'Prostate cancer';


--
-- Name: COLUMN q2_demo_rcs.famhxfath___diab; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.famhxfath___diab IS 'Diabetes ';


--
-- Name: COLUMN q2_demo_rcs.famhxfath___mela; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.famhxfath___mela IS 'Melanoma';


--
-- Name: COLUMN q2_demo_rcs.famhxfath___hypert; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.famhxfath___hypert IS 'Hypertension';


--
-- Name: COLUMN q2_demo_rcs.famhxfath___dem; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.famhxfath___dem IS 'Dementia before age
70';


--
-- Name: COLUMN q2_demo_rcs.famhxfath___alc; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.famhxfath___alc IS 'Alcohol problem';


--
-- Name: COLUMN q2_demo_rcs.famhxmsib___na; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.famhxmsib___na IS 'Not applicable';


--
-- Name: COLUMN q2_demo_rcs.famhxmsib___lung; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.famhxmsib___lung IS 'Lung cancer';


--
-- Name: COLUMN q2_demo_rcs.famhxmsib___colrec; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.famhxmsib___colrec IS 'Colon 
or rectal cancer';


--
-- Name: COLUMN q2_demo_rcs.famhxmsib___prost; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.famhxmsib___prost IS 'Prostate cancer';


--
-- Name: COLUMN q2_demo_rcs.famhxmsib___diab; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.famhxmsib___diab IS 'Diabetes ';


--
-- Name: COLUMN q2_demo_rcs.famhxmsib___mela; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.famhxmsib___mela IS 'Melanoma';


--
-- Name: COLUMN q2_demo_rcs.famhxmsib___hypert; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.famhxmsib___hypert IS 'Hypertension';


--
-- Name: COLUMN q2_demo_rcs.famhxmsib___dem; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.famhxmsib___dem IS 'Dementia before age
70';


--
-- Name: COLUMN q2_demo_rcs.famhxmsib___alc; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.famhxmsib___alc IS 'Alcohol problem';


--
-- Name: COLUMN q2_demo_rcs.sib_number; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.sib_number IS 'How many full male siblings do you have?';


--
-- Name: COLUMN q2_demo_rcs.sib1age; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.sib1age IS 'Current age:';


--
-- Name: COLUMN q2_demo_rcs.sib1ht_feet; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.sib1ht_feet IS 'Height (feet):';


--
-- Name: COLUMN q2_demo_rcs.sib1ht_inch; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.sib1ht_inch IS 'Height (inches):';


--
-- Name: COLUMN q2_demo_rcs.sib1sport___none; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.sib1sport___none IS 'Did not play sports';


--
-- Name: COLUMN q2_demo_rcs.sib1sport___hsfb; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.sib1sport___hsfb IS 'Played H.S. football';


--
-- Name: COLUMN q2_demo_rcs.sib1sport___colfb; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.sib1sport___colfb IS 'Played college football';


--
-- Name: COLUMN q2_demo_rcs.sib1sport___oth; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.sib1sport___oth IS 'Other';


--
-- Name: COLUMN q2_demo_rcs.sib1sport_oth; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.sib1sport_oth IS 'Please specify:';


--
-- Name: COLUMN q2_demo_rcs.sib2age; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.sib2age IS 'Current age:';


--
-- Name: COLUMN q2_demo_rcs.sib2ht_feet; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.sib2ht_feet IS 'Height (feet):';


--
-- Name: COLUMN q2_demo_rcs.sib2ht_inch; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.sib2ht_inch IS 'Height (inches):';


--
-- Name: COLUMN q2_demo_rcs.sib2sport___none; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.sib2sport___none IS 'Did not play sports';


--
-- Name: COLUMN q2_demo_rcs.sib2sport___hsfb; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.sib2sport___hsfb IS 'Played H.S. football';


--
-- Name: COLUMN q2_demo_rcs.sib2sport___colfb; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.sib2sport___colfb IS 'Played college football';


--
-- Name: COLUMN q2_demo_rcs.sib2sport___oth; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.sib2sport___oth IS 'Other';


--
-- Name: COLUMN q2_demo_rcs.sib2sport_oth; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.sib2sport_oth IS 'Please specify:';


--
-- Name: COLUMN q2_demo_rcs.sib3age; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.sib3age IS 'Current age:';


--
-- Name: COLUMN q2_demo_rcs.sib3ht_feet; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.sib3ht_feet IS 'Height (feet):';


--
-- Name: COLUMN q2_demo_rcs.sib3ht_inch; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.sib3ht_inch IS 'Height (inches):';


--
-- Name: COLUMN q2_demo_rcs.sib3sport___none; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.sib3sport___none IS 'Did not play sports';


--
-- Name: COLUMN q2_demo_rcs.sib3sport___hsfb; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.sib3sport___hsfb IS 'Played H.S. football';


--
-- Name: COLUMN q2_demo_rcs.sib3sport___colfb; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.sib3sport___colfb IS 'Played college football';


--
-- Name: COLUMN q2_demo_rcs.sib3sport___oth; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.sib3sport___oth IS 'Other';


--
-- Name: COLUMN q2_demo_rcs.sib3sport_oth; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.sib3sport_oth IS 'Please specify:';


--
-- Name: COLUMN q2_demo_rcs.sib4age; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.sib4age IS 'Current age:';


--
-- Name: COLUMN q2_demo_rcs.sib4ht_feet; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.sib4ht_feet IS 'Height (feet):';


--
-- Name: COLUMN q2_demo_rcs.sib4ht_inch; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.sib4ht_inch IS 'Height (inches):';


--
-- Name: COLUMN q2_demo_rcs.sib4sport___none; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.sib4sport___none IS 'Did not play sports';


--
-- Name: COLUMN q2_demo_rcs.sib4sport___hsfb; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.sib4sport___hsfb IS 'Played H.S. football';


--
-- Name: COLUMN q2_demo_rcs.sib4sport___colfb; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.sib4sport___colfb IS 'Played college football';


--
-- Name: COLUMN q2_demo_rcs.sib4sport___oth; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.sib4sport___oth IS 'Other';


--
-- Name: COLUMN q2_demo_rcs.sib4sportoth; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.sib4sportoth IS 'Please specify:';


--
-- Name: COLUMN q2_demo_rcs.sib5age; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.sib5age IS 'Current age:';


--
-- Name: COLUMN q2_demo_rcs.sib5ht_feet; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.sib5ht_feet IS 'Height (feet):';


--
-- Name: COLUMN q2_demo_rcs.sib5ht_inch; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.sib5ht_inch IS 'Height (inches):';


--
-- Name: COLUMN q2_demo_rcs.sib5sport___none; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.sib5sport___none IS 'Did not play sports';


--
-- Name: COLUMN q2_demo_rcs.sib5sport___hsfb; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.sib5sport___hsfb IS 'Played H.S. football';


--
-- Name: COLUMN q2_demo_rcs.sib5sport___colfb; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.sib5sport___colfb IS 'Played college football';


--
-- Name: COLUMN q2_demo_rcs.sib5sport___oth; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.sib5sport___oth IS 'Other';


--
-- Name: COLUMN q2_demo_rcs.sib5sport_oth; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.sib5sport_oth IS 'Please specify:';


--
-- Name: COLUMN q2_demo_rcs.pedcaff___noans; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pedcaff___noans IS 'Prefer not
 to answer';


--
-- Name: COLUMN q2_demo_rcs.pedcaff___no; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pedcaff___no IS 'No';


--
-- Name: COLUMN q2_demo_rcs.pedcaff___fb; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pedcaff___fb IS 'Yes, during
active play';


--
-- Name: COLUMN q2_demo_rcs.pedcaff___cur; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pedcaff___cur IS 'Yes,
currently';


--
-- Name: COLUMN q2_demo_rcs.pededrink___noans; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pededrink___noans IS 'Prefer not
 to answer';


--
-- Name: COLUMN q2_demo_rcs.pededrink___no; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pededrink___no IS 'No';


--
-- Name: COLUMN q2_demo_rcs.pededrink___fb; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pededrink___fb IS 'Yes, during
active play';


--
-- Name: COLUMN q2_demo_rcs.pededrink___cur; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pededrink___cur IS 'Yes,
currently';


--
-- Name: COLUMN q2_demo_rcs.pedcreat___noans; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pedcreat___noans IS 'Prefer not
 to answer';


--
-- Name: COLUMN q2_demo_rcs.pedcreat___no; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pedcreat___no IS 'No';


--
-- Name: COLUMN q2_demo_rcs.pedcreat___fb; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pedcreat___fb IS 'Yes, during
active play';


--
-- Name: COLUMN q2_demo_rcs.pedcreat___cur; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pedcreat___cur IS 'Yes,
currently';


--
-- Name: COLUMN q2_demo_rcs.pedsteroid___noans; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pedsteroid___noans IS 'Prefer not
 to answer';


--
-- Name: COLUMN q2_demo_rcs.pedsteroid___no; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pedsteroid___no IS 'No';


--
-- Name: COLUMN q2_demo_rcs.pedsteroid___fb; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pedsteroid___fb IS 'Yes, during
active play';


--
-- Name: COLUMN q2_demo_rcs.pedsteroid___cur; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pedsteroid___cur IS 'Yes,
currently';


--
-- Name: COLUMN q2_demo_rcs.pedgh___noans; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pedgh___noans IS 'Prefer not
 to answer';


--
-- Name: COLUMN q2_demo_rcs.pedgh___no; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pedgh___no IS 'No';


--
-- Name: COLUMN q2_demo_rcs.pedgh___fb; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pedgh___fb IS 'Yes, during
active play';


--
-- Name: COLUMN q2_demo_rcs.pedgh___cur; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pedgh___cur IS 'Yes,
currently';


--
-- Name: COLUMN q2_demo_rcs.pedephed___noans; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pedephed___noans IS 'Prefer not
 to answer';


--
-- Name: COLUMN q2_demo_rcs.pedephed___no; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pedephed___no IS 'No';


--
-- Name: COLUMN q2_demo_rcs.pedephed___fb; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pedephed___fb IS 'Yes, during
active play';


--
-- Name: COLUMN q2_demo_rcs.pedephed___cur; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pedephed___cur IS 'Yes,
currently';


--
-- Name: COLUMN q2_demo_rcs.pedbetahy___noans; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pedbetahy___noans IS 'Prefer not
 to answer';


--
-- Name: COLUMN q2_demo_rcs.pedbetahy___no; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pedbetahy___no IS 'No';


--
-- Name: COLUMN q2_demo_rcs.pedbetahy___fb; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pedbetahy___fb IS 'Yes, during
active play';


--
-- Name: COLUMN q2_demo_rcs.pedbetahy___cur; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pedbetahy___cur IS 'Yes,
currently';


--
-- Name: COLUMN q2_demo_rcs.pednoncaf___noans; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pednoncaf___noans IS 'Prefer not
 to answer';


--
-- Name: COLUMN q2_demo_rcs.pednoncaf___no; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pednoncaf___no IS 'No';


--
-- Name: COLUMN q2_demo_rcs.pednoncaf___fb; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pednoncaf___fb IS 'Yes, during
active play';


--
-- Name: COLUMN q2_demo_rcs.pednoncaf___cur; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pednoncaf___cur IS 'Yes,
currently';


--
-- Name: COLUMN q2_demo_rcs.pedrcell___noans; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pedrcell___noans IS 'Prefer not
 to answer';


--
-- Name: COLUMN q2_demo_rcs.pedrcell___no; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pedrcell___no IS 'No';


--
-- Name: COLUMN q2_demo_rcs.pedrcell___fb; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pedrcell___fb IS 'Yes, during
active play';


--
-- Name: COLUMN q2_demo_rcs.pedrcell___cur; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pedrcell___cur IS 'Yes,
currently';


--
-- Name: COLUMN q2_demo_rcs.pedinos___noans; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pedinos___noans IS 'Prefer not
 to answer';


--
-- Name: COLUMN q2_demo_rcs.pedinos___no; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pedinos___no IS 'No';


--
-- Name: COLUMN q2_demo_rcs.pedinos___fb; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pedinos___fb IS 'Yes, during
active play';


--
-- Name: COLUMN q2_demo_rcs.pedinos___cur; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pedinos___cur IS 'Yes,
currently';


--
-- Name: COLUMN q2_demo_rcs.alcohol_days; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.alcohol_days IS 'In a typical week, how many days do you drink a beverage containing alcohol?';


--
-- Name: COLUMN q2_demo_rcs.alcohol_drinks; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.alcohol_drinks IS 'On a typical day that you drink, how many alcoholic beverages do you usually have?';


--
-- Name: COLUMN q2_demo_rcs.marijuana; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.marijuana IS 'Do you smoke or ingest marijuana?';


--
-- Name: COLUMN q2_demo_rcs.marijuana_start; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.marijuana_start IS 'How old were you when you started smoking marijuana?';


--
-- Name: COLUMN q2_demo_rcs.marijuana_stop; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.marijuana_stop IS 'How old were you when you stopped smoking marijuana?';


--
-- Name: COLUMN q2_demo_rcs.marijuana_totyrs; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.marijuana_totyrs IS 'How many years, in total, have you smoked marijuana? (if you quit more than once, estimate the total years you considered yourself an active smoker)';


--
-- Name: COLUMN q2_demo_rcs.marijtime___pnfl; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.marijtime___pnfl IS 'Before playing in the NFL';


--
-- Name: COLUMN q2_demo_rcs.marijtime___dnfl; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.marijtime___dnfl IS 'While playing in the NFL';


--
-- Name: COLUMN q2_demo_rcs.marijtime___anfl; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.marijtime___anfl IS 'After playing in the NFL';


--
-- Name: COLUMN q2_demo_rcs.marijreas___fun; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.marijreas___fun IS 'Fun';


--
-- Name: COLUMN q2_demo_rcs.marijreas___relx; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.marijreas___relx IS 'Relaxation';


--
-- Name: COLUMN q2_demo_rcs.marijreas___pain; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.marijreas___pain IS 'Pain';


--
-- Name: COLUMN q2_demo_rcs.marijreas___anx; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.marijreas___anx IS 'Anxiety';


--
-- Name: COLUMN q2_demo_rcs.marijreas___dep; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.marijreas___dep IS 'Depression';


--
-- Name: COLUMN q2_demo_rcs.marijreas___oth; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.marijreas___oth IS 'Other';


--
-- Name: COLUMN q2_demo_rcs.marijreas_exp; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.marijreas_exp IS 'If \"Other\" reason, please explain:';


--
-- Name: COLUMN q2_demo_rcs.born_address; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.born_address IS 'Address:';


--
-- Name: COLUMN q2_demo_rcs.born_city; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.born_city IS 'City:';


--
-- Name: COLUMN q2_demo_rcs.born_state; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.born_state IS 'State:';


--
-- Name: COLUMN q2_demo_rcs.born_zip; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.born_zip IS 'Zip code (if known)';


--
-- Name: COLUMN q2_demo_rcs.twelveyrs_address; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.twelveyrs_address IS 'Address:';


--
-- Name: COLUMN q2_demo_rcs.twelveyrs_city; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.twelveyrs_city IS 'City:';


--
-- Name: COLUMN q2_demo_rcs.twelveyrs_state; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.twelveyrs_state IS 'State:';


--
-- Name: COLUMN q2_demo_rcs.twelveyrs_zip; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.twelveyrs_zip IS 'Zip code (if known)';


--
-- Name: COLUMN q2_demo_rcs.infertility; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.infertility IS 'Have you and a female spouse or partner ever tried to become pregnant for 12 consecutive months without becoming pregnant (even if she ultimately became pregnant)?';


--
-- Name: COLUMN q2_demo_rcs.infert_age; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.infert_age IS 'How old were you when this first happened?';


--
-- Name: COLUMN q2_demo_rcs.infert_hcp; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.infert_hcp IS 'Did you seek help from a healthcare provider?';


--
-- Name: COLUMN q2_demo_rcs.infertreas___fem; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.infertreas___fem IS 'Female factor';


--
-- Name: COLUMN q2_demo_rcs.infertreas___mal; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.infertreas___mal IS 'Male factor';


--
-- Name: COLUMN q2_demo_rcs.infertreas___unex; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.infertreas___unex IS 'Unexplained';


--
-- Name: COLUMN q2_demo_rcs.infertreas___oth; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.infertreas___oth IS 'Other';


--
-- Name: COLUMN q2_demo_rcs.infertreas_oth; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.infertreas_oth IS 'If "Other", please explain:';


--
-- Name: COLUMN q2_demo_rcs.actout_dreams; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.actout_dreams IS 'Has your spouse \[or sleep partner\] told you that you appear to \''act out your dreams\'' while sleeping \[punched or flailed arms in the air, shouted, screamed\], which has occurred at least three times?';


--
-- Name: COLUMN q2_demo_rcs.smell_problem; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.smell_problem IS 'Have you had any problems with your sense of smell, such as not being able to smell things or things not smelling the way they are supposed to for at least three months?';


--
-- Name: COLUMN q2_demo_rcs.taste_problem; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.taste_problem IS 'Have you had any problems with your sense of taste, such as not being able to taste salt or sugar or with tastes in the mouth that shouldn\''t be there, like bitter, salty, sour, or sweet tastes for at least three months?';


--
-- Name: COLUMN q2_demo_rcs.bowel_move; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.bowel_move IS 'How frequently do you have a bowel movement?';


--
-- Name: COLUMN q2_demo_rcs.laxative_use; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.laxative_use IS 'How often do you use a laxative? (Such as softeners, bulking agents, fiber supplements, or suppositories)';


--
-- Name: COLUMN q2_demo_rcs.workplace_harass; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.workplace_harass IS 'Was there a period of time when you frequently experienced any of the following from teammates, coaches or trainers: social isolation, threats or other actions aimed at harassing you?';


--
-- Name: COLUMN q2_demo_rcs.coach_discrim; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.coach_discrim IS 'How many times were you treated unfairly by COACHES OR TRAINERS because of your race or ethnicity?';


--
-- Name: COLUMN q2_demo_rcs.coach_discrimstr; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.coach_discrimstr IS 'How stressful was this for you?';


--
-- Name: COLUMN q2_demo_rcs.player_discrim; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.player_discrim IS 'How many times were you treated unfairly by OTHER PLAYERS because of your race or ethnicity?';


--
-- Name: COLUMN q2_demo_rcs.player_discrimstr; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.player_discrimstr IS 'How stressful was this for you?';


--
-- Name: COLUMN q2_demo_rcs.job_discrim; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.job_discrim IS 'How many times were you treated unfairly in being hired for a job or promoted because of your race or ethnicity?';


--
-- Name: COLUMN q2_demo_rcs.job_discrimstr; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.job_discrimstr IS 'How stressful was this for you?';


--
-- Name: COLUMN q2_demo_rcs.ace1; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.ace1 IS 'Did a parent or other adult in the household often or very often...  
  
*Swear at you, insult you, put you down, or humiliate you?* or *Act in a way that made you afraid that you might be physically hurt*?';


--
-- Name: COLUMN q2_demo_rcs.ace2; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.ace2 IS 'Did a parent or other adult in the household often or very often...  
  
*Push, grab, slap, or throw something at you?* or  Ever hit you so hard that you had marks or were injured?';


--
-- Name: COLUMN q2_demo_rcs.ace3; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.ace3 IS 'Did an adult or person at least 5 years older than you ever...  
  
*Touch or fondle you or have you touch their body in a sexual way?* or Attempt or actually have oral, anal, or vaginal intercourse with you?';


--
-- Name: COLUMN q2_demo_rcs.ace4; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.ace4 IS 'Did you often or very often feel that...  
  
*No one in your family loved you or thought you were important or special?* or *Your family didn\''t look out for each other, feel close to each other, or support each other?*';


--
-- Name: COLUMN q2_demo_rcs.ace5; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.ace5 IS 'Did you often or very often feel that...  
  
*You didn\''t have enough to eat, had to wear dirty clothes, and had no one to protect you?* or Your parents were too drunk or high to take care of you or take you to the doctor if you needed it?';


--
-- Name: COLUMN q2_demo_rcs.ace6; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.ace6 IS 'Were your parents ever separated or divorced?';


--
-- Name: COLUMN q2_demo_rcs.ace7; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.ace7 IS 'Was your mother or stepmother:  
  
*Often or very often pushed, grabbed, slapped, or had something thrown at her?* or *Sometimes, often, or very often kicked, bitten, hit with a fist, or hit with something hard?* or *Ever repeatedly hit over at least a few minutes or threatened with a gun or knife?*';


--
-- Name: COLUMN q2_demo_rcs.ace8; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.ace8 IS 'Did you live with anyone who was a problem drinker or alcoholic, or who used street drugs?';


--
-- Name: COLUMN q2_demo_rcs.ace9; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.ace9 IS 'Was a household member depressed or mentally ill, or did a household member attempt suicide?';


--
-- Name: COLUMN q2_demo_rcs.ace10; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.ace10 IS 'Did a household member go to prison?';


--
-- Name: COLUMN q2_demo_rcs.foodins_worry; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.foodins_worry IS 'I worried whether our food would run out before we got money to buy more';


--
-- Name: COLUMN q2_demo_rcs.foodins_ranout; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.foodins_ranout IS 'The food my family bought just didn\''t last and we didn\''t have money to get more';


--
-- Name: COLUMN q2_demo_rcs.q2help; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.q2help IS 'Did someone help you fill out the questionnaire?';


--
-- Name: COLUMN q2_demo_rcs.othealth___complete; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.othealth___complete IS 'Check this box and press "Submit" to complete the questionnaire!';


--
-- Name: COLUMN q2_demo_rcs.sdfsdaf___0; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.sdfsdaf___0 IS 'Very Poor';


--
-- Name: COLUMN q2_demo_rcs.sdfsdaf___1; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.sdfsdaf___1 IS 'Average';


--
-- Name: COLUMN q2_demo_rcs.sdfsdaf___2; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.sdfsdaf___2 IS 'Excellent';


--
-- Name: COLUMN q2_demo_rcs.rtyrtyrt___0; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.rtyrtyrt___0 IS 'Very Poor';


--
-- Name: COLUMN q2_demo_rcs.rtyrtyrt___1; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.rtyrtyrt___1 IS 'Average';


--
-- Name: COLUMN q2_demo_rcs.rtyrtyrt___2; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.rtyrtyrt___2 IS 'Excellent';


--
-- Name: COLUMN q2_demo_rcs.test_field; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.test_field IS 'Hello';


--
-- Name: COLUMN q2_demo_rcs.test_phone; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.test_phone IS 'test phone';


--
-- Name: COLUMN q2_demo_rcs.i57; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.i57 IS 'Integer (0-57)';


--
-- Name: COLUMN q2_demo_rcs.f57; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.f57 IS 'Float (0-57)';


--
-- Name: COLUMN q2_demo_rcs.dd; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.dd IS 'dd';


--
-- Name: COLUMN q2_demo_rcs.yes_or_no; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.yes_or_no IS 'Yes or now';


--
-- Name: COLUMN q2_demo_rcs.true_or_false; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.true_or_false IS 'True or false';


--
-- Name: COLUMN q2_demo_rcs.file1; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.file1 IS 'File upload';


--
-- Name: COLUMN q2_demo_rcs.signature; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.signature IS 'Signature';


--
-- Name: COLUMN q2_demo_rcs.slider; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.slider IS 'Slider';


--
-- Name: COLUMN q2_demo_rcs.base_field; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.base_field IS 'Base Field';


--
-- Name: COLUMN q2_demo_rcs.smoketime_chosen_array; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.smoketime_chosen_array IS 'Please indicate the time-frames during which you smoked cigarettes? (Please select all that apply)';


--
-- Name: COLUMN q2_demo_rcs.othleaguenm_chosen_array; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.othleaguenm_chosen_array IS 'Indicate the professional, non-NFL, league(s) for which you have played. Please mark all that apply:';


--
-- Name: COLUMN q2_demo_rcs.leftfb_chosen_array; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.leftfb_chosen_array IS 'Please indicate the main reason(s) why you stopped playing professional football? Select all that apply.';


--
-- Name: COLUMN q2_demo_rcs.bpi2_chosen_array; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.bpi2_chosen_array IS 'Please indicate the areas where you feel pain. (Select all that apply)';


--
-- Name: COLUMN q2_demo_rcs.bpi7_chosen_array; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.bpi7_chosen_array IS 'What treatments or medications are you receiving for your pain? (Please select all that apply)';


--
-- Name: COLUMN q2_demo_rcs.wealth_emerg_chosen_array; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.wealth_emerg_chosen_array IS 'Based on your current financial situation, how would you pay for this
expense? If you would use more than one method to cover this expense,
please select all that apply.';


--
-- Name: COLUMN q2_demo_rcs.famhxmoth_chosen_array; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.famhxmoth_chosen_array IS 'Mother';


--
-- Name: COLUMN q2_demo_rcs.famhxfsib_chosen_array; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.famhxfsib_chosen_array IS 'Female Sibling';


--
-- Name: COLUMN q2_demo_rcs.famhxfath_chosen_array; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.famhxfath_chosen_array IS 'Father';


--
-- Name: COLUMN q2_demo_rcs.famhxmsib_chosen_array; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.famhxmsib_chosen_array IS 'Male Sibling';


--
-- Name: COLUMN q2_demo_rcs.sib4sport_chosen_array; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.sib4sport_chosen_array IS 'Select all that apply:';


--
-- Name: COLUMN q2_demo_rcs.sib5sport_chosen_array; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.sib5sport_chosen_array IS 'Select all that apply:';


--
-- Name: COLUMN q2_demo_rcs.pedcaff_chosen_array; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pedcaff_chosen_array IS 'Caffeine (Commonly found in soda, coffee, and tea. Also found in supplements like No Doz, Stay Awake, Vivarin, Cafcit, Enerjets, etc.)';


--
-- Name: COLUMN q2_demo_rcs.pededrink_chosen_array; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pededrink_chosen_array IS 'Energy drinks (**aka:** Red Bull, Monster, 5-Hour Energy, AMP Energy, Full Throttle, Jolt, Liquid X, mountain dew MDX, Red Rooster, Rockstar, RELOAD, SoBe Adrenaline Rush, Vault, XS energy drink, etc.)';


--
-- Name: COLUMN q2_demo_rcs.pedcreat_chosen_array; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pedcreat_chosen_array IS 'Creatine (**aka:** creatine phosphate, creatine monohydrate, CreaPure, legal steroid, muscle candy, etc.)';


--
-- Name: COLUMN q2_demo_rcs.pedsteroid_chosen_array; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pedsteroid_chosen_array IS 'Steroids (**aka:** anabolic steroids, testosterone, androstenedione, dihydroepiandrosterone, DHEA, Arnolds, gym candy, pumpers, roids, stackers, weight trainers, gear, and juice)';


--
-- Name: COLUMN q2_demo_rcs.pedgh_chosen_array; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pedgh_chosen_array IS 'Growth hormone or insulin-like growth factor (**aka:** human growth hormone, insulin-like growth factor-1, insulin-like growth factor, IGF, IGF-1, Genotropin, Humatrope, Norditropin, Nutropin, Saizen, Serostim)';


--
-- Name: COLUMN q2_demo_rcs.pedephed_chosen_array; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pedephed_chosen_array IS 'Ephedra (**aka:** ephedrine, Ma Huang, desert tea, Mormon tea, American ephedra, European ephedra, Pakistani ephedra, ephedrine, ephedrine alkaloids, pseudoephedrine)';


--
-- Name: COLUMN q2_demo_rcs.pedbetahy_chosen_array; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pedbetahy_chosen_array IS 'Beta-hydroxy beta-methylbutyrate (**aka:** HMB, beta-hydroxy, beta-methylbutyrate, beta-hydroxy, beta-methylbutyric acid)';


--
-- Name: COLUMN q2_demo_rcs.pednoncaf_chosen_array; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pednoncaf_chosen_array IS 'Non-caffeine stimulants (**aka:** amphetamine, dextroamphetamine (Adderall), methylphenidate (Ritalin))';


--
-- Name: COLUMN q2_demo_rcs.pedrcell_chosen_array; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pedrcell_chosen_array IS 'Red-cell boosting agents or techniques (**aka:** Erythropoeitin (EPO), auto-transfusion, hypoxic sleep tents)';


--
-- Name: COLUMN q2_demo_rcs.pedinos_chosen_array; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.pedinos_chosen_array IS 'Other cardiovascular enhancement agent (**aka:** inosine or inosine-containing products)';


--
-- Name: COLUMN q2_demo_rcs.marijtime_chosen_array; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.marijtime_chosen_array IS 'Please indicate the time-frames during which you smoked marijuana (select all that apply):';


--
-- Name: COLUMN q2_demo_rcs.marijreas_chosen_array; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.marijreas_chosen_array IS 'Please indicate the reasons why you use, or have previously used, marijuana (select all that apply):';


--
-- Name: COLUMN q2_demo_rcs.infertreas_chosen_array; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.infertreas_chosen_array IS 'Did he or she find a reason why you and your female spouse or partner
had difficulty getting pregnant? Please choose all that apply:';


--
-- Name: COLUMN q2_demo_rcs.sdfsdaf_chosen_array; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.sdfsdaf_chosen_array IS 'sdfsdaf';


--
-- Name: COLUMN q2_demo_rcs.rtyrtyrt_chosen_array; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.q2_demo_rcs.rtyrtyrt_chosen_array IS 'rtyrtyrt';


--
-- Name: q2_demo_rcs_id_seq; Type: SEQUENCE; Schema: redcap; Owner: -
--

CREATE SEQUENCE redcap.q2_demo_rcs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: q2_demo_rcs_id_seq; Type: SEQUENCE OWNED BY; Schema: redcap; Owner: -
--

ALTER SEQUENCE redcap.q2_demo_rcs_id_seq OWNED BY redcap.q2_demo_rcs.id;


--
-- Name: viva_meta_variable_history; Type: TABLE; Schema: redcap; Owner: -
--

CREATE TABLE redcap.viva_meta_variable_history (
    id bigint NOT NULL,
    varname character varying,
    var_label character varying,
    var_type character varying,
    restrict_var___0 boolean,
    restrict_var___1 boolean,
    restrict_var___2 boolean,
    restrict_var___3 boolean,
    restrict_var___4 boolean,
    oth_restrict character varying,
    domain_viva character varying,
    subdomain___1 boolean,
    subdomain___2 boolean,
    target_of_q character varying,
    data_source character varying,
    val_instr character varying,
    ext_instrument character varying,
    internal_instrument character varying,
    doc_yn character varying,
    doc_link character varying,
    long_yn character varying,
    long_timepts___1 boolean,
    long_timepts___2 boolean,
    long_timepts___3 boolean,
    long_timepts___4 boolean,
    long_timepts___5 boolean,
    long_timepts___6 boolean,
    long_timepts___7 boolean,
    long_timepts___8 boolean,
    long_timepts___9 boolean,
    long_timepts___10 boolean,
    long_timepts___11 boolean,
    long_timepts___12 boolean,
    long_timepts___13 boolean,
    long_timepts___14 boolean,
    long_timepts___15 boolean,
    long_timepts___16 boolean,
    long_timepts___17 boolean,
    long_timepts___18 boolean,
    long_timepts___19 boolean,
    long_timepts___20 boolean,
    long_timepts___21 boolean,
    long_timepts___22 boolean,
    long_timepts___23 boolean,
    static_variable_information_complete integer,
    static_variable_information_timestamp timestamp without time zone,
    event_type character varying,
    visit_name character varying,
    visit_time character varying,
    assay_specimen character varying,
    assay_type character varying,
    lab_assay_dataset character varying,
    form_label_ep character varying,
    form_version_ep___1 boolean,
    form_version_ep___2 boolean,
    form_version_ep___3 boolean,
    form_version_ep___4 boolean,
    form_version_ep___5 boolean,
    form_version_ep___6 boolean,
    form_version_ep___7 boolean,
    form_version_ep___8 boolean,
    form_label_mp character varying,
    form_version_mp___1 boolean,
    form_version_mp___2 boolean,
    form_version_mp___3 boolean,
    form_version_mp___4 boolean,
    form_label_del character varying,
    form_version_del___1 boolean,
    form_version_del___2 boolean,
    form_version_del___3 boolean,
    form_version_del___4 boolean,
    form_version_del___5 boolean,
    form_version_del___6 boolean,
    form_version_del___7 boolean,
    form_label_6m character varying,
    form_version_6m___1 boolean,
    form_version_6m___2 boolean,
    form_version_6m___3 boolean,
    form_version_6m___4 boolean,
    form_version_6m___5 boolean,
    form_version_6m___6 boolean,
    form_version_6m___7 boolean,
    form_version_6m___8 boolean,
    form_version_6m___9 boolean,
    form_version_6m___10 boolean,
    form_label_1y character varying,
    form_version_1y___1 boolean,
    form_label_2y character varying,
    form_version_2y___1 boolean,
    form_label_3y character varying,
    form_version_3y___1 boolean,
    form_version_3y___2 boolean,
    form_version_3y___3 boolean,
    form_version_3y___4 boolean,
    form_version_3y___5 boolean,
    form_version_3y___6 boolean,
    form_version_3y___7 boolean,
    form_version_3y___8 boolean,
    form_version_3y___9 boolean,
    form_version_3y___10 boolean,
    form_version_3y___11 boolean,
    form_version_3y___12 boolean,
    form_version_3y___13 boolean,
    form_version_3y___14 boolean,
    form_label_4y character varying,
    form_version_4y___1 boolean,
    form_label_5y character varying,
    form_version_5y___1 boolean,
    form_label_6y character varying,
    form_version_6y___1 boolean,
    form_label_7y character varying,
    form_version_7y___1 boolean,
    form_version_7y___2 boolean,
    form_version_7y___3 boolean,
    form_version_7y___4 boolean,
    form_version_7y___5 boolean,
    form_version_7y___6 boolean,
    form_version_7y___7 boolean,
    form_version_7y___8 boolean,
    form_version_7y___9 boolean,
    form_version_7y___10 boolean,
    form_version_7y___11 boolean,
    form_version_7y___12 boolean,
    form_version_7y___13 boolean,
    form_version_7y___14 boolean,
    form_version_7y___15 boolean,
    form_version_7y___16 boolean,
    form_version_7y___17 boolean,
    form_label_8y character varying,
    form_version_8y___1 boolean,
    form_label_9y character varying,
    form_version_9y___1 boolean,
    form_version_9y___2 boolean,
    form_label_10y character varying,
    form_version_10y___1 boolean,
    form_version_10y___2 boolean,
    form_label_11y character varying,
    form_version_11y___1 boolean,
    form_version_11y___2 boolean,
    form_label_12y character varying,
    form_version_12y___1 boolean,
    form_version_12y___2 boolean,
    form_version_12y___3 boolean,
    form_version_12y___4 boolean,
    form_version_12y___5 boolean,
    form_version_12y___6 boolean,
    form_version_12y___7 boolean,
    form_version_12y___8 boolean,
    form_version_12y___9 boolean,
    form_version_12y___10 boolean,
    form_version_12y___11 boolean,
    form_version_12y___12 boolean,
    form_version_12y___13 boolean,
    form_version_12y___14 boolean,
    form_version_12y___15 boolean,
    form_version_12y___16 boolean,
    form_label_14y character varying,
    form_version_14y___1 boolean,
    form_version_14y___2 boolean,
    form_label_15y character varying,
    form_version_15y___1 boolean,
    form_version_15y___2 boolean,
    form_label_16y character varying,
    form_version_16y___1 boolean,
    form_version_16y___2 boolean,
    form_label_mt character varying,
    form_version_mt character varying,
    form_label_19y character varying,
    form_version_19y___1 boolean,
    form_version_19y___2 boolean,
    not_time_specific character varying,
    var_level character varying,
    units character varying,
    model_type character varying,
    response_options character varying,
    elig_sample character varying,
    elig_n character varying,
    actual_n character varying,
    an_var character varying,
    orig_deriv character varying,
    corr_derived_yn___0 boolean,
    corr_derived_yn___1 boolean,
    der_varname character varying,
    dervar_explain character varying,
    orig_varnames character varying,
    visitspecific_information_complete integer,
    visitspecific_information_timestamp timestamp without time zone,
    redcap_survey_identifier character varying,
    user_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    viva_meta_variable_id bigint,
    redcap_repeat_instrument character varying,
    redcap_repeat_instance character varying
);


--
-- Name: COLUMN viva_meta_variable_history.varname; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.varname IS 'Variable name';


--
-- Name: COLUMN viva_meta_variable_history.var_label; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.var_label IS 'Variable label';


--
-- Name: COLUMN viva_meta_variable_history.var_type; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.var_type IS 'Type of variable';


--
-- Name: COLUMN viva_meta_variable_history.restrict_var___0; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.restrict_var___0 IS 'None';


--
-- Name: COLUMN viva_meta_variable_history.restrict_var___1; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.restrict_var___1 IS 'PHI, OK for limited dataset';


--
-- Name: COLUMN viva_meta_variable_history.restrict_var___2; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.restrict_var___2 IS 'PHI, restricted use';


--
-- Name: COLUMN viva_meta_variable_history.restrict_var___3; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.restrict_var___3 IS 'Sensitive information';


--
-- Name: COLUMN viva_meta_variable_history.restrict_var___4; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.restrict_var___4 IS 'Other restriction';


--
-- Name: COLUMN viva_meta_variable_history.oth_restrict; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.oth_restrict IS 'Specify other restriction';


--
-- Name: COLUMN viva_meta_variable_history.domain_viva; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.domain_viva IS 'Domain or topic area';


--
-- Name: COLUMN viva_meta_variable_history.subdomain___1; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.subdomain___1 IS 'Placeholder';


--
-- Name: COLUMN viva_meta_variable_history.subdomain___2; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.subdomain___2 IS 'Placeholder';


--
-- Name: COLUMN viva_meta_variable_history.target_of_q; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.target_of_q IS 'Target';


--
-- Name: COLUMN viva_meta_variable_history.data_source; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.data_source IS 'Source of data';


--
-- Name: COLUMN viva_meta_variable_history.val_instr; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.val_instr IS 'Please indicate whether the question comes from an external, internal, or no instrument.';


--
-- Name: COLUMN viva_meta_variable_history.ext_instrument; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.ext_instrument IS 'External instrument';


--
-- Name: COLUMN viva_meta_variable_history.internal_instrument; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.internal_instrument IS 'Internal instrument';


--
-- Name: COLUMN viva_meta_variable_history.doc_yn; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.doc_yn IS 'Documentation available?';


--
-- Name: COLUMN viva_meta_variable_history.doc_link; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.doc_link IS 'Documentation link';


--
-- Name: COLUMN viva_meta_variable_history.long_yn; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.long_yn IS 'Longitudinal measurement?';


--
-- Name: COLUMN viva_meta_variable_history.long_timepts___1; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.long_timepts___1 IS 'Screening';


--
-- Name: COLUMN viva_meta_variable_history.long_timepts___2; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.long_timepts___2 IS 'Early pregnancy';


--
-- Name: COLUMN viva_meta_variable_history.long_timepts___3; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.long_timepts___3 IS 'Mid-pregnancy';


--
-- Name: COLUMN viva_meta_variable_history.long_timepts___4; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.long_timepts___4 IS 'Delivery';


--
-- Name: COLUMN viva_meta_variable_history.long_timepts___5; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.long_timepts___5 IS 'Infancy (6 months)';


--
-- Name: COLUMN viva_meta_variable_history.long_timepts___6; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.long_timepts___6 IS '1 year';


--
-- Name: COLUMN viva_meta_variable_history.long_timepts___7; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.long_timepts___7 IS '2 year';


--
-- Name: COLUMN viva_meta_variable_history.long_timepts___8; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.long_timepts___8 IS 'Early childhood (3 year)';


--
-- Name: COLUMN viva_meta_variable_history.long_timepts___9; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.long_timepts___9 IS '4 year';


--
-- Name: COLUMN viva_meta_variable_history.long_timepts___10; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.long_timepts___10 IS '5 year';


--
-- Name: COLUMN viva_meta_variable_history.long_timepts___11; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.long_timepts___11 IS '6 year';


--
-- Name: COLUMN viva_meta_variable_history.long_timepts___12; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.long_timepts___12 IS 'Mid childhood (7-8 years)';


--
-- Name: COLUMN viva_meta_variable_history.long_timepts___13; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.long_timepts___13 IS '8 year';


--
-- Name: COLUMN viva_meta_variable_history.long_timepts___14; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.long_timepts___14 IS '9 year';


--
-- Name: COLUMN viva_meta_variable_history.long_timepts___15; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.long_timepts___15 IS '10 year';


--
-- Name: COLUMN viva_meta_variable_history.long_timepts___16; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.long_timepts___16 IS '11 year';


--
-- Name: COLUMN viva_meta_variable_history.long_timepts___17; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.long_timepts___17 IS 'Early adolescence (12-13 years)';


--
-- Name: COLUMN viva_meta_variable_history.long_timepts___18; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.long_timepts___18 IS '14 years';


--
-- Name: COLUMN viva_meta_variable_history.long_timepts___19; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.long_timepts___19 IS '15 year';


--
-- Name: COLUMN viva_meta_variable_history.long_timepts___20; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.long_timepts___20 IS '16 year';


--
-- Name: COLUMN viva_meta_variable_history.long_timepts___21; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.long_timepts___21 IS 'Mid/late adolescence (17-18 years)';


--
-- Name: COLUMN viva_meta_variable_history.long_timepts___22; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.long_timepts___22 IS '19 year';


--
-- Name: COLUMN viva_meta_variable_history.long_timepts___23; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.long_timepts___23 IS 'Not time specific';


--
-- Name: COLUMN viva_meta_variable_history.event_type; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.event_type IS 'Type of data collection event';


--
-- Name: COLUMN viva_meta_variable_history.visit_name; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.visit_name IS 'Visit name';


--
-- Name: COLUMN viva_meta_variable_history.visit_time; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.visit_time IS 'Visit target time point';


--
-- Name: COLUMN viva_meta_variable_history.assay_specimen; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.assay_specimen IS 'Lab Assay Specimen Source';


--
-- Name: COLUMN viva_meta_variable_history.assay_type; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.assay_type IS 'Laboratory assay type';


--
-- Name: COLUMN viva_meta_variable_history.lab_assay_dataset; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.lab_assay_dataset IS 'Laboratory Assay \''Form\'' (Dataset)';


--
-- Name: COLUMN viva_meta_variable_history.form_label_ep; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_label_ep IS 'Form Label';


--
-- Name: COLUMN viva_meta_variable_history.form_version_ep___1; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_ep___1 IS 'EPQ';


--
-- Name: COLUMN viva_meta_variable_history.form_version_ep___2; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_ep___2 IS 'EPQ1';


--
-- Name: COLUMN viva_meta_variable_history.form_version_ep___3; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_ep___3 IS 'EPQA';


--
-- Name: COLUMN viva_meta_variable_history.form_version_ep___4; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_ep___4 IS 'EPS1';


--
-- Name: COLUMN viva_meta_variable_history.form_version_ep___5; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_ep___5 IS 'EPI1';


--
-- Name: COLUMN viva_meta_variable_history.form_version_ep___6; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_ep___6 IS 'EPIA';


--
-- Name: COLUMN viva_meta_variable_history.form_version_ep___7; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_ep___7 IS 'SCR1';


--
-- Name: COLUMN viva_meta_variable_history.form_version_ep___8; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_ep___8 IS 'BLD1';


--
-- Name: COLUMN viva_meta_variable_history.form_label_mp; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_label_mp IS 'Form Label';


--
-- Name: COLUMN viva_meta_variable_history.form_version_mp___1; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_mp___1 IS 'MPQ2';


--
-- Name: COLUMN viva_meta_variable_history.form_version_mp___2; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_mp___2 IS 'BLD2';


--
-- Name: COLUMN viva_meta_variable_history.form_version_mp___3; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_mp___3 IS 'PSQ2';


--
-- Name: COLUMN viva_meta_variable_history.form_version_mp___4; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_mp___4 IS 'MPI2';


--
-- Name: COLUMN viva_meta_variable_history.form_label_del; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_label_del IS 'Form Label';


--
-- Name: COLUMN viva_meta_variable_history.form_version_del___1; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_del___1 IS 'DES3';


--
-- Name: COLUMN viva_meta_variable_history.form_version_del___2; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_del___2 IS 'NAN3';


--
-- Name: COLUMN viva_meta_variable_history.form_version_del___3; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_del___3 IS 'NBP3';


--
-- Name: COLUMN viva_meta_variable_history.form_version_del___4; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_del___4 IS 'NLG3';


--
-- Name: COLUMN viva_meta_variable_history.form_version_del___5; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_del___5 IS 'PSQ3';


--
-- Name: COLUMN viva_meta_variable_history.form_version_del___6; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_del___6 IS 'PSS3';


--
-- Name: COLUMN viva_meta_variable_history.form_version_del___7; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_del___7 IS 'DEI3';


--
-- Name: COLUMN viva_meta_variable_history.form_label_6m; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_label_6m IS 'Form Label';


--
-- Name: COLUMN viva_meta_variable_history.form_version_6m___1; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_6m___1 IS 'PSQ4';


--
-- Name: COLUMN viva_meta_variable_history.form_version_6m___2; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_6m___2 IS 'MSC4';


--
-- Name: COLUMN viva_meta_variable_history.form_version_6m___3; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_6m___3 IS 'VIS4';


--
-- Name: COLUMN viva_meta_variable_history.form_version_6m___4; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_6m___4 IS 'SMIR';


--
-- Name: COLUMN viva_meta_variable_history.form_version_6m___5; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_6m___5 IS 'SMSB4';


--
-- Name: COLUMN viva_meta_variable_history.form_version_6m___6; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_6m___6 IS 'SMSF4';


--
-- Name: COLUMN viva_meta_variable_history.form_version_6m___7; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_6m___7 IS 'SMSW4';


--
-- Name: COLUMN viva_meta_variable_history.form_version_6m___8; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_6m___8 IS 'SMSM4';


--
-- Name: COLUMN viva_meta_variable_history.form_version_6m___9; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_6m___9 IS 'SMQ4';


--
-- Name: COLUMN viva_meta_variable_history.form_version_6m___10; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_6m___10 IS 'MSM4';


--
-- Name: COLUMN viva_meta_variable_history.form_label_1y; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_label_1y IS 'Form Label';


--
-- Name: COLUMN viva_meta_variable_history.form_version_1y___1; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_1y___1 IS 'OYQ';


--
-- Name: COLUMN viva_meta_variable_history.form_label_2y; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_label_2y IS 'Form Label';


--
-- Name: COLUMN viva_meta_variable_history.form_version_2y___1; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_2y___1 IS 'SYQ/SYQ6';


--
-- Name: COLUMN viva_meta_variable_history.form_label_3y; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_label_3y IS 'Form Label';


--
-- Name: COLUMN viva_meta_variable_history.form_version_3y___1; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_3y___1 IS 'MAT7';


--
-- Name: COLUMN viva_meta_variable_history.form_version_3y___2; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_3y___2 IS 'CAT7';


--
-- Name: COLUMN viva_meta_variable_history.form_version_3y___3; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_3y___3 IS 'MBP7';


--
-- Name: COLUMN viva_meta_variable_history.form_version_3y___4; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_3y___4 IS 'CBP7';


--
-- Name: COLUMN viva_meta_variable_history.form_version_3y___5; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_3y___5 IS 'MBL7';


--
-- Name: COLUMN viva_meta_variable_history.form_version_3y___6; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_3y___6 IS 'CBL7';


--
-- Name: COLUMN viva_meta_variable_history.form_version_3y___7; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_3y___7 IS 'MCT7';


--
-- Name: COLUMN viva_meta_variable_history.form_version_3y___8; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_3y___8 IS 'CCT7';


--
-- Name: COLUMN viva_meta_variable_history.form_version_3y___9; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_3y___9 IS 'TYI';


--
-- Name: COLUMN viva_meta_variable_history.form_version_3y___10; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_3y___10 IS 'TYQ';


--
-- Name: COLUMN viva_meta_variable_history.form_version_3y___11; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_3y___11 IS 'TYS7';


--
-- Name: COLUMN viva_meta_variable_history.form_version_3y___12; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_3y___12 IS 'IBL7';


--
-- Name: COLUMN viva_meta_variable_history.form_version_3y___13; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_3y___13 IS 'IAC7';


--
-- Name: COLUMN viva_meta_variable_history.form_version_3y___14; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_3y___14 IS 'IDC7';


--
-- Name: COLUMN viva_meta_variable_history.form_label_4y; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_label_4y IS 'Form Label';


--
-- Name: COLUMN viva_meta_variable_history.form_version_4y___1; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_4y___1 IS '4YQ';


--
-- Name: COLUMN viva_meta_variable_history.form_label_5y; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_label_5y IS 'Form Label';


--
-- Name: COLUMN viva_meta_variable_history.form_version_5y___1; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_5y___1 IS 'QU5Y';


--
-- Name: COLUMN viva_meta_variable_history.form_label_6y; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_label_6y IS 'Form Label';


--
-- Name: COLUMN viva_meta_variable_history.form_version_6y___1; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_6y___1 IS 'QU6Y';


--
-- Name: COLUMN viva_meta_variable_history.form_label_7y; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_label_7y IS 'Form Label';


--
-- Name: COLUMN viva_meta_variable_history.form_version_7y___1; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_7y___1 IS 'MA7Y';


--
-- Name: COLUMN viva_meta_variable_history.form_version_7y___2; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_7y___2 IS 'CA7Y';


--
-- Name: COLUMN viva_meta_variable_history.form_version_7y___3; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_7y___3 IS 'BL7Y';


--
-- Name: COLUMN viva_meta_variable_history.form_version_7y___4; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_7y___4 IS 'PE7Y';


--
-- Name: COLUMN viva_meta_variable_history.form_version_7y___5; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_7y___5 IS 'HR7Y';


--
-- Name: COLUMN viva_meta_variable_history.form_version_7y___6; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_7y___6 IS 'DX7Y';


--
-- Name: COLUMN viva_meta_variable_history.form_version_7y___7; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_7y___7 IS 'BP7Y';


--
-- Name: COLUMN viva_meta_variable_history.form_version_7y___8; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_7y___8 IS 'MC7Y';


--
-- Name: COLUMN viva_meta_variable_history.form_version_7y___9; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_7y___9 IS 'CC7Y';


--
-- Name: COLUMN viva_meta_variable_history.form_version_7y___10; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_7y___10 IS 'SP7Y';


--
-- Name: COLUMN viva_meta_variable_history.form_version_7y___11; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_7y___11 IS 'BQ7Y';


--
-- Name: COLUMN viva_meta_variable_history.form_version_7y___12; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_7y___12 IS 'TE7Y';


--
-- Name: COLUMN viva_meta_variable_history.form_version_7y___13; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_7y___13 IS 'MI7Y';


--
-- Name: COLUMN viva_meta_variable_history.form_version_7y___14; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_7y___14 IS 'IN7Y';


--
-- Name: COLUMN viva_meta_variable_history.form_version_7y___15; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_7y___15 IS 'HP7Y';


--
-- Name: COLUMN viva_meta_variable_history.form_version_7y___16; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_7y___16 IS 'ST7Y';


--
-- Name: COLUMN viva_meta_variable_history.form_version_7y___17; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_7y___17 IS 'QU7Y';


--
-- Name: COLUMN viva_meta_variable_history.form_label_8y; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_label_8y IS 'Form Label';


--
-- Name: COLUMN viva_meta_variable_history.form_version_8y___1; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_8y___1 IS 'QU8Y';


--
-- Name: COLUMN viva_meta_variable_history.form_label_9y; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_label_9y IS 'Form Label';


--
-- Name: COLUMN viva_meta_variable_history.form_version_9y___1; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_9y___1 IS 'QU9Y';


--
-- Name: COLUMN viva_meta_variable_history.form_version_9y___2; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_9y___2 IS 'CQ9Y';


--
-- Name: COLUMN viva_meta_variable_history.form_label_10y; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_label_10y IS 'Form Label';


--
-- Name: COLUMN viva_meta_variable_history.form_version_10y___1; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_10y___1 IS 'QU10';


--
-- Name: COLUMN viva_meta_variable_history.form_version_10y___2; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_10y___2 IS 'CQ10';


--
-- Name: COLUMN viva_meta_variable_history.form_label_11y; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_label_11y IS 'Form Label';


--
-- Name: COLUMN viva_meta_variable_history.form_version_11y___1; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_11y___1 IS 'QU11';


--
-- Name: COLUMN viva_meta_variable_history.form_version_11y___2; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_11y___2 IS 'CQ11';


--
-- Name: COLUMN viva_meta_variable_history.form_label_12y; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_label_12y IS 'Form Label';


--
-- Name: COLUMN viva_meta_variable_history.form_version_12y___1; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_12y___1 IS 'MA12';


--
-- Name: COLUMN viva_meta_variable_history.form_version_12y___2; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_12y___2 IS 'CA12';


--
-- Name: COLUMN viva_meta_variable_history.form_version_12y___3; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_12y___3 IS 'SJ12';


--
-- Name: COLUMN viva_meta_variable_history.form_version_12y___4; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_12y___4 IS 'BL12';


--
-- Name: COLUMN viva_meta_variable_history.form_version_12y___5; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_12y___5 IS 'PE12';


--
-- Name: COLUMN viva_meta_variable_history.form_version_12y___6; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_12y___6 IS 'HR12';


--
-- Name: COLUMN viva_meta_variable_history.form_version_12y___7; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_12y___7 IS 'NS12';


--
-- Name: COLUMN viva_meta_variable_history.form_version_12y___8; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_12y___8 IS 'BP12';


--
-- Name: COLUMN viva_meta_variable_history.form_version_12y___9; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_12y___9 IS 'DX12';


--
-- Name: COLUMN viva_meta_variable_history.form_version_12y___10; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_12y___10 IS 'NO12';


--
-- Name: COLUMN viva_meta_variable_history.form_version_12y___11; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_12y___11 IS 'SP12';


--
-- Name: COLUMN viva_meta_variable_history.form_version_12y___12; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_12y___12 IS 'MI12';


--
-- Name: COLUMN viva_meta_variable_history.form_version_12y___13; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_12y___13 IS 'IN12';


--
-- Name: COLUMN viva_meta_variable_history.form_version_12y___14; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_12y___14 IS 'ST12';


--
-- Name: COLUMN viva_meta_variable_history.form_version_12y___15; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_12y___15 IS 'QU12';


--
-- Name: COLUMN viva_meta_variable_history.form_version_12y___16; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_12y___16 IS 'CQ12';


--
-- Name: COLUMN viva_meta_variable_history.form_label_14y; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_label_14y IS 'Form Label';


--
-- Name: COLUMN viva_meta_variable_history.form_version_14y___1; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_14y___1 IS 'QU14';


--
-- Name: COLUMN viva_meta_variable_history.form_version_14y___2; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_14y___2 IS 'CQ14';


--
-- Name: COLUMN viva_meta_variable_history.form_label_15y; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_label_15y IS 'Form Label';


--
-- Name: COLUMN viva_meta_variable_history.form_version_15y___1; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_15y___1 IS 'QU15';


--
-- Name: COLUMN viva_meta_variable_history.form_version_15y___2; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_15y___2 IS 'CQ15';


--
-- Name: COLUMN viva_meta_variable_history.form_label_16y; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_label_16y IS 'Form Label';


--
-- Name: COLUMN viva_meta_variable_history.form_version_16y___1; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_16y___1 IS 'QU16';


--
-- Name: COLUMN viva_meta_variable_history.form_version_16y___2; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_16y___2 IS 'CQ16';


--
-- Name: COLUMN viva_meta_variable_history.form_label_mt; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_label_mt IS 'Form Label';


--
-- Name: COLUMN viva_meta_variable_history.form_version_mt; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_mt IS 'Form Version';


--
-- Name: COLUMN viva_meta_variable_history.form_label_19y; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_label_19y IS 'Form Label';


--
-- Name: COLUMN viva_meta_variable_history.form_version_19y___1; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_19y___1 IS 'QU19';


--
-- Name: COLUMN viva_meta_variable_history.form_version_19y___2; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.form_version_19y___2 IS 'TQ19';


--
-- Name: COLUMN viva_meta_variable_history.not_time_specific; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.not_time_specific IS 'Not time specific';


--
-- Name: COLUMN viva_meta_variable_history.var_level; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.var_level IS 'Variable Level';


--
-- Name: COLUMN viva_meta_variable_history.units; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.units IS 'Units';


--
-- Name: COLUMN viva_meta_variable_history.model_type; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.model_type IS 'Model';


--
-- Name: COLUMN viva_meta_variable_history.response_options; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.response_options IS 'Response Options';


--
-- Name: COLUMN viva_meta_variable_history.elig_sample; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.elig_sample IS 'Eligible sample description';


--
-- Name: COLUMN viva_meta_variable_history.elig_n; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.elig_n IS 'Eligible sample N';


--
-- Name: COLUMN viva_meta_variable_history.actual_n; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.actual_n IS 'Actual sample N';


--
-- Name: COLUMN viva_meta_variable_history.an_var; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.an_var IS 'Analytic variable name';


--
-- Name: COLUMN viva_meta_variable_history.orig_deriv; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.orig_deriv IS 'Original or derived variable';


--
-- Name: COLUMN viva_meta_variable_history.corr_derived_yn___0; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.corr_derived_yn___0 IS 'No';


--
-- Name: COLUMN viva_meta_variable_history.corr_derived_yn___1; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.corr_derived_yn___1 IS 'Yes';


--
-- Name: COLUMN viva_meta_variable_history.der_varname; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.der_varname IS 'Name of corresponding derived variable';


--
-- Name: COLUMN viva_meta_variable_history.dervar_explain; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.dervar_explain IS 'Derived Variable';


--
-- Name: COLUMN viva_meta_variable_history.orig_varnames; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variable_history.orig_varnames IS 'Name of corresponding original variable(s)';


--
-- Name: viva_meta_variable_history_id_seq; Type: SEQUENCE; Schema: redcap; Owner: -
--

CREATE SEQUENCE redcap.viva_meta_variable_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: viva_meta_variable_history_id_seq; Type: SEQUENCE OWNED BY; Schema: redcap; Owner: -
--

ALTER SEQUENCE redcap.viva_meta_variable_history_id_seq OWNED BY redcap.viva_meta_variable_history.id;


--
-- Name: viva_meta_variables; Type: TABLE; Schema: redcap; Owner: -
--

CREATE TABLE redcap.viva_meta_variables (
    id bigint NOT NULL,
    varname character varying,
    var_label character varying,
    var_type character varying,
    restrict_var___0 boolean,
    restrict_var___1 boolean,
    restrict_var___2 boolean,
    restrict_var___3 boolean,
    restrict_var___4 boolean,
    oth_restrict character varying,
    domain_viva character varying,
    subdomain___1 boolean,
    subdomain___2 boolean,
    target_of_q character varying,
    data_source character varying,
    val_instr character varying,
    ext_instrument character varying,
    internal_instrument character varying,
    doc_yn character varying,
    doc_link character varying,
    long_yn character varying,
    long_timepts___1 boolean,
    long_timepts___2 boolean,
    long_timepts___3 boolean,
    long_timepts___4 boolean,
    long_timepts___5 boolean,
    long_timepts___6 boolean,
    long_timepts___7 boolean,
    long_timepts___8 boolean,
    long_timepts___9 boolean,
    long_timepts___10 boolean,
    long_timepts___11 boolean,
    long_timepts___12 boolean,
    long_timepts___13 boolean,
    long_timepts___14 boolean,
    long_timepts___15 boolean,
    long_timepts___16 boolean,
    long_timepts___17 boolean,
    long_timepts___18 boolean,
    long_timepts___19 boolean,
    long_timepts___20 boolean,
    long_timepts___21 boolean,
    long_timepts___22 boolean,
    long_timepts___23 boolean,
    static_variable_information_complete integer,
    static_variable_information_timestamp timestamp without time zone,
    event_type character varying,
    visit_name character varying,
    visit_time character varying,
    assay_specimen character varying,
    assay_type character varying,
    lab_assay_dataset character varying,
    form_label_ep character varying,
    form_version_ep___1 boolean,
    form_version_ep___2 boolean,
    form_version_ep___3 boolean,
    form_version_ep___4 boolean,
    form_version_ep___5 boolean,
    form_version_ep___6 boolean,
    form_version_ep___7 boolean,
    form_version_ep___8 boolean,
    form_label_mp character varying,
    form_version_mp___1 boolean,
    form_version_mp___2 boolean,
    form_version_mp___3 boolean,
    form_version_mp___4 boolean,
    form_label_del character varying,
    form_version_del___1 boolean,
    form_version_del___2 boolean,
    form_version_del___3 boolean,
    form_version_del___4 boolean,
    form_version_del___5 boolean,
    form_version_del___6 boolean,
    form_version_del___7 boolean,
    form_label_6m character varying,
    form_version_6m___1 boolean,
    form_version_6m___2 boolean,
    form_version_6m___3 boolean,
    form_version_6m___4 boolean,
    form_version_6m___5 boolean,
    form_version_6m___6 boolean,
    form_version_6m___7 boolean,
    form_version_6m___8 boolean,
    form_version_6m___9 boolean,
    form_version_6m___10 boolean,
    form_label_1y character varying,
    form_version_1y___1 boolean,
    form_label_2y character varying,
    form_version_2y___1 boolean,
    form_label_3y character varying,
    form_version_3y___1 boolean,
    form_version_3y___2 boolean,
    form_version_3y___3 boolean,
    form_version_3y___4 boolean,
    form_version_3y___5 boolean,
    form_version_3y___6 boolean,
    form_version_3y___7 boolean,
    form_version_3y___8 boolean,
    form_version_3y___9 boolean,
    form_version_3y___10 boolean,
    form_version_3y___11 boolean,
    form_version_3y___12 boolean,
    form_version_3y___13 boolean,
    form_version_3y___14 boolean,
    form_label_4y character varying,
    form_version_4y___1 boolean,
    form_label_5y character varying,
    form_version_5y___1 boolean,
    form_label_6y character varying,
    form_version_6y___1 boolean,
    form_label_7y character varying,
    form_version_7y___1 boolean,
    form_version_7y___2 boolean,
    form_version_7y___3 boolean,
    form_version_7y___4 boolean,
    form_version_7y___5 boolean,
    form_version_7y___6 boolean,
    form_version_7y___7 boolean,
    form_version_7y___8 boolean,
    form_version_7y___9 boolean,
    form_version_7y___10 boolean,
    form_version_7y___11 boolean,
    form_version_7y___12 boolean,
    form_version_7y___13 boolean,
    form_version_7y___14 boolean,
    form_version_7y___15 boolean,
    form_version_7y___16 boolean,
    form_version_7y___17 boolean,
    form_label_8y character varying,
    form_version_8y___1 boolean,
    form_label_9y character varying,
    form_version_9y___1 boolean,
    form_version_9y___2 boolean,
    form_label_10y character varying,
    form_version_10y___1 boolean,
    form_version_10y___2 boolean,
    form_label_11y character varying,
    form_version_11y___1 boolean,
    form_version_11y___2 boolean,
    form_label_12y character varying,
    form_version_12y___1 boolean,
    form_version_12y___2 boolean,
    form_version_12y___3 boolean,
    form_version_12y___4 boolean,
    form_version_12y___5 boolean,
    form_version_12y___6 boolean,
    form_version_12y___7 boolean,
    form_version_12y___8 boolean,
    form_version_12y___9 boolean,
    form_version_12y___10 boolean,
    form_version_12y___11 boolean,
    form_version_12y___12 boolean,
    form_version_12y___13 boolean,
    form_version_12y___14 boolean,
    form_version_12y___15 boolean,
    form_version_12y___16 boolean,
    form_label_14y character varying,
    form_version_14y___1 boolean,
    form_version_14y___2 boolean,
    form_label_15y character varying,
    form_version_15y___1 boolean,
    form_version_15y___2 boolean,
    form_label_16y character varying,
    form_version_16y___1 boolean,
    form_version_16y___2 boolean,
    form_label_mt character varying,
    form_version_mt character varying,
    form_label_19y character varying,
    form_version_19y___1 boolean,
    form_version_19y___2 boolean,
    not_time_specific character varying,
    var_level character varying,
    units character varying,
    model_type character varying,
    response_options character varying,
    elig_sample character varying,
    elig_n character varying,
    actual_n character varying,
    an_var character varying,
    orig_deriv character varying,
    corr_derived_yn___0 boolean,
    corr_derived_yn___1 boolean,
    der_varname character varying,
    dervar_explain character varying,
    orig_varnames character varying,
    visitspecific_information_complete integer,
    visitspecific_information_timestamp timestamp without time zone,
    redcap_survey_identifier character varying,
    user_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    redcap_repeat_instrument character varying,
    redcap_repeat_instance character varying,
    long_timepts_chosen_array character varying(128)
);


--
-- Name: TABLE viva_meta_variables; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON TABLE redcap.viva_meta_variables IS 'Dynamicmodel: Viva Meta Variable';


--
-- Name: COLUMN viva_meta_variables.varname; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.varname IS 'Variable name';


--
-- Name: COLUMN viva_meta_variables.var_label; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.var_label IS 'Variable label';


--
-- Name: COLUMN viva_meta_variables.var_type; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.var_type IS 'Type of variable';


--
-- Name: COLUMN viva_meta_variables.restrict_var___0; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.restrict_var___0 IS 'None';


--
-- Name: COLUMN viva_meta_variables.restrict_var___1; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.restrict_var___1 IS 'PHI, OK for limited dataset';


--
-- Name: COLUMN viva_meta_variables.restrict_var___2; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.restrict_var___2 IS 'PHI, restricted use';


--
-- Name: COLUMN viva_meta_variables.restrict_var___3; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.restrict_var___3 IS 'Sensitive information';


--
-- Name: COLUMN viva_meta_variables.restrict_var___4; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.restrict_var___4 IS 'Other restriction';


--
-- Name: COLUMN viva_meta_variables.oth_restrict; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.oth_restrict IS 'Specify other restriction';


--
-- Name: COLUMN viva_meta_variables.domain_viva; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.domain_viva IS 'Domain or topic area';


--
-- Name: COLUMN viva_meta_variables.subdomain___1; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.subdomain___1 IS 'Placeholder';


--
-- Name: COLUMN viva_meta_variables.subdomain___2; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.subdomain___2 IS 'Placeholder';


--
-- Name: COLUMN viva_meta_variables.target_of_q; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.target_of_q IS 'Target';


--
-- Name: COLUMN viva_meta_variables.data_source; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.data_source IS 'Source of data';


--
-- Name: COLUMN viva_meta_variables.val_instr; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.val_instr IS 'Please indicate whether the question comes from an external, internal, or no instrument.';


--
-- Name: COLUMN viva_meta_variables.ext_instrument; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.ext_instrument IS 'External instrument';


--
-- Name: COLUMN viva_meta_variables.internal_instrument; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.internal_instrument IS 'Internal instrument';


--
-- Name: COLUMN viva_meta_variables.doc_yn; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.doc_yn IS 'Documentation available?';


--
-- Name: COLUMN viva_meta_variables.doc_link; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.doc_link IS 'Documentation link';


--
-- Name: COLUMN viva_meta_variables.long_yn; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.long_yn IS 'Longitudinal measurement?';


--
-- Name: COLUMN viva_meta_variables.long_timepts___1; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.long_timepts___1 IS 'Screening';


--
-- Name: COLUMN viva_meta_variables.long_timepts___2; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.long_timepts___2 IS 'Early pregnancy';


--
-- Name: COLUMN viva_meta_variables.long_timepts___3; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.long_timepts___3 IS 'Mid-pregnancy';


--
-- Name: COLUMN viva_meta_variables.long_timepts___4; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.long_timepts___4 IS 'Delivery';


--
-- Name: COLUMN viva_meta_variables.long_timepts___5; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.long_timepts___5 IS 'Infancy (6 months)';


--
-- Name: COLUMN viva_meta_variables.long_timepts___6; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.long_timepts___6 IS '1 year';


--
-- Name: COLUMN viva_meta_variables.long_timepts___7; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.long_timepts___7 IS '2 year';


--
-- Name: COLUMN viva_meta_variables.long_timepts___8; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.long_timepts___8 IS 'Early childhood (3 year)';


--
-- Name: COLUMN viva_meta_variables.long_timepts___9; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.long_timepts___9 IS '4 year';


--
-- Name: COLUMN viva_meta_variables.long_timepts___10; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.long_timepts___10 IS '5 year';


--
-- Name: COLUMN viva_meta_variables.long_timepts___11; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.long_timepts___11 IS '6 year';


--
-- Name: COLUMN viva_meta_variables.long_timepts___12; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.long_timepts___12 IS 'Mid childhood (7-8 years)';


--
-- Name: COLUMN viva_meta_variables.long_timepts___13; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.long_timepts___13 IS '8 year';


--
-- Name: COLUMN viva_meta_variables.long_timepts___14; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.long_timepts___14 IS '9 year';


--
-- Name: COLUMN viva_meta_variables.long_timepts___15; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.long_timepts___15 IS '10 year';


--
-- Name: COLUMN viva_meta_variables.long_timepts___16; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.long_timepts___16 IS '11 year';


--
-- Name: COLUMN viva_meta_variables.long_timepts___17; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.long_timepts___17 IS 'Early adolescence (12-13 years)';


--
-- Name: COLUMN viva_meta_variables.long_timepts___18; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.long_timepts___18 IS '14 years';


--
-- Name: COLUMN viva_meta_variables.long_timepts___19; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.long_timepts___19 IS '15 year';


--
-- Name: COLUMN viva_meta_variables.long_timepts___20; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.long_timepts___20 IS '16 year';


--
-- Name: COLUMN viva_meta_variables.long_timepts___21; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.long_timepts___21 IS 'Mid/late adolescence (17-18 years)';


--
-- Name: COLUMN viva_meta_variables.long_timepts___22; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.long_timepts___22 IS '19 year';


--
-- Name: COLUMN viva_meta_variables.long_timepts___23; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.long_timepts___23 IS 'Not time specific';


--
-- Name: COLUMN viva_meta_variables.event_type; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.event_type IS 'Type of data collection event';


--
-- Name: COLUMN viva_meta_variables.visit_name; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.visit_name IS 'Visit name';


--
-- Name: COLUMN viva_meta_variables.visit_time; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.visit_time IS 'Visit target time point';


--
-- Name: COLUMN viva_meta_variables.assay_specimen; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.assay_specimen IS 'Lab Assay Specimen Source';


--
-- Name: COLUMN viva_meta_variables.assay_type; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.assay_type IS 'Laboratory assay type';


--
-- Name: COLUMN viva_meta_variables.lab_assay_dataset; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.lab_assay_dataset IS 'Laboratory Assay \''Form\'' (Dataset)';


--
-- Name: COLUMN viva_meta_variables.form_label_ep; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_label_ep IS 'Form Label';


--
-- Name: COLUMN viva_meta_variables.form_version_ep___1; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_ep___1 IS 'EPQ';


--
-- Name: COLUMN viva_meta_variables.form_version_ep___2; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_ep___2 IS 'EPQ1';


--
-- Name: COLUMN viva_meta_variables.form_version_ep___3; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_ep___3 IS 'EPQA';


--
-- Name: COLUMN viva_meta_variables.form_version_ep___4; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_ep___4 IS 'EPS1';


--
-- Name: COLUMN viva_meta_variables.form_version_ep___5; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_ep___5 IS 'EPI1';


--
-- Name: COLUMN viva_meta_variables.form_version_ep___6; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_ep___6 IS 'EPIA';


--
-- Name: COLUMN viva_meta_variables.form_version_ep___7; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_ep___7 IS 'SCR1';


--
-- Name: COLUMN viva_meta_variables.form_version_ep___8; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_ep___8 IS 'BLD1';


--
-- Name: COLUMN viva_meta_variables.form_label_mp; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_label_mp IS 'Form Label';


--
-- Name: COLUMN viva_meta_variables.form_version_mp___1; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_mp___1 IS 'MPQ2';


--
-- Name: COLUMN viva_meta_variables.form_version_mp___2; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_mp___2 IS 'BLD2';


--
-- Name: COLUMN viva_meta_variables.form_version_mp___3; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_mp___3 IS 'PSQ2';


--
-- Name: COLUMN viva_meta_variables.form_version_mp___4; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_mp___4 IS 'MPI2';


--
-- Name: COLUMN viva_meta_variables.form_label_del; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_label_del IS 'Form Label';


--
-- Name: COLUMN viva_meta_variables.form_version_del___1; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_del___1 IS 'DES3';


--
-- Name: COLUMN viva_meta_variables.form_version_del___2; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_del___2 IS 'NAN3';


--
-- Name: COLUMN viva_meta_variables.form_version_del___3; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_del___3 IS 'NBP3';


--
-- Name: COLUMN viva_meta_variables.form_version_del___4; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_del___4 IS 'NLG3';


--
-- Name: COLUMN viva_meta_variables.form_version_del___5; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_del___5 IS 'PSQ3';


--
-- Name: COLUMN viva_meta_variables.form_version_del___6; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_del___6 IS 'PSS3';


--
-- Name: COLUMN viva_meta_variables.form_version_del___7; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_del___7 IS 'DEI3';


--
-- Name: COLUMN viva_meta_variables.form_label_6m; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_label_6m IS 'Form Label';


--
-- Name: COLUMN viva_meta_variables.form_version_6m___1; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_6m___1 IS 'PSQ4';


--
-- Name: COLUMN viva_meta_variables.form_version_6m___2; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_6m___2 IS 'MSC4';


--
-- Name: COLUMN viva_meta_variables.form_version_6m___3; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_6m___3 IS 'VIS4';


--
-- Name: COLUMN viva_meta_variables.form_version_6m___4; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_6m___4 IS 'SMIR';


--
-- Name: COLUMN viva_meta_variables.form_version_6m___5; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_6m___5 IS 'SMSB4';


--
-- Name: COLUMN viva_meta_variables.form_version_6m___6; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_6m___6 IS 'SMSF4';


--
-- Name: COLUMN viva_meta_variables.form_version_6m___7; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_6m___7 IS 'SMSW4';


--
-- Name: COLUMN viva_meta_variables.form_version_6m___8; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_6m___8 IS 'SMSM4';


--
-- Name: COLUMN viva_meta_variables.form_version_6m___9; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_6m___9 IS 'SMQ4';


--
-- Name: COLUMN viva_meta_variables.form_version_6m___10; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_6m___10 IS 'MSM4';


--
-- Name: COLUMN viva_meta_variables.form_label_1y; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_label_1y IS 'Form Label';


--
-- Name: COLUMN viva_meta_variables.form_version_1y___1; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_1y___1 IS 'OYQ';


--
-- Name: COLUMN viva_meta_variables.form_label_2y; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_label_2y IS 'Form Label';


--
-- Name: COLUMN viva_meta_variables.form_version_2y___1; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_2y___1 IS 'SYQ/SYQ6';


--
-- Name: COLUMN viva_meta_variables.form_label_3y; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_label_3y IS 'Form Label';


--
-- Name: COLUMN viva_meta_variables.form_version_3y___1; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_3y___1 IS 'MAT7';


--
-- Name: COLUMN viva_meta_variables.form_version_3y___2; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_3y___2 IS 'CAT7';


--
-- Name: COLUMN viva_meta_variables.form_version_3y___3; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_3y___3 IS 'MBP7';


--
-- Name: COLUMN viva_meta_variables.form_version_3y___4; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_3y___4 IS 'CBP7';


--
-- Name: COLUMN viva_meta_variables.form_version_3y___5; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_3y___5 IS 'MBL7';


--
-- Name: COLUMN viva_meta_variables.form_version_3y___6; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_3y___6 IS 'CBL7';


--
-- Name: COLUMN viva_meta_variables.form_version_3y___7; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_3y___7 IS 'MCT7';


--
-- Name: COLUMN viva_meta_variables.form_version_3y___8; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_3y___8 IS 'CCT7';


--
-- Name: COLUMN viva_meta_variables.form_version_3y___9; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_3y___9 IS 'TYI';


--
-- Name: COLUMN viva_meta_variables.form_version_3y___10; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_3y___10 IS 'TYQ';


--
-- Name: COLUMN viva_meta_variables.form_version_3y___11; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_3y___11 IS 'TYS7';


--
-- Name: COLUMN viva_meta_variables.form_version_3y___12; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_3y___12 IS 'IBL7';


--
-- Name: COLUMN viva_meta_variables.form_version_3y___13; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_3y___13 IS 'IAC7';


--
-- Name: COLUMN viva_meta_variables.form_version_3y___14; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_3y___14 IS 'IDC7';


--
-- Name: COLUMN viva_meta_variables.form_label_4y; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_label_4y IS 'Form Label';


--
-- Name: COLUMN viva_meta_variables.form_version_4y___1; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_4y___1 IS '4YQ';


--
-- Name: COLUMN viva_meta_variables.form_label_5y; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_label_5y IS 'Form Label';


--
-- Name: COLUMN viva_meta_variables.form_version_5y___1; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_5y___1 IS 'QU5Y';


--
-- Name: COLUMN viva_meta_variables.form_label_6y; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_label_6y IS 'Form Label';


--
-- Name: COLUMN viva_meta_variables.form_version_6y___1; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_6y___1 IS 'QU6Y';


--
-- Name: COLUMN viva_meta_variables.form_label_7y; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_label_7y IS 'Form Label';


--
-- Name: COLUMN viva_meta_variables.form_version_7y___1; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_7y___1 IS 'MA7Y';


--
-- Name: COLUMN viva_meta_variables.form_version_7y___2; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_7y___2 IS 'CA7Y';


--
-- Name: COLUMN viva_meta_variables.form_version_7y___3; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_7y___3 IS 'BL7Y';


--
-- Name: COLUMN viva_meta_variables.form_version_7y___4; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_7y___4 IS 'PE7Y';


--
-- Name: COLUMN viva_meta_variables.form_version_7y___5; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_7y___5 IS 'HR7Y';


--
-- Name: COLUMN viva_meta_variables.form_version_7y___6; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_7y___6 IS 'DX7Y';


--
-- Name: COLUMN viva_meta_variables.form_version_7y___7; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_7y___7 IS 'BP7Y';


--
-- Name: COLUMN viva_meta_variables.form_version_7y___8; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_7y___8 IS 'MC7Y';


--
-- Name: COLUMN viva_meta_variables.form_version_7y___9; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_7y___9 IS 'CC7Y';


--
-- Name: COLUMN viva_meta_variables.form_version_7y___10; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_7y___10 IS 'SP7Y';


--
-- Name: COLUMN viva_meta_variables.form_version_7y___11; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_7y___11 IS 'BQ7Y';


--
-- Name: COLUMN viva_meta_variables.form_version_7y___12; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_7y___12 IS 'TE7Y';


--
-- Name: COLUMN viva_meta_variables.form_version_7y___13; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_7y___13 IS 'MI7Y';


--
-- Name: COLUMN viva_meta_variables.form_version_7y___14; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_7y___14 IS 'IN7Y';


--
-- Name: COLUMN viva_meta_variables.form_version_7y___15; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_7y___15 IS 'HP7Y';


--
-- Name: COLUMN viva_meta_variables.form_version_7y___16; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_7y___16 IS 'ST7Y';


--
-- Name: COLUMN viva_meta_variables.form_version_7y___17; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_7y___17 IS 'QU7Y';


--
-- Name: COLUMN viva_meta_variables.form_label_8y; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_label_8y IS 'Form Label';


--
-- Name: COLUMN viva_meta_variables.form_version_8y___1; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_8y___1 IS 'QU8Y';


--
-- Name: COLUMN viva_meta_variables.form_label_9y; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_label_9y IS 'Form Label';


--
-- Name: COLUMN viva_meta_variables.form_version_9y___1; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_9y___1 IS 'QU9Y';


--
-- Name: COLUMN viva_meta_variables.form_version_9y___2; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_9y___2 IS 'CQ9Y';


--
-- Name: COLUMN viva_meta_variables.form_label_10y; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_label_10y IS 'Form Label';


--
-- Name: COLUMN viva_meta_variables.form_version_10y___1; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_10y___1 IS 'QU10';


--
-- Name: COLUMN viva_meta_variables.form_version_10y___2; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_10y___2 IS 'CQ10';


--
-- Name: COLUMN viva_meta_variables.form_label_11y; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_label_11y IS 'Form Label';


--
-- Name: COLUMN viva_meta_variables.form_version_11y___1; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_11y___1 IS 'QU11';


--
-- Name: COLUMN viva_meta_variables.form_version_11y___2; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_11y___2 IS 'CQ11';


--
-- Name: COLUMN viva_meta_variables.form_label_12y; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_label_12y IS 'Form Label';


--
-- Name: COLUMN viva_meta_variables.form_version_12y___1; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_12y___1 IS 'MA12';


--
-- Name: COLUMN viva_meta_variables.form_version_12y___2; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_12y___2 IS 'CA12';


--
-- Name: COLUMN viva_meta_variables.form_version_12y___3; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_12y___3 IS 'SJ12';


--
-- Name: COLUMN viva_meta_variables.form_version_12y___4; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_12y___4 IS 'BL12';


--
-- Name: COLUMN viva_meta_variables.form_version_12y___5; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_12y___5 IS 'PE12';


--
-- Name: COLUMN viva_meta_variables.form_version_12y___6; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_12y___6 IS 'HR12';


--
-- Name: COLUMN viva_meta_variables.form_version_12y___7; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_12y___7 IS 'NS12';


--
-- Name: COLUMN viva_meta_variables.form_version_12y___8; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_12y___8 IS 'BP12';


--
-- Name: COLUMN viva_meta_variables.form_version_12y___9; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_12y___9 IS 'DX12';


--
-- Name: COLUMN viva_meta_variables.form_version_12y___10; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_12y___10 IS 'NO12';


--
-- Name: COLUMN viva_meta_variables.form_version_12y___11; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_12y___11 IS 'SP12';


--
-- Name: COLUMN viva_meta_variables.form_version_12y___12; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_12y___12 IS 'MI12';


--
-- Name: COLUMN viva_meta_variables.form_version_12y___13; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_12y___13 IS 'IN12';


--
-- Name: COLUMN viva_meta_variables.form_version_12y___14; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_12y___14 IS 'ST12';


--
-- Name: COLUMN viva_meta_variables.form_version_12y___15; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_12y___15 IS 'QU12';


--
-- Name: COLUMN viva_meta_variables.form_version_12y___16; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_12y___16 IS 'CQ12';


--
-- Name: COLUMN viva_meta_variables.form_label_14y; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_label_14y IS 'Form Label';


--
-- Name: COLUMN viva_meta_variables.form_version_14y___1; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_14y___1 IS 'QU14';


--
-- Name: COLUMN viva_meta_variables.form_version_14y___2; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_14y___2 IS 'CQ14';


--
-- Name: COLUMN viva_meta_variables.form_label_15y; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_label_15y IS 'Form Label';


--
-- Name: COLUMN viva_meta_variables.form_version_15y___1; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_15y___1 IS 'QU15';


--
-- Name: COLUMN viva_meta_variables.form_version_15y___2; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_15y___2 IS 'CQ15';


--
-- Name: COLUMN viva_meta_variables.form_label_16y; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_label_16y IS 'Form Label';


--
-- Name: COLUMN viva_meta_variables.form_version_16y___1; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_16y___1 IS 'QU16';


--
-- Name: COLUMN viva_meta_variables.form_version_16y___2; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_16y___2 IS 'CQ16';


--
-- Name: COLUMN viva_meta_variables.form_label_mt; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_label_mt IS 'Form Label';


--
-- Name: COLUMN viva_meta_variables.form_version_mt; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_mt IS 'Form Version';


--
-- Name: COLUMN viva_meta_variables.form_label_19y; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_label_19y IS 'Form Label';


--
-- Name: COLUMN viva_meta_variables.form_version_19y___1; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_19y___1 IS 'QU19';


--
-- Name: COLUMN viva_meta_variables.form_version_19y___2; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.form_version_19y___2 IS 'TQ19';


--
-- Name: COLUMN viva_meta_variables.not_time_specific; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.not_time_specific IS 'Not time specific';


--
-- Name: COLUMN viva_meta_variables.var_level; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.var_level IS 'Variable Level';


--
-- Name: COLUMN viva_meta_variables.units; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.units IS 'Units';


--
-- Name: COLUMN viva_meta_variables.model_type; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.model_type IS 'Model';


--
-- Name: COLUMN viva_meta_variables.response_options; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.response_options IS 'Response Options';


--
-- Name: COLUMN viva_meta_variables.elig_sample; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.elig_sample IS 'Eligible sample description';


--
-- Name: COLUMN viva_meta_variables.elig_n; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.elig_n IS 'Eligible sample N';


--
-- Name: COLUMN viva_meta_variables.actual_n; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.actual_n IS 'Actual sample N';


--
-- Name: COLUMN viva_meta_variables.an_var; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.an_var IS 'Analytic variable name';


--
-- Name: COLUMN viva_meta_variables.orig_deriv; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.orig_deriv IS 'Original or derived variable';


--
-- Name: COLUMN viva_meta_variables.corr_derived_yn___0; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.corr_derived_yn___0 IS 'No';


--
-- Name: COLUMN viva_meta_variables.corr_derived_yn___1; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.corr_derived_yn___1 IS 'Yes';


--
-- Name: COLUMN viva_meta_variables.der_varname; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.der_varname IS 'Name of corresponding derived variable';


--
-- Name: COLUMN viva_meta_variables.dervar_explain; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.dervar_explain IS 'Derived Variable';


--
-- Name: COLUMN viva_meta_variables.orig_varnames; Type: COMMENT; Schema: redcap; Owner: -
--

COMMENT ON COLUMN redcap.viva_meta_variables.orig_varnames IS 'Name of corresponding original variable(s)';


--
-- Name: viva_meta_variables_id_seq; Type: SEQUENCE; Schema: redcap; Owner: -
--

CREATE SEQUENCE redcap.viva_meta_variables_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: viva_meta_variables_id_seq; Type: SEQUENCE OWNED BY; Schema: redcap; Owner: -
--

ALTER SEQUENCE redcap.viva_meta_variables_id_seq OWNED BY redcap.viva_meta_variables.id;


--
-- Name: datadic_choice_history; Type: TABLE; Schema: ref_data; Owner: -
--

CREATE TABLE ref_data.datadic_choice_history (
    id bigint NOT NULL,
    datadic_choice_id bigint,
    source_name character varying,
    source_type character varying,
    form_name character varying,
    field_name character varying,
    value character varying,
    label character varying,
    disabled boolean,
    admin_id bigint,
    redcap_data_dictionary_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: datadic_choice_history_id_seq; Type: SEQUENCE; Schema: ref_data; Owner: -
--

CREATE SEQUENCE ref_data.datadic_choice_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: datadic_choice_history_id_seq; Type: SEQUENCE OWNED BY; Schema: ref_data; Owner: -
--

ALTER SEQUENCE ref_data.datadic_choice_history_id_seq OWNED BY ref_data.datadic_choice_history.id;


--
-- Name: datadic_choices; Type: TABLE; Schema: ref_data; Owner: -
--

CREATE TABLE ref_data.datadic_choices (
    id bigint NOT NULL,
    source_name character varying,
    source_type character varying,
    form_name character varying,
    field_name character varying,
    value character varying,
    label character varying,
    disabled boolean,
    admin_id bigint,
    redcap_data_dictionary_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: datadic_choices_id_seq; Type: SEQUENCE; Schema: ref_data; Owner: -
--

CREATE SEQUENCE ref_data.datadic_choices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: datadic_choices_id_seq; Type: SEQUENCE OWNED BY; Schema: ref_data; Owner: -
--

ALTER SEQUENCE ref_data.datadic_choices_id_seq OWNED BY ref_data.datadic_choices.id;


--
-- Name: datadic_variables; Type: TABLE; Schema: ref_data; Owner: -
--

CREATE TABLE ref_data.datadic_variables (
    id bigint NOT NULL,
    study character varying,
    source_name character varying,
    source_type character varying,
    domain character varying,
    form_name character varying,
    variable_name character varying,
    variable_type character varying,
    presentation_type character varying,
    label character varying,
    label_note character varying,
    annotation character varying,
    is_required boolean,
    valid_type character varying,
    valid_min character varying,
    valid_max character varying,
    multi_valid_choices character varying[],
    is_identifier boolean,
    is_derived_var boolean,
    multi_derived_from_id bigint[],
    doc_url character varying,
    target_type character varying,
    owner_email character varying,
    classification character varying,
    other_classification character varying,
    multi_timepoints character varying[],
    equivalent_to_id bigint,
    storage_type character varying,
    db_or_fs character varying,
    schema_or_path character varying,
    table_or_file character varying,
    disabled boolean,
    admin_id bigint,
    redcap_data_dictionary_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    "position" integer,
    section_id integer,
    sub_section_id integer,
    title character varying,
    storage_varname character varying,
    user_id bigint,
    contributor_type character varying,
    n_for_timepoints jsonb,
    notes character varying
);


--
-- Name: TABLE datadic_variables; Type: COMMENT; Schema: ref_data; Owner: -
--

COMMENT ON TABLE ref_data.datadic_variables IS 'Dynamicmodel: User Variables';


--
-- Name: COLUMN datadic_variables.study; Type: COMMENT; Schema: ref_data; Owner: -
--

COMMENT ON COLUMN ref_data.datadic_variables.study IS 'Study name';


--
-- Name: COLUMN datadic_variables.source_name; Type: COMMENT; Schema: ref_data; Owner: -
--

COMMENT ON COLUMN ref_data.datadic_variables.source_name IS 'Source of variable';


--
-- Name: COLUMN datadic_variables.source_type; Type: COMMENT; Schema: ref_data; Owner: -
--

COMMENT ON COLUMN ref_data.datadic_variables.source_type IS 'Source type';


--
-- Name: COLUMN datadic_variables.domain; Type: COMMENT; Schema: ref_data; Owner: -
--

COMMENT ON COLUMN ref_data.datadic_variables.domain IS 'Domain';


--
-- Name: COLUMN datadic_variables.form_name; Type: COMMENT; Schema: ref_data; Owner: -
--

COMMENT ON COLUMN ref_data.datadic_variables.form_name IS 'Form name (if the source was a type of form)';


--
-- Name: COLUMN datadic_variables.variable_name; Type: COMMENT; Schema: ref_data; Owner: -
--

COMMENT ON COLUMN ref_data.datadic_variables.variable_name IS 'Variable name';


--
-- Name: COLUMN datadic_variables.variable_type; Type: COMMENT; Schema: ref_data; Owner: -
--

COMMENT ON COLUMN ref_data.datadic_variables.variable_type IS 'Variable type';


--
-- Name: COLUMN datadic_variables.presentation_type; Type: COMMENT; Schema: ref_data; Owner: -
--

COMMENT ON COLUMN ref_data.datadic_variables.presentation_type IS 'Data type for presentation purposes';


--
-- Name: COLUMN datadic_variables.label; Type: COMMENT; Schema: ref_data; Owner: -
--

COMMENT ON COLUMN ref_data.datadic_variables.label IS 'Primary label or title (if source was a form, the label presented for the field)';


--
-- Name: COLUMN datadic_variables.label_note; Type: COMMENT; Schema: ref_data; Owner: -
--

COMMENT ON COLUMN ref_data.datadic_variables.label_note IS 'Description (if source was a form, a note presented for the field)';


--
-- Name: COLUMN datadic_variables.annotation; Type: COMMENT; Schema: ref_data; Owner: -
--

COMMENT ON COLUMN ref_data.datadic_variables.annotation IS 'Annotations (if source was a form, annotations not presented to the user)';


--
-- Name: COLUMN datadic_variables.is_required; Type: COMMENT; Schema: ref_data; Owner: -
--

COMMENT ON COLUMN ref_data.datadic_variables.is_required IS 'Was required in source';


--
-- Name: COLUMN datadic_variables.valid_type; Type: COMMENT; Schema: ref_data; Owner: -
--

COMMENT ON COLUMN ref_data.datadic_variables.valid_type IS 'Source data type';


--
-- Name: COLUMN datadic_variables.valid_min; Type: COMMENT; Schema: ref_data; Owner: -
--

COMMENT ON COLUMN ref_data.datadic_variables.valid_min IS 'Minimum value';


--
-- Name: COLUMN datadic_variables.valid_max; Type: COMMENT; Schema: ref_data; Owner: -
--

COMMENT ON COLUMN ref_data.datadic_variables.valid_max IS 'Maximum value';


--
-- Name: COLUMN datadic_variables.multi_valid_choices; Type: COMMENT; Schema: ref_data; Owner: -
--

COMMENT ON COLUMN ref_data.datadic_variables.multi_valid_choices IS 'List of valid choices for categorical variables';


--
-- Name: COLUMN datadic_variables.is_identifier; Type: COMMENT; Schema: ref_data; Owner: -
--

COMMENT ON COLUMN ref_data.datadic_variables.is_identifier IS 'Represents identifiable information';


--
-- Name: COLUMN datadic_variables.is_derived_var; Type: COMMENT; Schema: ref_data; Owner: -
--

COMMENT ON COLUMN ref_data.datadic_variables.is_derived_var IS 'Is a derived variable';


--
-- Name: COLUMN datadic_variables.multi_derived_from_id; Type: COMMENT; Schema: ref_data; Owner: -
--

COMMENT ON COLUMN ref_data.datadic_variables.multi_derived_from_id IS 'If a derived variable, ids of variables used to calculate it';


--
-- Name: COLUMN datadic_variables.doc_url; Type: COMMENT; Schema: ref_data; Owner: -
--

COMMENT ON COLUMN ref_data.datadic_variables.doc_url IS 'URL to additional documentation';


--
-- Name: COLUMN datadic_variables.target_type; Type: COMMENT; Schema: ref_data; Owner: -
--

COMMENT ON COLUMN ref_data.datadic_variables.target_type IS 'Type of participant this variable relates to';


--
-- Name: COLUMN datadic_variables.owner_email; Type: COMMENT; Schema: ref_data; Owner: -
--

COMMENT ON COLUMN ref_data.datadic_variables.owner_email IS 'Owner, especially for derived variables';


--
-- Name: COLUMN datadic_variables.classification; Type: COMMENT; Schema: ref_data; Owner: -
--

COMMENT ON COLUMN ref_data.datadic_variables.classification IS 'Category of sensitivity from a privacy perspective';


--
-- Name: COLUMN datadic_variables.other_classification; Type: COMMENT; Schema: ref_data; Owner: -
--

COMMENT ON COLUMN ref_data.datadic_variables.other_classification IS 'Additional information regarding classification';


--
-- Name: COLUMN datadic_variables.multi_timepoints; Type: COMMENT; Schema: ref_data; Owner: -
--

COMMENT ON COLUMN ref_data.datadic_variables.multi_timepoints IS 'Timepoints this data is collected (in longitudinal studies)';


--
-- Name: COLUMN datadic_variables.equivalent_to_id; Type: COMMENT; Schema: ref_data; Owner: -
--

COMMENT ON COLUMN ref_data.datadic_variables.equivalent_to_id IS 'Primary variable id this is equivalent to';


--
-- Name: COLUMN datadic_variables.storage_type; Type: COMMENT; Schema: ref_data; Owner: -
--

COMMENT ON COLUMN ref_data.datadic_variables.storage_type IS 'Type of storage for dataset';


--
-- Name: COLUMN datadic_variables.db_or_fs; Type: COMMENT; Schema: ref_data; Owner: -
--

COMMENT ON COLUMN ref_data.datadic_variables.db_or_fs IS 'Database or Filesystem name';


--
-- Name: COLUMN datadic_variables.schema_or_path; Type: COMMENT; Schema: ref_data; Owner: -
--

COMMENT ON COLUMN ref_data.datadic_variables.schema_or_path IS 'Database schema or Filesystem directory path';


--
-- Name: COLUMN datadic_variables.table_or_file; Type: COMMENT; Schema: ref_data; Owner: -
--

COMMENT ON COLUMN ref_data.datadic_variables.table_or_file IS 'Database table (or view, if derived or equivalent to another variable), or filename in directory';


--
-- Name: COLUMN datadic_variables.redcap_data_dictionary_id; Type: COMMENT; Schema: ref_data; Owner: -
--

COMMENT ON COLUMN ref_data.datadic_variables.redcap_data_dictionary_id IS 'Reference to REDCap data dictionary representation';


--
-- Name: COLUMN datadic_variables."position"; Type: COMMENT; Schema: ref_data; Owner: -
--

COMMENT ON COLUMN ref_data.datadic_variables."position" IS 'Relative position (for source forms or other variables where order of collection matters)';


--
-- Name: COLUMN datadic_variables.section_id; Type: COMMENT; Schema: ref_data; Owner: -
--

COMMENT ON COLUMN ref_data.datadic_variables.section_id IS 'Section this belongs to';


--
-- Name: COLUMN datadic_variables.sub_section_id; Type: COMMENT; Schema: ref_data; Owner: -
--

COMMENT ON COLUMN ref_data.datadic_variables.sub_section_id IS 'Sub-section this belongs to';


--
-- Name: COLUMN datadic_variables.title; Type: COMMENT; Schema: ref_data; Owner: -
--

COMMENT ON COLUMN ref_data.datadic_variables.title IS 'Section caption';


--
-- Name: COLUMN datadic_variables.storage_varname; Type: COMMENT; Schema: ref_data; Owner: -
--

COMMENT ON COLUMN ref_data.datadic_variables.storage_varname IS 'Database field name, or variable name in data file';


--
-- Name: COLUMN datadic_variables.contributor_type; Type: COMMENT; Schema: ref_data; Owner: -
--

COMMENT ON COLUMN ref_data.datadic_variables.contributor_type IS 'Type of contributor this variable was provided by';


--
-- Name: COLUMN datadic_variables.n_for_timepoints; Type: COMMENT; Schema: ref_data; Owner: -
--

COMMENT ON COLUMN ref_data.datadic_variables.n_for_timepoints IS 'For each named timepoint (name:), the population or count of responses (n:), with notes (notes:)';


--
-- Name: COLUMN datadic_variables.notes; Type: COMMENT; Schema: ref_data; Owner: -
--

COMMENT ON COLUMN ref_data.datadic_variables.notes IS 'Notes';


--
-- Name: datadic_stats; Type: MATERIALIZED VIEW; Schema: ref_data; Owner: -
--

CREATE MATERIALIZED VIEW ref_data.datadic_stats AS
 WITH vars AS (
         SELECT var.id,
            var.study,
            var.source_name,
            var.source_type,
            var.domain,
            var.form_name,
            var.variable_name,
            var.variable_type,
            var.presentation_type,
            var.label,
            var.label_note,
            var.annotation,
            var.is_required,
            var.valid_type,
            var.valid_min,
            var.valid_max,
            var.multi_valid_choices,
            var.is_identifier,
            var.is_derived_var,
            var.multi_derived_from_id,
            var.doc_url,
            var.target_type,
            var.owner_email,
            var.classification,
            var.other_classification,
            var.multi_timepoints,
            var.equivalent_to_id,
            var.storage_type,
            var.db_or_fs,
            var.schema_or_path,
            var.table_or_file,
            var.disabled,
            var.admin_id,
            var.redcap_data_dictionary_id,
            var.created_at,
            var.updated_at,
            var."position",
            var.section_id,
            var.sub_section_id,
            var.title,
            var.storage_varname,
            var.user_id
           FROM ref_data.datadic_variables var
          WHERE ((NOT COALESCE(var.disabled, false)) AND ((var.variable_name)::text <> 'participant_id'::text) AND (NULLIF((var.storage_varname)::text, ''::text) IS NOT NULL))
        )
 SELECT var.id AS variable_id,
    stats.variable AS variable_name,
    var.label AS variable_label,
    stats.results,
    stats.labels,
    stats.mean,
    stats.stddev,
    stats.min,
    stats.med,
    stats.max,
    NULL::character varying AS choices,
    stats.distincts,
    stats.completed,
    stats.total_recs
   FROM (vars var
     JOIN LATERAL ref_data.calc_var_stats_for_numeric(var.id) stats(variable_id, variable, results, labels, min, med, max, mean, stddev, distincts, completed, total_recs, "chart:") ON ((stats.variable IS NOT NULL)))
  WHERE ((var.table_or_file IS NOT NULL) AND ((var.variable_type)::text = ANY ((ARRAY['numeric'::character varying, 'calculated'::character varying])::text[])))
UNION
 SELECT var.id AS variable_id,
    stats.variable AS variable_name,
    var.label AS variable_label,
    stats.results,
    stats.labels,
    NULL::numeric AS mean,
    NULL::numeric AS stddev,
    NULL::numeric AS min,
    NULL::numeric AS med,
    NULL::numeric AS max,
    (to_json(var.multi_valid_choices))::character varying AS choices,
    stats.distincts,
    stats.completed,
    stats.total_recs
   FROM (vars var
     JOIN LATERAL ref_data.calc_var_stats_for_categorical(var.id) stats(variable_id, variable, results, labels, cat_counts, distincts, completed, total_recs, "chart:") ON ((stats.variable IS NOT NULL)))
  WHERE ((var.table_or_file IS NOT NULL) AND ((var.variable_type)::text = 'categorical'::text))
UNION
 SELECT var.id AS variable_id,
    stats.variable AS variable_name,
    var.label AS variable_label,
    stats.results,
    stats.labels,
    NULL::numeric AS mean,
    NULL::numeric AS stddev,
    NULL::numeric AS min,
    NULL::numeric AS med,
    NULL::numeric AS max,
    NULL::character varying AS choices,
    stats.distincts,
    stats.completed,
    stats.total_recs
   FROM (vars var
     JOIN LATERAL ref_data.calc_var_stats_for_boolean(var.id) stats(variable_id, variable, results, labels, cat_counts, distincts, completed, total_recs, "chart:") ON ((stats.variable IS NOT NULL)))
  WHERE ((var.table_or_file IS NOT NULL) AND ((var.variable_type)::text = 'dichotomous'::text))
  WITH NO DATA;


--
-- Name: datadic_variable_history; Type: TABLE; Schema: ref_data; Owner: -
--

CREATE TABLE ref_data.datadic_variable_history (
    id bigint NOT NULL,
    datadic_variable_id bigint,
    study character varying,
    source_name character varying,
    source_type character varying,
    domain character varying,
    form_name character varying,
    variable_name character varying,
    variable_type character varying,
    presentation_type character varying,
    label character varying,
    label_note character varying,
    annotation character varying,
    is_required boolean,
    valid_type character varying,
    valid_min character varying,
    valid_max character varying,
    multi_valid_choices character varying[],
    is_identifier boolean,
    is_derived_var boolean,
    multi_derived_from_id bigint[],
    doc_url character varying,
    target_type character varying,
    owner_email character varying,
    classification character varying,
    other_classification character varying,
    multi_timepoints character varying[],
    equivalent_to_id bigint,
    storage_type character varying,
    db_or_fs character varying,
    schema_or_path character varying,
    table_or_file character varying,
    disabled boolean,
    admin_id bigint,
    redcap_data_dictionary_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    "position" integer,
    section_id integer,
    sub_section_id integer,
    title character varying,
    storage_varname character varying,
    user_id bigint,
    contributor_type character varying,
    n_for_timepoints jsonb,
    notes character varying
);


--
-- Name: COLUMN datadic_variable_history.study; Type: COMMENT; Schema: ref_data; Owner: -
--

COMMENT ON COLUMN ref_data.datadic_variable_history.study IS 'Study name';


--
-- Name: COLUMN datadic_variable_history.source_name; Type: COMMENT; Schema: ref_data; Owner: -
--

COMMENT ON COLUMN ref_data.datadic_variable_history.source_name IS 'Source of variable';


--
-- Name: COLUMN datadic_variable_history.source_type; Type: COMMENT; Schema: ref_data; Owner: -
--

COMMENT ON COLUMN ref_data.datadic_variable_history.source_type IS 'Source type';


--
-- Name: COLUMN datadic_variable_history.domain; Type: COMMENT; Schema: ref_data; Owner: -
--

COMMENT ON COLUMN ref_data.datadic_variable_history.domain IS 'Domain';


--
-- Name: COLUMN datadic_variable_history.form_name; Type: COMMENT; Schema: ref_data; Owner: -
--

COMMENT ON COLUMN ref_data.datadic_variable_history.form_name IS 'Form name (if the source was a type of form)';


--
-- Name: COLUMN datadic_variable_history.variable_name; Type: COMMENT; Schema: ref_data; Owner: -
--

COMMENT ON COLUMN ref_data.datadic_variable_history.variable_name IS 'Variable name';


--
-- Name: COLUMN datadic_variable_history.variable_type; Type: COMMENT; Schema: ref_data; Owner: -
--

COMMENT ON COLUMN ref_data.datadic_variable_history.variable_type IS 'Variable type';


--
-- Name: COLUMN datadic_variable_history.presentation_type; Type: COMMENT; Schema: ref_data; Owner: -
--

COMMENT ON COLUMN ref_data.datadic_variable_history.presentation_type IS 'Data type for presentation purposes';


--
-- Name: COLUMN datadic_variable_history.label; Type: COMMENT; Schema: ref_data; Owner: -
--

COMMENT ON COLUMN ref_data.datadic_variable_history.label IS 'Primary label or title (if source was a form, the label presented for the field)';


--
-- Name: COLUMN datadic_variable_history.label_note; Type: COMMENT; Schema: ref_data; Owner: -
--

COMMENT ON COLUMN ref_data.datadic_variable_history.label_note IS 'Description (if source was a form, a note presented for the field)';


--
-- Name: COLUMN datadic_variable_history.annotation; Type: COMMENT; Schema: ref_data; Owner: -
--

COMMENT ON COLUMN ref_data.datadic_variable_history.annotation IS 'Annotations (if source was a form, annotations not presented to the user)';


--
-- Name: COLUMN datadic_variable_history.is_required; Type: COMMENT; Schema: ref_data; Owner: -
--

COMMENT ON COLUMN ref_data.datadic_variable_history.is_required IS 'Was required in source';


--
-- Name: COLUMN datadic_variable_history.valid_type; Type: COMMENT; Schema: ref_data; Owner: -
--

COMMENT ON COLUMN ref_data.datadic_variable_history.valid_type IS 'Source data type';


--
-- Name: COLUMN datadic_variable_history.valid_min; Type: COMMENT; Schema: ref_data; Owner: -
--

COMMENT ON COLUMN ref_data.datadic_variable_history.valid_min IS 'Minimum value';


--
-- Name: COLUMN datadic_variable_history.valid_max; Type: COMMENT; Schema: ref_data; Owner: -
--

COMMENT ON COLUMN ref_data.datadic_variable_history.valid_max IS 'Maximum value';


--
-- Name: COLUMN datadic_variable_history.multi_valid_choices; Type: COMMENT; Schema: ref_data; Owner: -
--

COMMENT ON COLUMN ref_data.datadic_variable_history.multi_valid_choices IS 'List of valid choices for categorical variables';


--
-- Name: COLUMN datadic_variable_history.is_identifier; Type: COMMENT; Schema: ref_data; Owner: -
--

COMMENT ON COLUMN ref_data.datadic_variable_history.is_identifier IS 'Represents identifiable information';


--
-- Name: COLUMN datadic_variable_history.is_derived_var; Type: COMMENT; Schema: ref_data; Owner: -
--

COMMENT ON COLUMN ref_data.datadic_variable_history.is_derived_var IS 'Is a derived variable';


--
-- Name: COLUMN datadic_variable_history.multi_derived_from_id; Type: COMMENT; Schema: ref_data; Owner: -
--

COMMENT ON COLUMN ref_data.datadic_variable_history.multi_derived_from_id IS 'If a derived variable, ids of variables used to calculate it';


--
-- Name: COLUMN datadic_variable_history.doc_url; Type: COMMENT; Schema: ref_data; Owner: -
--

COMMENT ON COLUMN ref_data.datadic_variable_history.doc_url IS 'URL to additional documentation';


--
-- Name: COLUMN datadic_variable_history.target_type; Type: COMMENT; Schema: ref_data; Owner: -
--

COMMENT ON COLUMN ref_data.datadic_variable_history.target_type IS 'Type of participant this variable relates to';


--
-- Name: COLUMN datadic_variable_history.owner_email; Type: COMMENT; Schema: ref_data; Owner: -
--

COMMENT ON COLUMN ref_data.datadic_variable_history.owner_email IS 'Owner, especially for derived variables';


--
-- Name: COLUMN datadic_variable_history.classification; Type: COMMENT; Schema: ref_data; Owner: -
--

COMMENT ON COLUMN ref_data.datadic_variable_history.classification IS 'Category of sensitivity from a privacy perspective';


--
-- Name: COLUMN datadic_variable_history.other_classification; Type: COMMENT; Schema: ref_data; Owner: -
--

COMMENT ON COLUMN ref_data.datadic_variable_history.other_classification IS 'Additional information regarding classification';


--
-- Name: COLUMN datadic_variable_history.multi_timepoints; Type: COMMENT; Schema: ref_data; Owner: -
--

COMMENT ON COLUMN ref_data.datadic_variable_history.multi_timepoints IS 'Timepoints this data is collected (in longitudinal studies)';


--
-- Name: COLUMN datadic_variable_history.equivalent_to_id; Type: COMMENT; Schema: ref_data; Owner: -
--

COMMENT ON COLUMN ref_data.datadic_variable_history.equivalent_to_id IS 'Primary variable id this is equivalent to';


--
-- Name: COLUMN datadic_variable_history.storage_type; Type: COMMENT; Schema: ref_data; Owner: -
--

COMMENT ON COLUMN ref_data.datadic_variable_history.storage_type IS 'Type of storage for dataset';


--
-- Name: COLUMN datadic_variable_history.db_or_fs; Type: COMMENT; Schema: ref_data; Owner: -
--

COMMENT ON COLUMN ref_data.datadic_variable_history.db_or_fs IS 'Database or Filesystem name';


--
-- Name: COLUMN datadic_variable_history.schema_or_path; Type: COMMENT; Schema: ref_data; Owner: -
--

COMMENT ON COLUMN ref_data.datadic_variable_history.schema_or_path IS 'Database schema or Filesystem directory path';


--
-- Name: COLUMN datadic_variable_history.table_or_file; Type: COMMENT; Schema: ref_data; Owner: -
--

COMMENT ON COLUMN ref_data.datadic_variable_history.table_or_file IS 'Database table (or view, if derived or equivalent to another variable), or filename in directory';


--
-- Name: COLUMN datadic_variable_history.redcap_data_dictionary_id; Type: COMMENT; Schema: ref_data; Owner: -
--

COMMENT ON COLUMN ref_data.datadic_variable_history.redcap_data_dictionary_id IS 'Reference to REDCap data dictionary representation';


--
-- Name: COLUMN datadic_variable_history."position"; Type: COMMENT; Schema: ref_data; Owner: -
--

COMMENT ON COLUMN ref_data.datadic_variable_history."position" IS 'Relative position (for source forms or other variables where order of collection matters)';


--
-- Name: COLUMN datadic_variable_history.section_id; Type: COMMENT; Schema: ref_data; Owner: -
--

COMMENT ON COLUMN ref_data.datadic_variable_history.section_id IS 'Section this belongs to';


--
-- Name: COLUMN datadic_variable_history.sub_section_id; Type: COMMENT; Schema: ref_data; Owner: -
--

COMMENT ON COLUMN ref_data.datadic_variable_history.sub_section_id IS 'Sub-section this belongs to';


--
-- Name: COLUMN datadic_variable_history.title; Type: COMMENT; Schema: ref_data; Owner: -
--

COMMENT ON COLUMN ref_data.datadic_variable_history.title IS 'Section caption';


--
-- Name: COLUMN datadic_variable_history.storage_varname; Type: COMMENT; Schema: ref_data; Owner: -
--

COMMENT ON COLUMN ref_data.datadic_variable_history.storage_varname IS 'Database field name, or variable name in data file';


--
-- Name: COLUMN datadic_variable_history.contributor_type; Type: COMMENT; Schema: ref_data; Owner: -
--

COMMENT ON COLUMN ref_data.datadic_variable_history.contributor_type IS 'Type of contributor this variable was provided by';


--
-- Name: COLUMN datadic_variable_history.n_for_timepoints; Type: COMMENT; Schema: ref_data; Owner: -
--

COMMENT ON COLUMN ref_data.datadic_variable_history.n_for_timepoints IS 'For each named timepoint (name:), the population or count of responses (n:), with notes (notes:)';


--
-- Name: COLUMN datadic_variable_history.notes; Type: COMMENT; Schema: ref_data; Owner: -
--

COMMENT ON COLUMN ref_data.datadic_variable_history.notes IS 'Notes';


--
-- Name: datadic_variable_history_id_seq; Type: SEQUENCE; Schema: ref_data; Owner: -
--

CREATE SEQUENCE ref_data.datadic_variable_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: datadic_variable_history_id_seq; Type: SEQUENCE OWNED BY; Schema: ref_data; Owner: -
--

ALTER SEQUENCE ref_data.datadic_variable_history_id_seq OWNED BY ref_data.datadic_variable_history.id;


--
-- Name: datadic_variables_id_seq; Type: SEQUENCE; Schema: ref_data; Owner: -
--

CREATE SEQUENCE ref_data.datadic_variables_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: datadic_variables_id_seq; Type: SEQUENCE OWNED BY; Schema: ref_data; Owner: -
--

ALTER SEQUENCE ref_data.datadic_variables_id_seq OWNED BY ref_data.datadic_variables.id;


--
-- Name: mv_datadic_stats; Type: MATERIALIZED VIEW; Schema: ref_data; Owner: -
--

CREATE MATERIALIZED VIEW ref_data.mv_datadic_stats AS
 WITH vars AS (
         SELECT var.id,
            var.study,
            var.source_name,
            var.source_type,
            var.domain,
            var.form_name,
            var.variable_name,
            var.variable_type,
            var.presentation_type,
            var.label,
            var.label_note,
            var.annotation,
            var.is_required,
            var.valid_type,
            var.valid_min,
            var.valid_max,
            var.multi_valid_choices,
            var.is_identifier,
            var.is_derived_var,
            var.multi_derived_from_id,
            var.doc_url,
            var.target_type,
            var.owner_email,
            var.classification,
            var.other_classification,
            var.multi_timepoints,
            var.equivalent_to_id,
            var.storage_type,
            var.db_or_fs,
            var.schema_or_path,
            var.table_or_file,
            var.disabled,
            var.admin_id,
            var.redcap_data_dictionary_id,
            var.created_at,
            var.updated_at,
            var."position",
            var.section_id,
            var.sub_section_id,
            var.title,
            var.storage_varname,
            var.user_id
           FROM ref_data.datadic_variables var
          WHERE ((NOT COALESCE(var.disabled, false)) AND ((var.variable_name)::text <> 'participant_id'::text) AND (NULLIF((var.storage_varname)::text, ''::text) IS NOT NULL))
        )
 SELECT var.id AS variable_id,
    stats.variable AS variable_name,
    var.label AS variable_label,
    stats.results,
    stats.labels,
    stats.mean,
    stats.stddev,
    stats.min,
    stats.med,
    stats.max,
    NULL::character varying AS choices,
    stats.distincts,
    stats.completed,
    stats.total_recs
   FROM (vars var
     JOIN LATERAL ref_data.calc_var_stats_for_numeric(var.id) stats(variable_id, variable, results, labels, min, med, max, mean, stddev, distincts, completed, total_recs, "chart:") ON ((stats.variable IS NOT NULL)))
  WHERE ((var.table_or_file IS NOT NULL) AND ((var.variable_type)::text = ANY ((ARRAY['numeric'::character varying, 'calculated'::character varying])::text[])))
UNION
 SELECT var.id AS variable_id,
    stats.variable AS variable_name,
    var.label AS variable_label,
    stats.results,
    stats.labels,
    NULL::numeric AS mean,
    NULL::numeric AS stddev,
    NULL::numeric AS min,
    NULL::numeric AS med,
    NULL::numeric AS max,
    (to_json(var.multi_valid_choices))::character varying AS choices,
    stats.distincts,
    stats.completed,
    stats.total_recs
   FROM (vars var
     JOIN LATERAL ref_data.calc_var_stats_for_categorical(var.id) stats(variable_id, variable, results, labels, cat_counts, distincts, completed, total_recs, "chart:") ON ((stats.variable IS NOT NULL)))
  WHERE ((var.table_or_file IS NOT NULL) AND ((var.variable_type)::text = 'categorical'::text))
UNION
 SELECT var.id AS variable_id,
    stats.variable AS variable_name,
    var.label AS variable_label,
    stats.results,
    stats.labels,
    NULL::numeric AS mean,
    NULL::numeric AS stddev,
    NULL::numeric AS min,
    NULL::numeric AS med,
    NULL::numeric AS max,
    NULL::character varying AS choices,
    stats.distincts,
    stats.completed,
    stats.total_recs
   FROM (vars var
     JOIN LATERAL ref_data.calc_var_stats_for_boolean(var.id) stats(variable_id, variable, results, labels, cat_counts, distincts, completed, total_recs, "chart:") ON ((stats.variable IS NOT NULL)))
  WHERE ((var.table_or_file IS NOT NULL) AND ((var.variable_type)::text = 'dichotomous'::text))
  WITH NO DATA;


--
-- Name: redcap_client_requests; Type: TABLE; Schema: ref_data; Owner: -
--

CREATE TABLE ref_data.redcap_client_requests (
    id bigint NOT NULL,
    redcap_project_admin_id bigint,
    action character varying,
    name character varying,
    server_url character varying,
    admin_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    result jsonb
);


--
-- Name: TABLE redcap_client_requests; Type: COMMENT; Schema: ref_data; Owner: -
--

COMMENT ON TABLE ref_data.redcap_client_requests IS 'Redcap client requests';


--
-- Name: redcap_client_requests_id_seq; Type: SEQUENCE; Schema: ref_data; Owner: -
--

CREATE SEQUENCE ref_data.redcap_client_requests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: redcap_client_requests_id_seq; Type: SEQUENCE OWNED BY; Schema: ref_data; Owner: -
--

ALTER SEQUENCE ref_data.redcap_client_requests_id_seq OWNED BY ref_data.redcap_client_requests.id;


--
-- Name: redcap_data_collection_instrument_history; Type: TABLE; Schema: ref_data; Owner: -
--

CREATE TABLE ref_data.redcap_data_collection_instrument_history (
    id bigint NOT NULL,
    redcap_data_collection_instrument_id bigint,
    redcap_project_admin_id bigint,
    name character varying,
    label character varying,
    disabled boolean,
    admin_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: redcap_data_collection_instrument_history_id_seq; Type: SEQUENCE; Schema: ref_data; Owner: -
--

CREATE SEQUENCE ref_data.redcap_data_collection_instrument_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: redcap_data_collection_instrument_history_id_seq; Type: SEQUENCE OWNED BY; Schema: ref_data; Owner: -
--

ALTER SEQUENCE ref_data.redcap_data_collection_instrument_history_id_seq OWNED BY ref_data.redcap_data_collection_instrument_history.id;


--
-- Name: redcap_data_collection_instruments; Type: TABLE; Schema: ref_data; Owner: -
--

CREATE TABLE ref_data.redcap_data_collection_instruments (
    id bigint NOT NULL,
    name character varying,
    label character varying,
    disabled boolean,
    redcap_project_admin_id bigint,
    admin_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: redcap_data_collection_instruments_id_seq; Type: SEQUENCE; Schema: ref_data; Owner: -
--

CREATE SEQUENCE ref_data.redcap_data_collection_instruments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: redcap_data_collection_instruments_id_seq; Type: SEQUENCE OWNED BY; Schema: ref_data; Owner: -
--

ALTER SEQUENCE ref_data.redcap_data_collection_instruments_id_seq OWNED BY ref_data.redcap_data_collection_instruments.id;


--
-- Name: redcap_data_dictionaries; Type: TABLE; Schema: ref_data; Owner: -
--

CREATE TABLE ref_data.redcap_data_dictionaries (
    id bigint NOT NULL,
    redcap_project_admin_id bigint,
    field_count integer,
    captured_metadata jsonb,
    disabled boolean,
    admin_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: TABLE redcap_data_dictionaries; Type: COMMENT; Schema: ref_data; Owner: -
--

COMMENT ON TABLE ref_data.redcap_data_dictionaries IS 'Retrieved Redcap Data Dictionaries (metadata)';


--
-- Name: redcap_data_dictionaries_id_seq; Type: SEQUENCE; Schema: ref_data; Owner: -
--

CREATE SEQUENCE ref_data.redcap_data_dictionaries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: redcap_data_dictionaries_id_seq; Type: SEQUENCE OWNED BY; Schema: ref_data; Owner: -
--

ALTER SEQUENCE ref_data.redcap_data_dictionaries_id_seq OWNED BY ref_data.redcap_data_dictionaries.id;


--
-- Name: redcap_data_dictionary_history; Type: TABLE; Schema: ref_data; Owner: -
--

CREATE TABLE ref_data.redcap_data_dictionary_history (
    id bigint NOT NULL,
    redcap_data_dictionary_id bigint,
    redcap_project_admin_id bigint,
    field_count integer,
    captured_metadata jsonb,
    disabled boolean,
    admin_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: TABLE redcap_data_dictionary_history; Type: COMMENT; Schema: ref_data; Owner: -
--

COMMENT ON TABLE ref_data.redcap_data_dictionary_history IS 'Retrieved Redcap Data Dictionaries (metadata) - history';


--
-- Name: redcap_data_dictionary_history_id_seq; Type: SEQUENCE; Schema: ref_data; Owner: -
--

CREATE SEQUENCE ref_data.redcap_data_dictionary_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: redcap_data_dictionary_history_id_seq; Type: SEQUENCE OWNED BY; Schema: ref_data; Owner: -
--

ALTER SEQUENCE ref_data.redcap_data_dictionary_history_id_seq OWNED BY ref_data.redcap_data_dictionary_history.id;


--
-- Name: redcap_project_admin_history; Type: TABLE; Schema: ref_data; Owner: -
--

CREATE TABLE ref_data.redcap_project_admin_history (
    id bigint NOT NULL,
    redcap_project_admin_id bigint,
    name character varying,
    api_key character varying,
    server_url character varying,
    captured_project_info jsonb,
    disabled boolean,
    admin_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    transfer_mode character varying,
    frequency character varying,
    status character varying,
    post_transfer_pipeline character varying[] DEFAULT '{}'::character varying[],
    notes character varying,
    study character varying,
    dynamic_model_table character varying
);


--
-- Name: TABLE redcap_project_admin_history; Type: COMMENT; Schema: ref_data; Owner: -
--

COMMENT ON TABLE ref_data.redcap_project_admin_history IS 'Redcap project administration - history';


--
-- Name: redcap_project_admin_history_id_seq; Type: SEQUENCE; Schema: ref_data; Owner: -
--

CREATE SEQUENCE ref_data.redcap_project_admin_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: redcap_project_admin_history_id_seq; Type: SEQUENCE OWNED BY; Schema: ref_data; Owner: -
--

ALTER SEQUENCE ref_data.redcap_project_admin_history_id_seq OWNED BY ref_data.redcap_project_admin_history.id;


--
-- Name: redcap_project_admins; Type: TABLE; Schema: ref_data; Owner: -
--

CREATE TABLE ref_data.redcap_project_admins (
    id bigint NOT NULL,
    name character varying,
    api_key character varying,
    server_url character varying,
    captured_project_info jsonb,
    disabled boolean,
    admin_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    transfer_mode character varying,
    frequency character varying,
    status character varying,
    post_transfer_pipeline character varying[] DEFAULT '{}'::character varying[],
    notes character varying,
    study character varying,
    dynamic_model_table character varying,
    options character varying
);


--
-- Name: TABLE redcap_project_admins; Type: COMMENT; Schema: ref_data; Owner: -
--

COMMENT ON TABLE ref_data.redcap_project_admins IS 'Redcap project administration';


--
-- Name: redcap_project_admins_id_seq; Type: SEQUENCE; Schema: ref_data; Owner: -
--

CREATE SEQUENCE ref_data.redcap_project_admins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: redcap_project_admins_id_seq; Type: SEQUENCE OWNED BY; Schema: ref_data; Owner: -
--

ALTER SEQUENCE ref_data.redcap_project_admins_id_seq OWNED BY ref_data.redcap_project_admins.id;


--
-- Name: redcap_project_user_history; Type: TABLE; Schema: ref_data; Owner: -
--

CREATE TABLE ref_data.redcap_project_user_history (
    id bigint NOT NULL,
    redcap_project_user_id bigint,
    redcap_project_admin_id bigint,
    username character varying,
    email character varying,
    expiration character varying,
    disabled boolean,
    admin_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: redcap_project_user_history_id_seq; Type: SEQUENCE; Schema: ref_data; Owner: -
--

CREATE SEQUENCE ref_data.redcap_project_user_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: redcap_project_user_history_id_seq; Type: SEQUENCE OWNED BY; Schema: ref_data; Owner: -
--

ALTER SEQUENCE ref_data.redcap_project_user_history_id_seq OWNED BY ref_data.redcap_project_user_history.id;


--
-- Name: redcap_project_users; Type: TABLE; Schema: ref_data; Owner: -
--

CREATE TABLE ref_data.redcap_project_users (
    id bigint NOT NULL,
    redcap_project_admin_id bigint,
    username character varying,
    email character varying,
    expiration character varying,
    disabled boolean,
    admin_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: redcap_project_users_id_seq; Type: SEQUENCE; Schema: ref_data; Owner: -
--

CREATE SEQUENCE ref_data.redcap_project_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: redcap_project_users_id_seq; Type: SEQUENCE OWNED BY; Schema: ref_data; Owner: -
--

ALTER SEQUENCE ref_data.redcap_project_users_id_seq OWNED BY ref_data.redcap_project_users.id;


--
-- Name: activity_log_project_assignment_simple_test_history id; Type: DEFAULT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.activity_log_project_assignment_simple_test_history ALTER COLUMN id SET DEFAULT nextval('dynamic.activity_log_project_assignment_simple_test_history_id_seq'::regclass);


--
-- Name: activity_log_project_assignment_simple_tests id; Type: DEFAULT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.activity_log_project_assignment_simple_tests ALTER COLUMN id SET DEFAULT nextval('dynamic.activity_log_project_assignment_simple_tests_id_seq'::regclass);


--
-- Name: project_import_history id; Type: DEFAULT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.project_import_history ALTER COLUMN id SET DEFAULT nextval('dynamic.project_import_history_id_seq'::regclass);


--
-- Name: project_imports id; Type: DEFAULT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.project_imports ALTER COLUMN id SET DEFAULT nextval('dynamic.project_imports_id_seq'::regclass);


--
-- Name: test_field_history id; Type: DEFAULT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_field_history ALTER COLUMN id SET DEFAULT nextval('dynamic.test_field_history_id_seq'::regclass);


--
-- Name: test_fields id; Type: DEFAULT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_fields ALTER COLUMN id SET DEFAULT nextval('dynamic.test_fields_id_seq'::regclass);


--
-- Name: test_history id; Type: DEFAULT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_history ALTER COLUMN id SET DEFAULT nextval('dynamic.test_history_id_seq'::regclass);


--
-- Name: test_model_b_embed_history id; Type: DEFAULT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_model_b_embed_history ALTER COLUMN id SET DEFAULT nextval('dynamic.test_model_b_embed_history_id_seq'::regclass);


--
-- Name: test_model_b_embed_rec_history id; Type: DEFAULT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_model_b_embed_rec_history ALTER COLUMN id SET DEFAULT nextval('dynamic.test_model_b_embed_rec_history_id_seq'::regclass);


--
-- Name: test_model_b_embed_recs id; Type: DEFAULT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_model_b_embed_recs ALTER COLUMN id SET DEFAULT nextval('dynamic.test_model_b_embed_recs_id_seq'::regclass);


--
-- Name: test_model_b_embeds id; Type: DEFAULT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_model_b_embeds ALTER COLUMN id SET DEFAULT nextval('dynamic.test_model_b_embeds_id_seq'::regclass);


--
-- Name: test_model_c_embed_history id; Type: DEFAULT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_model_c_embed_history ALTER COLUMN id SET DEFAULT nextval('dynamic.test_model_c_embed_history_id_seq'::regclass);


--
-- Name: test_model_c_embed_rec_history id; Type: DEFAULT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_model_c_embed_rec_history ALTER COLUMN id SET DEFAULT nextval('dynamic.test_model_c_embed_rec_history_id_seq'::regclass);


--
-- Name: test_model_c_embed_recs id; Type: DEFAULT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_model_c_embed_recs ALTER COLUMN id SET DEFAULT nextval('dynamic.test_model_c_embed_recs_id_seq'::regclass);


--
-- Name: test_model_c_embeds id; Type: DEFAULT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_model_c_embeds ALTER COLUMN id SET DEFAULT nextval('dynamic.test_model_c_embeds_id_seq'::regclass);


--
-- Name: test_model_embed_history id; Type: DEFAULT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_model_embed_history ALTER COLUMN id SET DEFAULT nextval('dynamic.test_model_embed_history_id_seq'::regclass);


--
-- Name: test_model_embed_rec_history id; Type: DEFAULT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_model_embed_rec_history ALTER COLUMN id SET DEFAULT nextval('dynamic.test_model_embed_rec_history_id_seq'::regclass);


--
-- Name: test_model_embed_recs id; Type: DEFAULT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_model_embed_recs ALTER COLUMN id SET DEFAULT nextval('dynamic.test_model_embed_recs_id_seq'::regclass);


--
-- Name: test_model_embeds id; Type: DEFAULT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_model_embeds ALTER COLUMN id SET DEFAULT nextval('dynamic.test_model_embeds_id_seq'::regclass);


--
-- Name: test_ref_history id; Type: DEFAULT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_ref_history ALTER COLUMN id SET DEFAULT nextval('dynamic.test_ref_history_id_seq'::regclass);


--
-- Name: test_reference_history id; Type: DEFAULT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_reference_history ALTER COLUMN id SET DEFAULT nextval('dynamic.test_reference_history_id_seq'::regclass);


--
-- Name: test_references id; Type: DEFAULT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_references ALTER COLUMN id SET DEFAULT nextval('dynamic.test_references_id_seq'::regclass);


--
-- Name: test_refs id; Type: DEFAULT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_refs ALTER COLUMN id SET DEFAULT nextval('dynamic.test_refs_id_seq'::regclass);


--
-- Name: test_time_history id; Type: DEFAULT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_time_history ALTER COLUMN id SET DEFAULT nextval('dynamic.test_time_history_id_seq'::regclass);


--
-- Name: test_times id; Type: DEFAULT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_times ALTER COLUMN id SET DEFAULT nextval('dynamic.test_times_id_seq'::regclass);


--
-- Name: tests id; Type: DEFAULT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.tests ALTER COLUMN id SET DEFAULT nextval('dynamic.tests_id_seq'::regclass);


--
-- Name: grit_assignment_history id; Type: DEFAULT; Schema: extra_app; Owner: -
--

ALTER TABLE ONLY extra_app.grit_assignment_history ALTER COLUMN id SET DEFAULT nextval('extra_app.grit_assignment_history_id_seq'::regclass);


--
-- Name: grit_assignments id; Type: DEFAULT; Schema: extra_app; Owner: -
--

ALTER TABLE ONLY extra_app.grit_assignments ALTER COLUMN id SET DEFAULT nextval('extra_app.grit_assignments_id_seq'::regclass);


--
-- Name: pitt_bhi_assignment_history id; Type: DEFAULT; Schema: extra_app; Owner: -
--

ALTER TABLE ONLY extra_app.pitt_bhi_assignment_history ALTER COLUMN id SET DEFAULT nextval('extra_app.pitt_bhi_assignment_history_id_seq'::regclass);


--
-- Name: pitt_bhi_assignments id; Type: DEFAULT; Schema: extra_app; Owner: -
--

ALTER TABLE ONLY extra_app.pitt_bhi_assignments ALTER COLUMN id SET DEFAULT nextval('extra_app.pitt_bhi_assignments_id_seq'::regclass);


--
-- Name: sleep_assignment_history id; Type: DEFAULT; Schema: extra_app; Owner: -
--

ALTER TABLE ONLY extra_app.sleep_assignment_history ALTER COLUMN id SET DEFAULT nextval('extra_app.sleep_assignment_history_id_seq'::regclass);


--
-- Name: sleep_assignments id; Type: DEFAULT; Schema: extra_app; Owner: -
--

ALTER TABLE ONLY extra_app.sleep_assignments ALTER COLUMN id SET DEFAULT nextval('extra_app.sleep_assignments_id_seq'::regclass);


--
-- Name: accuracy_score_history id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.accuracy_score_history ALTER COLUMN id SET DEFAULT nextval('ml_app.accuracy_score_history_id_seq'::regclass);


--
-- Name: accuracy_scores id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.accuracy_scores ALTER COLUMN id SET DEFAULT nextval('ml_app.accuracy_scores_id_seq'::regclass);


--
-- Name: activity_log_history id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.activity_log_history ALTER COLUMN id SET DEFAULT nextval('ml_app.activity_log_history_id_seq'::regclass);


--
-- Name: activity_log_player_contact_phone_history id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.activity_log_player_contact_phone_history ALTER COLUMN id SET DEFAULT nextval('ml_app.activity_log_player_contact_phone_history_id_seq'::regclass);


--
-- Name: activity_log_player_contact_phones id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.activity_log_player_contact_phones ALTER COLUMN id SET DEFAULT nextval('ml_app.activity_log_player_contact_phones_id_seq'::regclass);


--
-- Name: activity_logs id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.activity_logs ALTER COLUMN id SET DEFAULT nextval('ml_app.activity_logs_id_seq'::regclass);


--
-- Name: address_history id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.address_history ALTER COLUMN id SET DEFAULT nextval('ml_app.address_history_id_seq'::regclass);


--
-- Name: addresses id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.addresses ALTER COLUMN id SET DEFAULT nextval('ml_app.addresses_id_seq'::regclass);


--
-- Name: admin_action_logs id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.admin_action_logs ALTER COLUMN id SET DEFAULT nextval('ml_app.admin_action_logs_id_seq'::regclass);


--
-- Name: admin_history id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.admin_history ALTER COLUMN id SET DEFAULT nextval('ml_app.admin_history_id_seq'::regclass);


--
-- Name: admins id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.admins ALTER COLUMN id SET DEFAULT nextval('ml_app.admins_id_seq'::regclass);


--
-- Name: app_configuration_history id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.app_configuration_history ALTER COLUMN id SET DEFAULT nextval('ml_app.app_configuration_history_id_seq'::regclass);


--
-- Name: app_configurations id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.app_configurations ALTER COLUMN id SET DEFAULT nextval('ml_app.app_configurations_id_seq'::regclass);


--
-- Name: app_type_history id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.app_type_history ALTER COLUMN id SET DEFAULT nextval('ml_app.app_type_history_id_seq'::regclass);


--
-- Name: app_types id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.app_types ALTER COLUMN id SET DEFAULT nextval('ml_app.app_types_id_seq'::regclass);


--
-- Name: college_history id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.college_history ALTER COLUMN id SET DEFAULT nextval('ml_app.college_history_id_seq'::regclass);


--
-- Name: colleges id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.colleges ALTER COLUMN id SET DEFAULT nextval('ml_app.colleges_id_seq'::regclass);


--
-- Name: config_libraries id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.config_libraries ALTER COLUMN id SET DEFAULT nextval('ml_app.config_libraries_id_seq'::regclass);


--
-- Name: config_library_history id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.config_library_history ALTER COLUMN id SET DEFAULT nextval('ml_app.config_library_history_id_seq'::regclass);


--
-- Name: delayed_jobs id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.delayed_jobs ALTER COLUMN id SET DEFAULT nextval('ml_app.delayed_jobs_id_seq'::regclass);


--
-- Name: dynamic_model_history id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.dynamic_model_history ALTER COLUMN id SET DEFAULT nextval('ml_app.dynamic_model_history_id_seq'::regclass);


--
-- Name: dynamic_models id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.dynamic_models ALTER COLUMN id SET DEFAULT nextval('ml_app.dynamic_models_id_seq'::regclass);


--
-- Name: exception_logs id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.exception_logs ALTER COLUMN id SET DEFAULT nextval('ml_app.exception_logs_id_seq'::regclass);


--
-- Name: external_identifier_history id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.external_identifier_history ALTER COLUMN id SET DEFAULT nextval('ml_app.external_identifier_history_id_seq'::regclass);


--
-- Name: external_identifiers id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.external_identifiers ALTER COLUMN id SET DEFAULT nextval('ml_app.external_identifiers_id_seq'::regclass);


--
-- Name: external_link_history id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.external_link_history ALTER COLUMN id SET DEFAULT nextval('ml_app.external_link_history_id_seq'::regclass);


--
-- Name: external_links id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.external_links ALTER COLUMN id SET DEFAULT nextval('ml_app.external_links_id_seq'::regclass);


--
-- Name: general_selection_history id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.general_selection_history ALTER COLUMN id SET DEFAULT nextval('ml_app.general_selection_history_id_seq'::regclass);


--
-- Name: general_selections id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.general_selections ALTER COLUMN id SET DEFAULT nextval('ml_app.general_selections_id_seq'::regclass);


--
-- Name: imports id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.imports ALTER COLUMN id SET DEFAULT nextval('ml_app.imports_id_seq'::regclass);


--
-- Name: imports_model_generators id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.imports_model_generators ALTER COLUMN id SET DEFAULT nextval('ml_app.imports_model_generators_id_seq'::regclass);


--
-- Name: item_flag_history id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.item_flag_history ALTER COLUMN id SET DEFAULT nextval('ml_app.item_flag_history_id_seq'::regclass);


--
-- Name: item_flag_name_history id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.item_flag_name_history ALTER COLUMN id SET DEFAULT nextval('ml_app.item_flag_name_history_id_seq'::regclass);


--
-- Name: item_flag_names id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.item_flag_names ALTER COLUMN id SET DEFAULT nextval('ml_app.item_flag_names_id_seq'::regclass);


--
-- Name: item_flags id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.item_flags ALTER COLUMN id SET DEFAULT nextval('ml_app.item_flags_id_seq'::regclass);


--
-- Name: manage_users id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.manage_users ALTER COLUMN id SET DEFAULT nextval('ml_app.manage_users_id_seq'::regclass);


--
-- Name: masters id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.masters ALTER COLUMN id SET DEFAULT nextval('ml_app.masters_id_seq'::regclass);


--
-- Name: message_notifications id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.message_notifications ALTER COLUMN id SET DEFAULT nextval('ml_app.message_notifications_id_seq'::regclass);


--
-- Name: message_template_history id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.message_template_history ALTER COLUMN id SET DEFAULT nextval('ml_app.message_template_history_id_seq'::regclass);


--
-- Name: message_templates id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.message_templates ALTER COLUMN id SET DEFAULT nextval('ml_app.message_templates_id_seq'::regclass);


--
-- Name: model_references id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.model_references ALTER COLUMN id SET DEFAULT nextval('ml_app.model_references_id_seq'::regclass);


--
-- Name: nfs_store_archived_file_history id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.nfs_store_archived_file_history ALTER COLUMN id SET DEFAULT nextval('ml_app.nfs_store_archived_file_history_id_seq'::regclass);


--
-- Name: nfs_store_archived_files id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.nfs_store_archived_files ALTER COLUMN id SET DEFAULT nextval('ml_app.nfs_store_archived_files_id_seq'::regclass);


--
-- Name: nfs_store_container_history id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.nfs_store_container_history ALTER COLUMN id SET DEFAULT nextval('ml_app.nfs_store_container_history_id_seq'::regclass);


--
-- Name: nfs_store_containers id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.nfs_store_containers ALTER COLUMN id SET DEFAULT nextval('ml_app.nfs_store_containers_id_seq'::regclass);


--
-- Name: nfs_store_downloads id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.nfs_store_downloads ALTER COLUMN id SET DEFAULT nextval('ml_app.nfs_store_downloads_id_seq'::regclass);


--
-- Name: nfs_store_filter_history id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.nfs_store_filter_history ALTER COLUMN id SET DEFAULT nextval('ml_app.nfs_store_filter_history_id_seq'::regclass);


--
-- Name: nfs_store_filters id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.nfs_store_filters ALTER COLUMN id SET DEFAULT nextval('ml_app.nfs_store_filters_id_seq'::regclass);


--
-- Name: nfs_store_imports id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.nfs_store_imports ALTER COLUMN id SET DEFAULT nextval('ml_app.nfs_store_imports_id_seq'::regclass);


--
-- Name: nfs_store_move_actions id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.nfs_store_move_actions ALTER COLUMN id SET DEFAULT nextval('ml_app.nfs_store_move_actions_id_seq'::regclass);


--
-- Name: nfs_store_stored_file_history id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.nfs_store_stored_file_history ALTER COLUMN id SET DEFAULT nextval('ml_app.nfs_store_stored_file_history_id_seq'::regclass);


--
-- Name: nfs_store_stored_files id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.nfs_store_stored_files ALTER COLUMN id SET DEFAULT nextval('ml_app.nfs_store_stored_files_id_seq'::regclass);


--
-- Name: nfs_store_trash_actions id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.nfs_store_trash_actions ALTER COLUMN id SET DEFAULT nextval('ml_app.nfs_store_trash_actions_id_seq'::regclass);


--
-- Name: nfs_store_uploads id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.nfs_store_uploads ALTER COLUMN id SET DEFAULT nextval('ml_app.nfs_store_uploads_id_seq'::regclass);


--
-- Name: nfs_store_user_file_actions id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.nfs_store_user_file_actions ALTER COLUMN id SET DEFAULT nextval('ml_app.nfs_store_user_file_actions_id_seq'::regclass);


--
-- Name: page_layout_history id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.page_layout_history ALTER COLUMN id SET DEFAULT nextval('ml_app.page_layout_history_id_seq'::regclass);


--
-- Name: page_layouts id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.page_layouts ALTER COLUMN id SET DEFAULT nextval('ml_app.page_layouts_id_seq'::regclass);


--
-- Name: player_contact_history id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.player_contact_history ALTER COLUMN id SET DEFAULT nextval('ml_app.player_contact_history_id_seq'::regclass);


--
-- Name: player_contacts id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.player_contacts ALTER COLUMN id SET DEFAULT nextval('ml_app.player_contacts_id_seq'::regclass);


--
-- Name: player_info_history id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.player_info_history ALTER COLUMN id SET DEFAULT nextval('ml_app.player_info_history_id_seq'::regclass);


--
-- Name: player_infos id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.player_infos ALTER COLUMN id SET DEFAULT nextval('ml_app.player_infos_id_seq'::regclass);


--
-- Name: pro_infos id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.pro_infos ALTER COLUMN id SET DEFAULT nextval('ml_app.pro_infos_id_seq'::regclass);


--
-- Name: protocol_event_history id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.protocol_event_history ALTER COLUMN id SET DEFAULT nextval('ml_app.protocol_event_history_id_seq'::regclass);


--
-- Name: protocol_events id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.protocol_events ALTER COLUMN id SET DEFAULT nextval('ml_app.protocol_events_id_seq'::regclass);


--
-- Name: protocol_history id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.protocol_history ALTER COLUMN id SET DEFAULT nextval('ml_app.protocol_history_id_seq'::regclass);


--
-- Name: protocols id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.protocols ALTER COLUMN id SET DEFAULT nextval('ml_app.protocols_id_seq'::regclass);


--
-- Name: rc_cis id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.rc_cis ALTER COLUMN id SET DEFAULT nextval('ml_app.rc_cis_id_seq'::regclass);


--
-- Name: rc_stage_cif_copy id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.rc_stage_cif_copy ALTER COLUMN id SET DEFAULT nextval('ml_app.rc_stage_cif_copy_id_seq'::regclass);


--
-- Name: report_history id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.report_history ALTER COLUMN id SET DEFAULT nextval('ml_app.report_history_id_seq'::regclass);


--
-- Name: reports id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.reports ALTER COLUMN id SET DEFAULT nextval('ml_app.reports_id_seq'::regclass);


--
-- Name: role_description_history id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.role_description_history ALTER COLUMN id SET DEFAULT nextval('ml_app.role_description_history_id_seq'::regclass);


--
-- Name: role_descriptions id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.role_descriptions ALTER COLUMN id SET DEFAULT nextval('ml_app.role_descriptions_id_seq'::regclass);


--
-- Name: sage_assignments id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.sage_assignments ALTER COLUMN id SET DEFAULT nextval('ml_app.sage_assignments_id_seq'::regclass);


--
-- Name: scantron_history id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.scantron_history ALTER COLUMN id SET DEFAULT nextval('ml_app.scantron_history_id_seq'::regclass);


--
-- Name: scantrons id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.scantrons ALTER COLUMN id SET DEFAULT nextval('ml_app.scantrons_id_seq'::regclass);


--
-- Name: sessions id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.sessions ALTER COLUMN id SET DEFAULT nextval('ml_app.sessions_id_seq'::regclass);


--
-- Name: sub_process_history id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.sub_process_history ALTER COLUMN id SET DEFAULT nextval('ml_app.sub_process_history_id_seq'::regclass);


--
-- Name: sub_processes id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.sub_processes ALTER COLUMN id SET DEFAULT nextval('ml_app.sub_processes_id_seq'::regclass);


--
-- Name: tracker_history id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.tracker_history ALTER COLUMN id SET DEFAULT nextval('ml_app.tracker_history_id_seq'::regclass);


--
-- Name: trackers id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.trackers ALTER COLUMN id SET DEFAULT nextval('ml_app.trackers_id_seq'::regclass);


--
-- Name: user_access_control_history id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.user_access_control_history ALTER COLUMN id SET DEFAULT nextval('ml_app.user_access_control_history_id_seq'::regclass);


--
-- Name: user_access_controls id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.user_access_controls ALTER COLUMN id SET DEFAULT nextval('ml_app.user_access_controls_id_seq'::regclass);


--
-- Name: user_action_logs id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.user_action_logs ALTER COLUMN id SET DEFAULT nextval('ml_app.user_action_logs_id_seq'::regclass);


--
-- Name: user_authorization_history id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.user_authorization_history ALTER COLUMN id SET DEFAULT nextval('ml_app.user_authorization_history_id_seq'::regclass);


--
-- Name: user_authorizations id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.user_authorizations ALTER COLUMN id SET DEFAULT nextval('ml_app.user_authorizations_id_seq'::regclass);


--
-- Name: user_description_history id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.user_description_history ALTER COLUMN id SET DEFAULT nextval('ml_app.user_description_history_id_seq'::regclass);


--
-- Name: user_descriptions id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.user_descriptions ALTER COLUMN id SET DEFAULT nextval('ml_app.user_descriptions_id_seq'::regclass);


--
-- Name: user_history id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.user_history ALTER COLUMN id SET DEFAULT nextval('ml_app.user_history_id_seq'::regclass);


--
-- Name: user_preferences id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.user_preferences ALTER COLUMN id SET DEFAULT nextval('ml_app.user_preferences_id_seq'::regclass);


--
-- Name: user_role_history id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.user_role_history ALTER COLUMN id SET DEFAULT nextval('ml_app.user_role_history_id_seq'::regclass);


--
-- Name: user_roles id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.user_roles ALTER COLUMN id SET DEFAULT nextval('ml_app.user_roles_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.users ALTER COLUMN id SET DEFAULT nextval('ml_app.users_id_seq'::regclass);


--
-- Name: users_contact_infos id; Type: DEFAULT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.users_contact_infos ALTER COLUMN id SET DEFAULT nextval('ml_app.users_contact_infos_id_seq'::regclass);


--
-- Name: q2_demo_rc_history id; Type: DEFAULT; Schema: redcap; Owner: -
--

ALTER TABLE ONLY redcap.q2_demo_rc_history ALTER COLUMN id SET DEFAULT nextval('redcap.q2_demo_rc_history_id_seq'::regclass);


--
-- Name: q2_demo_rcs id; Type: DEFAULT; Schema: redcap; Owner: -
--

ALTER TABLE ONLY redcap.q2_demo_rcs ALTER COLUMN id SET DEFAULT nextval('redcap.q2_demo_rcs_id_seq'::regclass);


--
-- Name: viva_meta_variable_history id; Type: DEFAULT; Schema: redcap; Owner: -
--

ALTER TABLE ONLY redcap.viva_meta_variable_history ALTER COLUMN id SET DEFAULT nextval('redcap.viva_meta_variable_history_id_seq'::regclass);


--
-- Name: viva_meta_variables id; Type: DEFAULT; Schema: redcap; Owner: -
--

ALTER TABLE ONLY redcap.viva_meta_variables ALTER COLUMN id SET DEFAULT nextval('redcap.viva_meta_variables_id_seq'::regclass);


--
-- Name: datadic_choice_history id; Type: DEFAULT; Schema: ref_data; Owner: -
--

ALTER TABLE ONLY ref_data.datadic_choice_history ALTER COLUMN id SET DEFAULT nextval('ref_data.datadic_choice_history_id_seq'::regclass);


--
-- Name: datadic_choices id; Type: DEFAULT; Schema: ref_data; Owner: -
--

ALTER TABLE ONLY ref_data.datadic_choices ALTER COLUMN id SET DEFAULT nextval('ref_data.datadic_choices_id_seq'::regclass);


--
-- Name: datadic_variable_history id; Type: DEFAULT; Schema: ref_data; Owner: -
--

ALTER TABLE ONLY ref_data.datadic_variable_history ALTER COLUMN id SET DEFAULT nextval('ref_data.datadic_variable_history_id_seq'::regclass);


--
-- Name: datadic_variables id; Type: DEFAULT; Schema: ref_data; Owner: -
--

ALTER TABLE ONLY ref_data.datadic_variables ALTER COLUMN id SET DEFAULT nextval('ref_data.datadic_variables_id_seq'::regclass);


--
-- Name: redcap_client_requests id; Type: DEFAULT; Schema: ref_data; Owner: -
--

ALTER TABLE ONLY ref_data.redcap_client_requests ALTER COLUMN id SET DEFAULT nextval('ref_data.redcap_client_requests_id_seq'::regclass);


--
-- Name: redcap_data_collection_instrument_history id; Type: DEFAULT; Schema: ref_data; Owner: -
--

ALTER TABLE ONLY ref_data.redcap_data_collection_instrument_history ALTER COLUMN id SET DEFAULT nextval('ref_data.redcap_data_collection_instrument_history_id_seq'::regclass);


--
-- Name: redcap_data_collection_instruments id; Type: DEFAULT; Schema: ref_data; Owner: -
--

ALTER TABLE ONLY ref_data.redcap_data_collection_instruments ALTER COLUMN id SET DEFAULT nextval('ref_data.redcap_data_collection_instruments_id_seq'::regclass);


--
-- Name: redcap_data_dictionaries id; Type: DEFAULT; Schema: ref_data; Owner: -
--

ALTER TABLE ONLY ref_data.redcap_data_dictionaries ALTER COLUMN id SET DEFAULT nextval('ref_data.redcap_data_dictionaries_id_seq'::regclass);


--
-- Name: redcap_data_dictionary_history id; Type: DEFAULT; Schema: ref_data; Owner: -
--

ALTER TABLE ONLY ref_data.redcap_data_dictionary_history ALTER COLUMN id SET DEFAULT nextval('ref_data.redcap_data_dictionary_history_id_seq'::regclass);


--
-- Name: redcap_project_admin_history id; Type: DEFAULT; Schema: ref_data; Owner: -
--

ALTER TABLE ONLY ref_data.redcap_project_admin_history ALTER COLUMN id SET DEFAULT nextval('ref_data.redcap_project_admin_history_id_seq'::regclass);


--
-- Name: redcap_project_admins id; Type: DEFAULT; Schema: ref_data; Owner: -
--

ALTER TABLE ONLY ref_data.redcap_project_admins ALTER COLUMN id SET DEFAULT nextval('ref_data.redcap_project_admins_id_seq'::regclass);


--
-- Name: redcap_project_user_history id; Type: DEFAULT; Schema: ref_data; Owner: -
--

ALTER TABLE ONLY ref_data.redcap_project_user_history ALTER COLUMN id SET DEFAULT nextval('ref_data.redcap_project_user_history_id_seq'::regclass);


--
-- Name: redcap_project_users id; Type: DEFAULT; Schema: ref_data; Owner: -
--

ALTER TABLE ONLY ref_data.redcap_project_users ALTER COLUMN id SET DEFAULT nextval('ref_data.redcap_project_users_id_seq'::regclass);


--
-- Name: activity_log_project_assignment_simple_test_history activity_log_project_assignment_simple_test_history_pkey; Type: CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.activity_log_project_assignment_simple_test_history
    ADD CONSTRAINT activity_log_project_assignment_simple_test_history_pkey PRIMARY KEY (id);


--
-- Name: activity_log_project_assignment_simple_tests activity_log_project_assignment_simple_tests_pkey; Type: CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.activity_log_project_assignment_simple_tests
    ADD CONSTRAINT activity_log_project_assignment_simple_tests_pkey PRIMARY KEY (id);


--
-- Name: project_import_history project_import_history_pkey; Type: CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.project_import_history
    ADD CONSTRAINT project_import_history_pkey PRIMARY KEY (id);


--
-- Name: project_imports project_imports_pkey; Type: CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.project_imports
    ADD CONSTRAINT project_imports_pkey PRIMARY KEY (id);


--
-- Name: test_field_history test_field_history_pkey; Type: CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_field_history
    ADD CONSTRAINT test_field_history_pkey PRIMARY KEY (id);


--
-- Name: test_fields test_fields_pkey; Type: CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_fields
    ADD CONSTRAINT test_fields_pkey PRIMARY KEY (id);


--
-- Name: test_history test_history_pkey; Type: CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_history
    ADD CONSTRAINT test_history_pkey PRIMARY KEY (id);


--
-- Name: test_model_b_embed_history test_model_b_embed_history_pkey; Type: CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_model_b_embed_history
    ADD CONSTRAINT test_model_b_embed_history_pkey PRIMARY KEY (id);


--
-- Name: test_model_b_embed_rec_history test_model_b_embed_rec_history_pkey; Type: CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_model_b_embed_rec_history
    ADD CONSTRAINT test_model_b_embed_rec_history_pkey PRIMARY KEY (id);


--
-- Name: test_model_b_embed_recs test_model_b_embed_recs_pkey; Type: CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_model_b_embed_recs
    ADD CONSTRAINT test_model_b_embed_recs_pkey PRIMARY KEY (id);


--
-- Name: test_model_b_embeds test_model_b_embeds_pkey; Type: CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_model_b_embeds
    ADD CONSTRAINT test_model_b_embeds_pkey PRIMARY KEY (id);


--
-- Name: test_model_c_embed_history test_model_c_embed_history_pkey; Type: CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_model_c_embed_history
    ADD CONSTRAINT test_model_c_embed_history_pkey PRIMARY KEY (id);


--
-- Name: test_model_c_embed_rec_history test_model_c_embed_rec_history_pkey; Type: CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_model_c_embed_rec_history
    ADD CONSTRAINT test_model_c_embed_rec_history_pkey PRIMARY KEY (id);


--
-- Name: test_model_c_embed_recs test_model_c_embed_recs_pkey; Type: CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_model_c_embed_recs
    ADD CONSTRAINT test_model_c_embed_recs_pkey PRIMARY KEY (id);


--
-- Name: test_model_c_embeds test_model_c_embeds_pkey; Type: CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_model_c_embeds
    ADD CONSTRAINT test_model_c_embeds_pkey PRIMARY KEY (id);


--
-- Name: test_model_embed_history test_model_embed_history_pkey; Type: CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_model_embed_history
    ADD CONSTRAINT test_model_embed_history_pkey PRIMARY KEY (id);


--
-- Name: test_model_embed_rec_history test_model_embed_rec_history_pkey; Type: CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_model_embed_rec_history
    ADD CONSTRAINT test_model_embed_rec_history_pkey PRIMARY KEY (id);


--
-- Name: test_model_embed_recs test_model_embed_recs_pkey; Type: CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_model_embed_recs
    ADD CONSTRAINT test_model_embed_recs_pkey PRIMARY KEY (id);


--
-- Name: test_model_embeds test_model_embeds_pkey; Type: CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_model_embeds
    ADD CONSTRAINT test_model_embeds_pkey PRIMARY KEY (id);


--
-- Name: test_ref_history test_ref_history_pkey; Type: CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_ref_history
    ADD CONSTRAINT test_ref_history_pkey PRIMARY KEY (id);


--
-- Name: test_reference_history test_reference_history_pkey; Type: CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_reference_history
    ADD CONSTRAINT test_reference_history_pkey PRIMARY KEY (id);


--
-- Name: test_references test_references_pkey; Type: CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_references
    ADD CONSTRAINT test_references_pkey PRIMARY KEY (id);


--
-- Name: test_refs test_refs_pkey; Type: CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_refs
    ADD CONSTRAINT test_refs_pkey PRIMARY KEY (id);


--
-- Name: test_time_history test_time_history_pkey; Type: CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_time_history
    ADD CONSTRAINT test_time_history_pkey PRIMARY KEY (id);


--
-- Name: test_times test_times_pkey; Type: CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_times
    ADD CONSTRAINT test_times_pkey PRIMARY KEY (id);


--
-- Name: tests tests_pkey; Type: CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.tests
    ADD CONSTRAINT tests_pkey PRIMARY KEY (id);


--
-- Name: grit_assignment_history grit_assignment_history_pkey; Type: CONSTRAINT; Schema: extra_app; Owner: -
--

ALTER TABLE ONLY extra_app.grit_assignment_history
    ADD CONSTRAINT grit_assignment_history_pkey PRIMARY KEY (id);


--
-- Name: grit_assignments grit_assignments_pkey; Type: CONSTRAINT; Schema: extra_app; Owner: -
--

ALTER TABLE ONLY extra_app.grit_assignments
    ADD CONSTRAINT grit_assignments_pkey PRIMARY KEY (id);


--
-- Name: pitt_bhi_assignment_history pitt_bhi_assignment_history_pkey; Type: CONSTRAINT; Schema: extra_app; Owner: -
--

ALTER TABLE ONLY extra_app.pitt_bhi_assignment_history
    ADD CONSTRAINT pitt_bhi_assignment_history_pkey PRIMARY KEY (id);


--
-- Name: pitt_bhi_assignments pitt_bhi_assignments_pkey; Type: CONSTRAINT; Schema: extra_app; Owner: -
--

ALTER TABLE ONLY extra_app.pitt_bhi_assignments
    ADD CONSTRAINT pitt_bhi_assignments_pkey PRIMARY KEY (id);


--
-- Name: sleep_assignment_history sleep_assignment_history_pkey; Type: CONSTRAINT; Schema: extra_app; Owner: -
--

ALTER TABLE ONLY extra_app.sleep_assignment_history
    ADD CONSTRAINT sleep_assignment_history_pkey PRIMARY KEY (id);


--
-- Name: sleep_assignments sleep_assignments_pkey; Type: CONSTRAINT; Schema: extra_app; Owner: -
--

ALTER TABLE ONLY extra_app.sleep_assignments
    ADD CONSTRAINT sleep_assignments_pkey PRIMARY KEY (id);


--
-- Name: accuracy_score_history accuracy_score_history_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.accuracy_score_history
    ADD CONSTRAINT accuracy_score_history_pkey PRIMARY KEY (id);


--
-- Name: accuracy_scores accuracy_scores_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.accuracy_scores
    ADD CONSTRAINT accuracy_scores_pkey PRIMARY KEY (id);


--
-- Name: activity_log_history activity_log_history_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.activity_log_history
    ADD CONSTRAINT activity_log_history_pkey PRIMARY KEY (id);


--
-- Name: activity_log_player_contact_phone_history activity_log_player_contact_phone_history_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.activity_log_player_contact_phone_history
    ADD CONSTRAINT activity_log_player_contact_phone_history_pkey PRIMARY KEY (id);


--
-- Name: activity_log_player_contact_phones activity_log_player_contact_phones_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.activity_log_player_contact_phones
    ADD CONSTRAINT activity_log_player_contact_phones_pkey PRIMARY KEY (id);


--
-- Name: activity_logs activity_logs_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.activity_logs
    ADD CONSTRAINT activity_logs_pkey PRIMARY KEY (id);


--
-- Name: address_history address_history_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.address_history
    ADD CONSTRAINT address_history_pkey PRIMARY KEY (id);


--
-- Name: addresses addresses_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (id);


--
-- Name: admin_action_logs admin_action_logs_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.admin_action_logs
    ADD CONSTRAINT admin_action_logs_pkey PRIMARY KEY (id);


--
-- Name: admin_history admin_history_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.admin_history
    ADD CONSTRAINT admin_history_pkey PRIMARY KEY (id);


--
-- Name: admins admins_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.admins
    ADD CONSTRAINT admins_pkey PRIMARY KEY (id);


--
-- Name: app_configuration_history app_configuration_history_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.app_configuration_history
    ADD CONSTRAINT app_configuration_history_pkey PRIMARY KEY (id);


--
-- Name: app_configurations app_configurations_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.app_configurations
    ADD CONSTRAINT app_configurations_pkey PRIMARY KEY (id);


--
-- Name: app_type_history app_type_history_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.app_type_history
    ADD CONSTRAINT app_type_history_pkey PRIMARY KEY (id);


--
-- Name: app_types app_types_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.app_types
    ADD CONSTRAINT app_types_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: college_history college_history_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.college_history
    ADD CONSTRAINT college_history_pkey PRIMARY KEY (id);


--
-- Name: colleges colleges_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.colleges
    ADD CONSTRAINT colleges_pkey PRIMARY KEY (id);


--
-- Name: config_libraries config_libraries_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.config_libraries
    ADD CONSTRAINT config_libraries_pkey PRIMARY KEY (id);


--
-- Name: config_library_history config_library_history_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.config_library_history
    ADD CONSTRAINT config_library_history_pkey PRIMARY KEY (id);


--
-- Name: delayed_jobs delayed_jobs_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.delayed_jobs
    ADD CONSTRAINT delayed_jobs_pkey PRIMARY KEY (id);


--
-- Name: dynamic_model_history dynamic_model_history_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.dynamic_model_history
    ADD CONSTRAINT dynamic_model_history_pkey PRIMARY KEY (id);


--
-- Name: dynamic_models dynamic_models_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.dynamic_models
    ADD CONSTRAINT dynamic_models_pkey PRIMARY KEY (id);


--
-- Name: exception_logs exception_logs_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.exception_logs
    ADD CONSTRAINT exception_logs_pkey PRIMARY KEY (id);


--
-- Name: external_identifier_history external_identifier_history_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.external_identifier_history
    ADD CONSTRAINT external_identifier_history_pkey PRIMARY KEY (id);


--
-- Name: external_identifiers external_identifiers_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.external_identifiers
    ADD CONSTRAINT external_identifiers_pkey PRIMARY KEY (id);


--
-- Name: external_link_history external_link_history_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.external_link_history
    ADD CONSTRAINT external_link_history_pkey PRIMARY KEY (id);


--
-- Name: external_links external_links_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.external_links
    ADD CONSTRAINT external_links_pkey PRIMARY KEY (id);


--
-- Name: general_selection_history general_selection_history_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.general_selection_history
    ADD CONSTRAINT general_selection_history_pkey PRIMARY KEY (id);


--
-- Name: general_selections general_selections_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.general_selections
    ADD CONSTRAINT general_selections_pkey PRIMARY KEY (id);


--
-- Name: imports_model_generators imports_model_generators_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.imports_model_generators
    ADD CONSTRAINT imports_model_generators_pkey PRIMARY KEY (id);


--
-- Name: imports imports_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.imports
    ADD CONSTRAINT imports_pkey PRIMARY KEY (id);


--
-- Name: item_flag_history item_flag_history_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.item_flag_history
    ADD CONSTRAINT item_flag_history_pkey PRIMARY KEY (id);


--
-- Name: item_flag_name_history item_flag_name_history_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.item_flag_name_history
    ADD CONSTRAINT item_flag_name_history_pkey PRIMARY KEY (id);


--
-- Name: item_flag_names item_flag_names_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.item_flag_names
    ADD CONSTRAINT item_flag_names_pkey PRIMARY KEY (id);


--
-- Name: item_flags item_flags_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.item_flags
    ADD CONSTRAINT item_flags_pkey PRIMARY KEY (id);


--
-- Name: manage_users manage_users_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.manage_users
    ADD CONSTRAINT manage_users_pkey PRIMARY KEY (id);


--
-- Name: masters masters_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.masters
    ADD CONSTRAINT masters_pkey PRIMARY KEY (id);


--
-- Name: message_notifications message_notifications_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.message_notifications
    ADD CONSTRAINT message_notifications_pkey PRIMARY KEY (id);


--
-- Name: message_template_history message_template_history_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.message_template_history
    ADD CONSTRAINT message_template_history_pkey PRIMARY KEY (id);


--
-- Name: message_templates message_templates_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.message_templates
    ADD CONSTRAINT message_templates_pkey PRIMARY KEY (id);


--
-- Name: model_references model_references_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.model_references
    ADD CONSTRAINT model_references_pkey PRIMARY KEY (id);


--
-- Name: nfs_store_archived_file_history nfs_store_archived_file_history_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.nfs_store_archived_file_history
    ADD CONSTRAINT nfs_store_archived_file_history_pkey PRIMARY KEY (id);


--
-- Name: nfs_store_archived_files nfs_store_archived_files_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.nfs_store_archived_files
    ADD CONSTRAINT nfs_store_archived_files_pkey PRIMARY KEY (id);


--
-- Name: nfs_store_container_history nfs_store_container_history_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.nfs_store_container_history
    ADD CONSTRAINT nfs_store_container_history_pkey PRIMARY KEY (id);


--
-- Name: nfs_store_containers nfs_store_containers_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.nfs_store_containers
    ADD CONSTRAINT nfs_store_containers_pkey PRIMARY KEY (id);


--
-- Name: nfs_store_downloads nfs_store_downloads_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.nfs_store_downloads
    ADD CONSTRAINT nfs_store_downloads_pkey PRIMARY KEY (id);


--
-- Name: nfs_store_filter_history nfs_store_filter_history_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.nfs_store_filter_history
    ADD CONSTRAINT nfs_store_filter_history_pkey PRIMARY KEY (id);


--
-- Name: nfs_store_filters nfs_store_filters_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.nfs_store_filters
    ADD CONSTRAINT nfs_store_filters_pkey PRIMARY KEY (id);


--
-- Name: nfs_store_imports nfs_store_imports_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.nfs_store_imports
    ADD CONSTRAINT nfs_store_imports_pkey PRIMARY KEY (id);


--
-- Name: nfs_store_move_actions nfs_store_move_actions_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.nfs_store_move_actions
    ADD CONSTRAINT nfs_store_move_actions_pkey PRIMARY KEY (id);


--
-- Name: nfs_store_stored_file_history nfs_store_stored_file_history_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.nfs_store_stored_file_history
    ADD CONSTRAINT nfs_store_stored_file_history_pkey PRIMARY KEY (id);


--
-- Name: nfs_store_stored_files nfs_store_stored_files_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.nfs_store_stored_files
    ADD CONSTRAINT nfs_store_stored_files_pkey PRIMARY KEY (id);


--
-- Name: nfs_store_trash_actions nfs_store_trash_actions_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.nfs_store_trash_actions
    ADD CONSTRAINT nfs_store_trash_actions_pkey PRIMARY KEY (id);


--
-- Name: nfs_store_uploads nfs_store_uploads_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.nfs_store_uploads
    ADD CONSTRAINT nfs_store_uploads_pkey PRIMARY KEY (id);


--
-- Name: nfs_store_user_file_actions nfs_store_user_file_actions_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.nfs_store_user_file_actions
    ADD CONSTRAINT nfs_store_user_file_actions_pkey PRIMARY KEY (id);


--
-- Name: page_layout_history page_layout_history_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.page_layout_history
    ADD CONSTRAINT page_layout_history_pkey PRIMARY KEY (id);


--
-- Name: page_layouts page_layouts_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.page_layouts
    ADD CONSTRAINT page_layouts_pkey PRIMARY KEY (id);


--
-- Name: player_contact_history player_contact_history_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.player_contact_history
    ADD CONSTRAINT player_contact_history_pkey PRIMARY KEY (id);


--
-- Name: player_contacts player_contacts_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.player_contacts
    ADD CONSTRAINT player_contacts_pkey PRIMARY KEY (id);


--
-- Name: player_info_history player_info_history_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.player_info_history
    ADD CONSTRAINT player_info_history_pkey PRIMARY KEY (id);


--
-- Name: player_infos player_infos_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.player_infos
    ADD CONSTRAINT player_infos_pkey PRIMARY KEY (id);


--
-- Name: pro_infos pro_infos_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.pro_infos
    ADD CONSTRAINT pro_infos_pkey PRIMARY KEY (id);


--
-- Name: protocol_event_history protocol_event_history_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.protocol_event_history
    ADD CONSTRAINT protocol_event_history_pkey PRIMARY KEY (id);


--
-- Name: protocol_events protocol_events_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.protocol_events
    ADD CONSTRAINT protocol_events_pkey PRIMARY KEY (id);


--
-- Name: protocol_history protocol_history_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.protocol_history
    ADD CONSTRAINT protocol_history_pkey PRIMARY KEY (id);


--
-- Name: protocols protocols_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.protocols
    ADD CONSTRAINT protocols_pkey PRIMARY KEY (id);


--
-- Name: rc_cis rc_cis_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.rc_cis
    ADD CONSTRAINT rc_cis_pkey PRIMARY KEY (id);


--
-- Name: rc_stage_cif_copy rc_stage_cif_copy_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.rc_stage_cif_copy
    ADD CONSTRAINT rc_stage_cif_copy_pkey PRIMARY KEY (id);


--
-- Name: report_history report_history_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.report_history
    ADD CONSTRAINT report_history_pkey PRIMARY KEY (id);


--
-- Name: reports reports_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.reports
    ADD CONSTRAINT reports_pkey PRIMARY KEY (id);


--
-- Name: role_description_history role_description_history_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.role_description_history
    ADD CONSTRAINT role_description_history_pkey PRIMARY KEY (id);


--
-- Name: role_descriptions role_descriptions_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.role_descriptions
    ADD CONSTRAINT role_descriptions_pkey PRIMARY KEY (id);


--
-- Name: sage_assignments sage_assignments_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.sage_assignments
    ADD CONSTRAINT sage_assignments_pkey PRIMARY KEY (id);


--
-- Name: scantron_history scantron_history_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.scantron_history
    ADD CONSTRAINT scantron_history_pkey PRIMARY KEY (id);


--
-- Name: scantrons scantrons_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.scantrons
    ADD CONSTRAINT scantrons_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: sub_process_history sub_process_history_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.sub_process_history
    ADD CONSTRAINT sub_process_history_pkey PRIMARY KEY (id);


--
-- Name: sub_processes sub_processes_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.sub_processes
    ADD CONSTRAINT sub_processes_pkey PRIMARY KEY (id);


--
-- Name: tracker_history tracker_history_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.tracker_history
    ADD CONSTRAINT tracker_history_pkey PRIMARY KEY (id);


--
-- Name: trackers trackers_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.trackers
    ADD CONSTRAINT trackers_pkey PRIMARY KEY (id);


--
-- Name: trackers unique_master_protocol; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.trackers
    ADD CONSTRAINT unique_master_protocol UNIQUE (master_id, protocol_id);


--
-- Name: trackers unique_master_protocol_id; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.trackers
    ADD CONSTRAINT unique_master_protocol_id UNIQUE (master_id, protocol_id, id);


--
-- Name: sub_processes unique_protocol_and_id; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.sub_processes
    ADD CONSTRAINT unique_protocol_and_id UNIQUE (protocol_id, id);


--
-- Name: protocol_events unique_sub_process_and_id; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.protocol_events
    ADD CONSTRAINT unique_sub_process_and_id UNIQUE (sub_process_id, id);


--
-- Name: user_access_control_history user_access_control_history_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.user_access_control_history
    ADD CONSTRAINT user_access_control_history_pkey PRIMARY KEY (id);


--
-- Name: user_access_controls user_access_controls_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.user_access_controls
    ADD CONSTRAINT user_access_controls_pkey PRIMARY KEY (id);


--
-- Name: user_action_logs user_action_logs_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.user_action_logs
    ADD CONSTRAINT user_action_logs_pkey PRIMARY KEY (id);


--
-- Name: user_authorization_history user_authorization_history_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.user_authorization_history
    ADD CONSTRAINT user_authorization_history_pkey PRIMARY KEY (id);


--
-- Name: user_authorizations user_authorizations_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.user_authorizations
    ADD CONSTRAINT user_authorizations_pkey PRIMARY KEY (id);


--
-- Name: user_description_history user_description_history_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.user_description_history
    ADD CONSTRAINT user_description_history_pkey PRIMARY KEY (id);


--
-- Name: user_descriptions user_descriptions_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.user_descriptions
    ADD CONSTRAINT user_descriptions_pkey PRIMARY KEY (id);


--
-- Name: user_history user_history_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.user_history
    ADD CONSTRAINT user_history_pkey PRIMARY KEY (id);


--
-- Name: user_preferences user_preferences_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.user_preferences
    ADD CONSTRAINT user_preferences_pkey PRIMARY KEY (id);


--
-- Name: user_role_history user_role_history_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.user_role_history
    ADD CONSTRAINT user_role_history_pkey PRIMARY KEY (id);


--
-- Name: user_roles user_roles_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (id);


--
-- Name: users_contact_infos users_contact_infos_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.users_contact_infos
    ADD CONSTRAINT users_contact_infos_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: q2_demo_rc_history q2_demo_rc_history_pkey; Type: CONSTRAINT; Schema: redcap; Owner: -
--

ALTER TABLE ONLY redcap.q2_demo_rc_history
    ADD CONSTRAINT q2_demo_rc_history_pkey PRIMARY KEY (id);


--
-- Name: q2_demo_rcs q2_demo_rcs_pkey; Type: CONSTRAINT; Schema: redcap; Owner: -
--

ALTER TABLE ONLY redcap.q2_demo_rcs
    ADD CONSTRAINT q2_demo_rcs_pkey PRIMARY KEY (id);


--
-- Name: viva_meta_variable_history viva_meta_variable_history_pkey; Type: CONSTRAINT; Schema: redcap; Owner: -
--

ALTER TABLE ONLY redcap.viva_meta_variable_history
    ADD CONSTRAINT viva_meta_variable_history_pkey PRIMARY KEY (id);


--
-- Name: viva_meta_variables viva_meta_variables_pkey; Type: CONSTRAINT; Schema: redcap; Owner: -
--

ALTER TABLE ONLY redcap.viva_meta_variables
    ADD CONSTRAINT viva_meta_variables_pkey PRIMARY KEY (id);


--
-- Name: datadic_choice_history datadic_choice_history_pkey; Type: CONSTRAINT; Schema: ref_data; Owner: -
--

ALTER TABLE ONLY ref_data.datadic_choice_history
    ADD CONSTRAINT datadic_choice_history_pkey PRIMARY KEY (id);


--
-- Name: datadic_choices datadic_choices_pkey; Type: CONSTRAINT; Schema: ref_data; Owner: -
--

ALTER TABLE ONLY ref_data.datadic_choices
    ADD CONSTRAINT datadic_choices_pkey PRIMARY KEY (id);


--
-- Name: datadic_variable_history datadic_variable_history_pkey; Type: CONSTRAINT; Schema: ref_data; Owner: -
--

ALTER TABLE ONLY ref_data.datadic_variable_history
    ADD CONSTRAINT datadic_variable_history_pkey PRIMARY KEY (id);


--
-- Name: datadic_variables datadic_variables_pkey; Type: CONSTRAINT; Schema: ref_data; Owner: -
--

ALTER TABLE ONLY ref_data.datadic_variables
    ADD CONSTRAINT datadic_variables_pkey PRIMARY KEY (id);


--
-- Name: redcap_client_requests redcap_client_requests_pkey; Type: CONSTRAINT; Schema: ref_data; Owner: -
--

ALTER TABLE ONLY ref_data.redcap_client_requests
    ADD CONSTRAINT redcap_client_requests_pkey PRIMARY KEY (id);


--
-- Name: redcap_data_collection_instrument_history redcap_data_collection_instrument_history_pkey; Type: CONSTRAINT; Schema: ref_data; Owner: -
--

ALTER TABLE ONLY ref_data.redcap_data_collection_instrument_history
    ADD CONSTRAINT redcap_data_collection_instrument_history_pkey PRIMARY KEY (id);


--
-- Name: redcap_data_collection_instruments redcap_data_collection_instruments_pkey; Type: CONSTRAINT; Schema: ref_data; Owner: -
--

ALTER TABLE ONLY ref_data.redcap_data_collection_instruments
    ADD CONSTRAINT redcap_data_collection_instruments_pkey PRIMARY KEY (id);


--
-- Name: redcap_data_dictionaries redcap_data_dictionaries_pkey; Type: CONSTRAINT; Schema: ref_data; Owner: -
--

ALTER TABLE ONLY ref_data.redcap_data_dictionaries
    ADD CONSTRAINT redcap_data_dictionaries_pkey PRIMARY KEY (id);


--
-- Name: redcap_data_dictionary_history redcap_data_dictionary_history_pkey; Type: CONSTRAINT; Schema: ref_data; Owner: -
--

ALTER TABLE ONLY ref_data.redcap_data_dictionary_history
    ADD CONSTRAINT redcap_data_dictionary_history_pkey PRIMARY KEY (id);


--
-- Name: redcap_project_admin_history redcap_project_admin_history_pkey; Type: CONSTRAINT; Schema: ref_data; Owner: -
--

ALTER TABLE ONLY ref_data.redcap_project_admin_history
    ADD CONSTRAINT redcap_project_admin_history_pkey PRIMARY KEY (id);


--
-- Name: redcap_project_admins redcap_project_admins_pkey; Type: CONSTRAINT; Schema: ref_data; Owner: -
--

ALTER TABLE ONLY ref_data.redcap_project_admins
    ADD CONSTRAINT redcap_project_admins_pkey PRIMARY KEY (id);


--
-- Name: redcap_project_user_history redcap_project_user_history_pkey; Type: CONSTRAINT; Schema: ref_data; Owner: -
--

ALTER TABLE ONLY ref_data.redcap_project_user_history
    ADD CONSTRAINT redcap_project_user_history_pkey PRIMARY KEY (id);


--
-- Name: redcap_project_users redcap_project_users_pkey; Type: CONSTRAINT; Schema: ref_data; Owner: -
--

ALTER TABLE ONLY ref_data.redcap_project_users
    ADD CONSTRAINT redcap_project_users_pkey PRIMARY KEY (id);


--
-- Name: 0fff5988_id_idx; Type: INDEX; Schema: dynamic; Owner: -
--

CREATE INDEX "0fff5988_id_idx" ON dynamic.test_time_history USING btree (test_time_id);


--
-- Name: 0fff5988_user_idx; Type: INDEX; Schema: dynamic; Owner: -
--

CREATE INDEX "0fff5988_user_idx" ON dynamic.test_time_history USING btree (user_id);


--
-- Name: 141f0d5d_history_master_id; Type: INDEX; Schema: dynamic; Owner: -
--

CREATE INDEX "141f0d5d_history_master_id" ON dynamic.test_model_embed_rec_history USING btree (master_id);


--
-- Name: 141f0d5d_id_idx; Type: INDEX; Schema: dynamic; Owner: -
--

CREATE INDEX "141f0d5d_id_idx" ON dynamic.test_model_embed_rec_history USING btree (test_model_embed_rec_id);


--
-- Name: 141f0d5d_user_idx; Type: INDEX; Schema: dynamic; Owner: -
--

CREATE INDEX "141f0d5d_user_idx" ON dynamic.test_model_embed_rec_history USING btree (user_id);


--
-- Name: 2bfd2db3_history_master_id; Type: INDEX; Schema: dynamic; Owner: -
--

CREATE INDEX "2bfd2db3_history_master_id" ON dynamic.test_reference_history USING btree (master_id);


--
-- Name: 2bfd2db3_id_idx; Type: INDEX; Schema: dynamic; Owner: -
--

CREATE INDEX "2bfd2db3_id_idx" ON dynamic.test_reference_history USING btree (test_reference_id);


--
-- Name: 2bfd2db3_user_idx; Type: INDEX; Schema: dynamic; Owner: -
--

CREATE INDEX "2bfd2db3_user_idx" ON dynamic.test_reference_history USING btree (user_id);


--
-- Name: 37242a79_hist_user_idx; Type: INDEX; Schema: dynamic; Owner: -
--

CREATE INDEX "37242a79_hist_user_idx" ON dynamic.project_import_history USING btree (user_id);


--
-- Name: 37242a79_history_master_id; Type: INDEX; Schema: dynamic; Owner: -
--

CREATE INDEX "37242a79_history_master_id" ON dynamic.project_import_history USING btree (master_id);


--
-- Name: 37242a79_id_idx; Type: INDEX; Schema: dynamic; Owner: -
--

CREATE INDEX "37242a79_id_idx" ON dynamic.project_import_history USING btree (project_import_id);


--
-- Name: 37242a79_user_idx; Type: INDEX; Schema: dynamic; Owner: -
--

CREATE INDEX "37242a79_user_idx" ON dynamic.project_imports USING btree (user_id);


--
-- Name: 5decc062_history_master_id; Type: INDEX; Schema: dynamic; Owner: -
--

CREATE INDEX "5decc062_history_master_id" ON dynamic.test_model_embed_history USING btree (master_id);


--
-- Name: 5decc062_id_idx; Type: INDEX; Schema: dynamic; Owner: -
--

CREATE INDEX "5decc062_id_idx" ON dynamic.test_model_embed_history USING btree (test_model_embed_id);


--
-- Name: 5decc062_user_idx; Type: INDEX; Schema: dynamic; Owner: -
--

CREATE INDEX "5decc062_user_idx" ON dynamic.test_model_embed_history USING btree (user_id);


--
-- Name: 760dfeb3_id_idx; Type: INDEX; Schema: dynamic; Owner: -
--

CREATE INDEX "760dfeb3_id_idx" ON dynamic.test_history USING btree (test_id);


--
-- Name: 760dfeb3_user_idx; Type: INDEX; Schema: dynamic; Owner: -
--

CREATE INDEX "760dfeb3_user_idx" ON dynamic.test_history USING btree (user_id);


--
-- Name: 887f23f4_history_master_id; Type: INDEX; Schema: dynamic; Owner: -
--

CREATE INDEX "887f23f4_history_master_id" ON dynamic.test_model_c_embed_rec_history USING btree (master_id);


--
-- Name: 887f23f4_id_idx; Type: INDEX; Schema: dynamic; Owner: -
--

CREATE INDEX "887f23f4_id_idx" ON dynamic.test_model_c_embed_rec_history USING btree (test_model_c_embed_rec_id);


--
-- Name: 887f23f4_user_idx; Type: INDEX; Schema: dynamic; Owner: -
--

CREATE INDEX "887f23f4_user_idx" ON dynamic.test_model_c_embed_rec_history USING btree (user_id);


--
-- Name: 952909c1_history_master_id; Type: INDEX; Schema: dynamic; Owner: -
--

CREATE INDEX "952909c1_history_master_id" ON dynamic.test_field_history USING btree (master_id);


--
-- Name: 952909c1_id_idx; Type: INDEX; Schema: dynamic; Owner: -
--

CREATE INDEX "952909c1_id_idx" ON dynamic.test_field_history USING btree (test_field_id);


--
-- Name: 952909c1_user_idx; Type: INDEX; Schema: dynamic; Owner: -
--

CREATE INDEX "952909c1_user_idx" ON dynamic.test_field_history USING btree (user_id);


--
-- Name: b82b3567_id_idx; Type: INDEX; Schema: dynamic; Owner: -
--

CREATE INDEX b82b3567_id_idx ON dynamic.test_ref_history USING btree (test_ref_id);


--
-- Name: b82b3567_user_idx; Type: INDEX; Schema: dynamic; Owner: -
--

CREATE INDEX b82b3567_user_idx ON dynamic.test_ref_history USING btree (user_id);


--
-- Name: bac47159_b_id_h_idx; Type: INDEX; Schema: dynamic; Owner: -
--

CREATE INDEX bac47159_b_id_h_idx ON dynamic.activity_log_project_assignment_simple_test_history USING btree (activity_log_project_assignment_simple_test_id);


--
-- Name: bac47159_id_h_idx; Type: INDEX; Schema: dynamic; Owner: -
--

CREATE INDEX bac47159_id_h_idx ON dynamic.activity_log_project_assignment_simple_test_history USING btree (project_assignment_id);


--
-- Name: bac47159_id_idx; Type: INDEX; Schema: dynamic; Owner: -
--

CREATE INDEX bac47159_id_idx ON dynamic.activity_log_project_assignment_simple_tests USING btree (project_assignment_id);


--
-- Name: bac47159_master_id_h_idx; Type: INDEX; Schema: dynamic; Owner: -
--

CREATE INDEX bac47159_master_id_h_idx ON dynamic.activity_log_project_assignment_simple_test_history USING btree (master_id);


--
-- Name: bac47159_master_id_idx; Type: INDEX; Schema: dynamic; Owner: -
--

CREATE INDEX bac47159_master_id_idx ON dynamic.activity_log_project_assignment_simple_tests USING btree (master_id);


--
-- Name: bac47159_ref_cb_user_idx; Type: INDEX; Schema: dynamic; Owner: -
--

CREATE INDEX bac47159_ref_cb_user_idx ON dynamic.activity_log_project_assignment_simple_tests USING btree (created_by_user_id);


--
-- Name: bac47159_ref_cb_user_idx_hist; Type: INDEX; Schema: dynamic; Owner: -
--

CREATE INDEX bac47159_ref_cb_user_idx_hist ON dynamic.activity_log_project_assignment_simple_test_history USING btree (created_by_user_id);


--
-- Name: bac47159_user_id_h_idx; Type: INDEX; Schema: dynamic; Owner: -
--

CREATE INDEX bac47159_user_id_h_idx ON dynamic.activity_log_project_assignment_simple_test_history USING btree (user_id);


--
-- Name: bac47159_user_id_idx; Type: INDEX; Schema: dynamic; Owner: -
--

CREATE INDEX bac47159_user_id_idx ON dynamic.activity_log_project_assignment_simple_tests USING btree (user_id);


--
-- Name: c09350cb_history_master_id; Type: INDEX; Schema: dynamic; Owner: -
--

CREATE INDEX c09350cb_history_master_id ON dynamic.test_model_c_embed_history USING btree (master_id);


--
-- Name: c09350cb_id_idx; Type: INDEX; Schema: dynamic; Owner: -
--

CREATE INDEX c09350cb_id_idx ON dynamic.test_model_c_embed_history USING btree (test_model_c_embed_id);


--
-- Name: c09350cb_user_idx; Type: INDEX; Schema: dynamic; Owner: -
--

CREATE INDEX c09350cb_user_idx ON dynamic.test_model_c_embed_history USING btree (user_id);


--
-- Name: ce2747ad_history_master_id; Type: INDEX; Schema: dynamic; Owner: -
--

CREATE INDEX ce2747ad_history_master_id ON dynamic.test_model_b_embed_rec_history USING btree (master_id);


--
-- Name: ce2747ad_id_idx; Type: INDEX; Schema: dynamic; Owner: -
--

CREATE INDEX ce2747ad_id_idx ON dynamic.test_model_b_embed_rec_history USING btree (test_model_b_embed_rec_id);


--
-- Name: ce2747ad_user_idx; Type: INDEX; Schema: dynamic; Owner: -
--

CREATE INDEX ce2747ad_user_idx ON dynamic.test_model_b_embed_rec_history USING btree (user_id);


--
-- Name: dmbt_141f0d5d_id_idx; Type: INDEX; Schema: dynamic; Owner: -
--

CREATE INDEX dmbt_141f0d5d_id_idx ON dynamic.test_model_embed_recs USING btree (master_id);


--
-- Name: dmbt_2bfd2db3_id_idx; Type: INDEX; Schema: dynamic; Owner: -
--

CREATE INDEX dmbt_2bfd2db3_id_idx ON dynamic.test_references USING btree (master_id);


--
-- Name: dmbt_37242a79_id_idx; Type: INDEX; Schema: dynamic; Owner: -
--

CREATE INDEX dmbt_37242a79_id_idx ON dynamic.project_imports USING btree (master_id);


--
-- Name: dmbt_5decc062_id_idx; Type: INDEX; Schema: dynamic; Owner: -
--

CREATE INDEX dmbt_5decc062_id_idx ON dynamic.test_model_embeds USING btree (master_id);


--
-- Name: dmbt_887f23f4_id_idx; Type: INDEX; Schema: dynamic; Owner: -
--

CREATE INDEX dmbt_887f23f4_id_idx ON dynamic.test_model_c_embed_recs USING btree (master_id);


--
-- Name: dmbt_952909c1_id_idx; Type: INDEX; Schema: dynamic; Owner: -
--

CREATE INDEX dmbt_952909c1_id_idx ON dynamic.test_fields USING btree (master_id);


--
-- Name: dmbt_c09350cb_id_idx; Type: INDEX; Schema: dynamic; Owner: -
--

CREATE INDEX dmbt_c09350cb_id_idx ON dynamic.test_model_c_embeds USING btree (master_id);


--
-- Name: dmbt_ce2747ad_id_idx; Type: INDEX; Schema: dynamic; Owner: -
--

CREATE INDEX dmbt_ce2747ad_id_idx ON dynamic.test_model_b_embed_recs USING btree (master_id);


--
-- Name: dmbt_fb044a0f_id_idx; Type: INDEX; Schema: dynamic; Owner: -
--

CREATE INDEX dmbt_fb044a0f_id_idx ON dynamic.test_model_b_embeds USING btree (master_id);


--
-- Name: fb044a0f_history_master_id; Type: INDEX; Schema: dynamic; Owner: -
--

CREATE INDEX fb044a0f_history_master_id ON dynamic.test_model_b_embed_history USING btree (master_id);


--
-- Name: fb044a0f_id_idx; Type: INDEX; Schema: dynamic; Owner: -
--

CREATE INDEX fb044a0f_id_idx ON dynamic.test_model_b_embed_history USING btree (test_model_b_embed_id);


--
-- Name: fb044a0f_user_idx; Type: INDEX; Schema: dynamic; Owner: -
--

CREATE INDEX fb044a0f_user_idx ON dynamic.test_model_b_embed_history USING btree (user_id);


--
-- Name: index_dynamic.test_fields_on_user_id; Type: INDEX; Schema: dynamic; Owner: -
--

CREATE INDEX "index_dynamic.test_fields_on_user_id" ON dynamic.test_fields USING btree (user_id);


--
-- Name: index_dynamic.test_model_b_embed_recs_on_user_id; Type: INDEX; Schema: dynamic; Owner: -
--

CREATE INDEX "index_dynamic.test_model_b_embed_recs_on_user_id" ON dynamic.test_model_b_embed_recs USING btree (user_id);


--
-- Name: index_dynamic.test_model_b_embeds_on_user_id; Type: INDEX; Schema: dynamic; Owner: -
--

CREATE INDEX "index_dynamic.test_model_b_embeds_on_user_id" ON dynamic.test_model_b_embeds USING btree (user_id);


--
-- Name: index_dynamic.test_model_c_embed_recs_on_user_id; Type: INDEX; Schema: dynamic; Owner: -
--

CREATE INDEX "index_dynamic.test_model_c_embed_recs_on_user_id" ON dynamic.test_model_c_embed_recs USING btree (user_id);


--
-- Name: index_dynamic.test_model_c_embeds_on_user_id; Type: INDEX; Schema: dynamic; Owner: -
--

CREATE INDEX "index_dynamic.test_model_c_embeds_on_user_id" ON dynamic.test_model_c_embeds USING btree (user_id);


--
-- Name: index_dynamic.test_model_embed_recs_on_user_id; Type: INDEX; Schema: dynamic; Owner: -
--

CREATE INDEX "index_dynamic.test_model_embed_recs_on_user_id" ON dynamic.test_model_embed_recs USING btree (user_id);


--
-- Name: index_dynamic.test_model_embeds_on_user_id; Type: INDEX; Schema: dynamic; Owner: -
--

CREATE INDEX "index_dynamic.test_model_embeds_on_user_id" ON dynamic.test_model_embeds USING btree (user_id);


--
-- Name: index_dynamic.test_references_on_user_id; Type: INDEX; Schema: dynamic; Owner: -
--

CREATE INDEX "index_dynamic.test_references_on_user_id" ON dynamic.test_references USING btree (user_id);


--
-- Name: index_dynamic.test_refs_on_user_id; Type: INDEX; Schema: dynamic; Owner: -
--

CREATE INDEX "index_dynamic.test_refs_on_user_id" ON dynamic.test_refs USING btree (user_id);


--
-- Name: index_dynamic.test_times_on_user_id; Type: INDEX; Schema: dynamic; Owner: -
--

CREATE INDEX "index_dynamic.test_times_on_user_id" ON dynamic.test_times USING btree (user_id);


--
-- Name: index_dynamic.tests_on_user_id; Type: INDEX; Schema: dynamic; Owner: -
--

CREATE INDEX "index_dynamic.tests_on_user_id" ON dynamic.tests USING btree (user_id);


--
-- Name: grit_assignment_id_idx; Type: INDEX; Schema: extra_app; Owner: -
--

CREATE INDEX grit_assignment_id_idx ON extra_app.grit_assignment_history USING btree (grit_assignment_table_id);


--
-- Name: index_extra_app.grit_assignment_history_on_admin_id; Type: INDEX; Schema: extra_app; Owner: -
--

CREATE INDEX "index_extra_app.grit_assignment_history_on_admin_id" ON extra_app.grit_assignment_history USING btree (admin_id);


--
-- Name: index_extra_app.grit_assignment_history_on_master_id; Type: INDEX; Schema: extra_app; Owner: -
--

CREATE INDEX "index_extra_app.grit_assignment_history_on_master_id" ON extra_app.grit_assignment_history USING btree (master_id);


--
-- Name: index_extra_app.grit_assignment_history_on_user_id; Type: INDEX; Schema: extra_app; Owner: -
--

CREATE INDEX "index_extra_app.grit_assignment_history_on_user_id" ON extra_app.grit_assignment_history USING btree (user_id);


--
-- Name: index_extra_app.grit_assignments_on_admin_id; Type: INDEX; Schema: extra_app; Owner: -
--

CREATE INDEX "index_extra_app.grit_assignments_on_admin_id" ON extra_app.grit_assignments USING btree (admin_id);


--
-- Name: index_extra_app.grit_assignments_on_master_id; Type: INDEX; Schema: extra_app; Owner: -
--

CREATE INDEX "index_extra_app.grit_assignments_on_master_id" ON extra_app.grit_assignments USING btree (master_id);


--
-- Name: index_extra_app.grit_assignments_on_user_id; Type: INDEX; Schema: extra_app; Owner: -
--

CREATE INDEX "index_extra_app.grit_assignments_on_user_id" ON extra_app.grit_assignments USING btree (user_id);


--
-- Name: index_extra_app.pitt_bhi_assignment_history_on_admin_id; Type: INDEX; Schema: extra_app; Owner: -
--

CREATE INDEX "index_extra_app.pitt_bhi_assignment_history_on_admin_id" ON extra_app.pitt_bhi_assignment_history USING btree (admin_id);


--
-- Name: index_extra_app.pitt_bhi_assignment_history_on_master_id; Type: INDEX; Schema: extra_app; Owner: -
--

CREATE INDEX "index_extra_app.pitt_bhi_assignment_history_on_master_id" ON extra_app.pitt_bhi_assignment_history USING btree (master_id);


--
-- Name: index_extra_app.pitt_bhi_assignment_history_on_user_id; Type: INDEX; Schema: extra_app; Owner: -
--

CREATE INDEX "index_extra_app.pitt_bhi_assignment_history_on_user_id" ON extra_app.pitt_bhi_assignment_history USING btree (user_id);


--
-- Name: index_extra_app.pitt_bhi_assignments_on_admin_id; Type: INDEX; Schema: extra_app; Owner: -
--

CREATE INDEX "index_extra_app.pitt_bhi_assignments_on_admin_id" ON extra_app.pitt_bhi_assignments USING btree (admin_id);


--
-- Name: index_extra_app.pitt_bhi_assignments_on_master_id; Type: INDEX; Schema: extra_app; Owner: -
--

CREATE INDEX "index_extra_app.pitt_bhi_assignments_on_master_id" ON extra_app.pitt_bhi_assignments USING btree (master_id);


--
-- Name: index_extra_app.pitt_bhi_assignments_on_user_id; Type: INDEX; Schema: extra_app; Owner: -
--

CREATE INDEX "index_extra_app.pitt_bhi_assignments_on_user_id" ON extra_app.pitt_bhi_assignments USING btree (user_id);


--
-- Name: index_extra_app.sleep_assignment_history_on_admin_id; Type: INDEX; Schema: extra_app; Owner: -
--

CREATE INDEX "index_extra_app.sleep_assignment_history_on_admin_id" ON extra_app.sleep_assignment_history USING btree (admin_id);


--
-- Name: index_extra_app.sleep_assignment_history_on_master_id; Type: INDEX; Schema: extra_app; Owner: -
--

CREATE INDEX "index_extra_app.sleep_assignment_history_on_master_id" ON extra_app.sleep_assignment_history USING btree (master_id);


--
-- Name: index_extra_app.sleep_assignment_history_on_user_id; Type: INDEX; Schema: extra_app; Owner: -
--

CREATE INDEX "index_extra_app.sleep_assignment_history_on_user_id" ON extra_app.sleep_assignment_history USING btree (user_id);


--
-- Name: index_extra_app.sleep_assignments_on_admin_id; Type: INDEX; Schema: extra_app; Owner: -
--

CREATE INDEX "index_extra_app.sleep_assignments_on_admin_id" ON extra_app.sleep_assignments USING btree (admin_id);


--
-- Name: index_extra_app.sleep_assignments_on_master_id; Type: INDEX; Schema: extra_app; Owner: -
--

CREATE INDEX "index_extra_app.sleep_assignments_on_master_id" ON extra_app.sleep_assignments USING btree (master_id);


--
-- Name: index_extra_app.sleep_assignments_on_user_id; Type: INDEX; Schema: extra_app; Owner: -
--

CREATE INDEX "index_extra_app.sleep_assignments_on_user_id" ON extra_app.sleep_assignments USING btree (user_id);


--
-- Name: pitt_bhi_assignment_id_idx; Type: INDEX; Schema: extra_app; Owner: -
--

CREATE INDEX pitt_bhi_assignment_id_idx ON extra_app.pitt_bhi_assignment_history USING btree (pitt_bhi_assignment_table_id);


--
-- Name: sleep_assignment_id_idx; Type: INDEX; Schema: extra_app; Owner: -
--

CREATE INDEX sleep_assignment_id_idx ON extra_app.sleep_assignment_history USING btree (sleep_assignment_table_id);


--
-- Name: delayed_jobs_priority; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX delayed_jobs_priority ON ml_app.delayed_jobs USING btree (priority, run_at);


--
-- Name: idx_h_on_role_descriptions_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX idx_h_on_role_descriptions_id ON ml_app.role_description_history USING btree (role_description_id);


--
-- Name: idx_h_on_user_descriptions_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX idx_h_on_user_descriptions_id ON ml_app.user_description_history USING btree (user_description_id);


--
-- Name: index_accuracy_score_history_on_accuracy_score_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_accuracy_score_history_on_accuracy_score_id ON ml_app.accuracy_score_history USING btree (accuracy_score_id);


--
-- Name: index_accuracy_scores_on_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_accuracy_scores_on_admin_id ON ml_app.accuracy_scores USING btree (admin_id);


--
-- Name: index_activity_log_history_on_activity_log_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_activity_log_history_on_activity_log_id ON ml_app.activity_log_history USING btree (activity_log_id);


--
-- Name: index_activity_log_player_contact_phone_history_on_activity_log; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_activity_log_player_contact_phone_history_on_activity_log ON ml_app.activity_log_player_contact_phone_history USING btree (activity_log_player_contact_phone_id);


--
-- Name: index_activity_log_player_contact_phone_history_on_master_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_activity_log_player_contact_phone_history_on_master_id ON ml_app.activity_log_player_contact_phone_history USING btree (master_id);


--
-- Name: index_activity_log_player_contact_phone_history_on_player_conta; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_activity_log_player_contact_phone_history_on_player_conta ON ml_app.activity_log_player_contact_phone_history USING btree (player_contact_id);


--
-- Name: index_activity_log_player_contact_phone_history_on_user_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_activity_log_player_contact_phone_history_on_user_id ON ml_app.activity_log_player_contact_phone_history USING btree (user_id);


--
-- Name: index_activity_log_player_contact_phones_on_master_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_activity_log_player_contact_phones_on_master_id ON ml_app.activity_log_player_contact_phones USING btree (master_id);


--
-- Name: index_activity_log_player_contact_phones_on_player_contact_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_activity_log_player_contact_phones_on_player_contact_id ON ml_app.activity_log_player_contact_phones USING btree (player_contact_id);


--
-- Name: index_activity_log_player_contact_phones_on_protocol_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_activity_log_player_contact_phones_on_protocol_id ON ml_app.activity_log_player_contact_phones USING btree (protocol_id);


--
-- Name: index_activity_log_player_contact_phones_on_user_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_activity_log_player_contact_phones_on_user_id ON ml_app.activity_log_player_contact_phones USING btree (user_id);


--
-- Name: index_address_history_on_address_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_address_history_on_address_id ON ml_app.address_history USING btree (address_id);


--
-- Name: index_address_history_on_master_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_address_history_on_master_id ON ml_app.address_history USING btree (master_id);


--
-- Name: index_address_history_on_user_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_address_history_on_user_id ON ml_app.address_history USING btree (user_id);


--
-- Name: index_addresses_on_master_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_addresses_on_master_id ON ml_app.addresses USING btree (master_id);


--
-- Name: index_addresses_on_user_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_addresses_on_user_id ON ml_app.addresses USING btree (user_id);


--
-- Name: index_admin_action_logs_on_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_admin_action_logs_on_admin_id ON ml_app.admin_action_logs USING btree (admin_id);


--
-- Name: index_admin_history_on_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_admin_history_on_admin_id ON ml_app.admin_history USING btree (admin_id);


--
-- Name: index_admin_history_on_upd_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_admin_history_on_upd_admin_id ON ml_app.admin_history USING btree (updated_by_admin_id);


--
-- Name: index_admins_on_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_admins_on_admin_id ON ml_app.admins USING btree (admin_id);


--
-- Name: index_app_configuration_history_on_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_app_configuration_history_on_admin_id ON ml_app.app_configuration_history USING btree (admin_id);


--
-- Name: index_app_configuration_history_on_app_configuration_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_app_configuration_history_on_app_configuration_id ON ml_app.app_configuration_history USING btree (app_configuration_id);


--
-- Name: index_app_configurations_on_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_app_configurations_on_admin_id ON ml_app.app_configurations USING btree (admin_id);


--
-- Name: index_app_configurations_on_app_type_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_app_configurations_on_app_type_id ON ml_app.app_configurations USING btree (app_type_id);


--
-- Name: index_app_configurations_on_user_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_app_configurations_on_user_id ON ml_app.app_configurations USING btree (user_id);


--
-- Name: index_app_type_history_on_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_app_type_history_on_admin_id ON ml_app.app_type_history USING btree (admin_id);


--
-- Name: index_app_type_history_on_app_type_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_app_type_history_on_app_type_id ON ml_app.app_type_history USING btree (app_type_id);


--
-- Name: index_app_types_on_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_app_types_on_admin_id ON ml_app.app_types USING btree (admin_id);


--
-- Name: index_college_history_on_college_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_college_history_on_college_id ON ml_app.college_history USING btree (college_id);


--
-- Name: index_colleges_on_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_colleges_on_admin_id ON ml_app.colleges USING btree (admin_id);


--
-- Name: index_colleges_on_user_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_colleges_on_user_id ON ml_app.colleges USING btree (user_id);


--
-- Name: index_config_libraries_on_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_config_libraries_on_admin_id ON ml_app.config_libraries USING btree (admin_id);


--
-- Name: index_config_library_history_on_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_config_library_history_on_admin_id ON ml_app.config_library_history USING btree (admin_id);


--
-- Name: index_config_library_history_on_config_library_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_config_library_history_on_config_library_id ON ml_app.config_library_history USING btree (config_library_id);


--
-- Name: index_dynamic_model_history_on_dynamic_model_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_dynamic_model_history_on_dynamic_model_id ON ml_app.dynamic_model_history USING btree (dynamic_model_id);


--
-- Name: index_dynamic_models_on_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_dynamic_models_on_admin_id ON ml_app.dynamic_models USING btree (admin_id);


--
-- Name: index_exception_logs_on_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_exception_logs_on_admin_id ON ml_app.exception_logs USING btree (admin_id);


--
-- Name: index_exception_logs_on_user_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_exception_logs_on_user_id ON ml_app.exception_logs USING btree (user_id);


--
-- Name: index_external_identifier_history_on_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_external_identifier_history_on_admin_id ON ml_app.external_identifier_history USING btree (admin_id);


--
-- Name: index_external_identifier_history_on_external_identifier_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_external_identifier_history_on_external_identifier_id ON ml_app.external_identifier_history USING btree (external_identifier_id);


--
-- Name: index_external_identifiers_on_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_external_identifiers_on_admin_id ON ml_app.external_identifiers USING btree (admin_id);


--
-- Name: index_external_link_history_on_external_link_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_external_link_history_on_external_link_id ON ml_app.external_link_history USING btree (external_link_id);


--
-- Name: index_external_links_on_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_external_links_on_admin_id ON ml_app.external_links USING btree (admin_id);


--
-- Name: index_general_selection_history_on_general_selection_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_general_selection_history_on_general_selection_id ON ml_app.general_selection_history USING btree (general_selection_id);


--
-- Name: index_general_selections_on_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_general_selections_on_admin_id ON ml_app.general_selections USING btree (admin_id);


--
-- Name: index_imports_model_generators_on_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_imports_model_generators_on_admin_id ON ml_app.imports_model_generators USING btree (admin_id);


--
-- Name: index_imports_on_user_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_imports_on_user_id ON ml_app.imports USING btree (user_id);


--
-- Name: index_item_flag_history_on_item_flag_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_item_flag_history_on_item_flag_id ON ml_app.item_flag_history USING btree (item_flag_id);


--
-- Name: index_item_flag_name_history_on_item_flag_name_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_item_flag_name_history_on_item_flag_name_id ON ml_app.item_flag_name_history USING btree (item_flag_name_id);


--
-- Name: index_item_flag_names_on_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_item_flag_names_on_admin_id ON ml_app.item_flag_names USING btree (admin_id);


--
-- Name: index_item_flags_on_item_flag_name_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_item_flags_on_item_flag_name_id ON ml_app.item_flags USING btree (item_flag_name_id);


--
-- Name: index_item_flags_on_user_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_item_flags_on_user_id ON ml_app.item_flags USING btree (user_id);


--
-- Name: index_masters_on_created_by_user_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_masters_on_created_by_user_id ON ml_app.masters USING btree (created_by_user_id);


--
-- Name: index_masters_on_msid; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_masters_on_msid ON ml_app.masters USING btree (msid);


--
-- Name: index_masters_on_pro_info_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_masters_on_pro_info_id ON ml_app.masters USING btree (pro_info_id);


--
-- Name: index_masters_on_proid; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_masters_on_proid ON ml_app.masters USING btree (pro_id);


--
-- Name: index_masters_on_user_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_masters_on_user_id ON ml_app.masters USING btree (user_id);


--
-- Name: index_message_notifications_on_app_type_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_message_notifications_on_app_type_id ON ml_app.message_notifications USING btree (app_type_id);


--
-- Name: index_message_notifications_on_master_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_message_notifications_on_master_id ON ml_app.message_notifications USING btree (master_id);


--
-- Name: index_message_notifications_on_user_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_message_notifications_on_user_id ON ml_app.message_notifications USING btree (user_id);


--
-- Name: index_message_notifications_status; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_message_notifications_status ON ml_app.message_notifications USING btree (status);


--
-- Name: index_message_template_history_on_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_message_template_history_on_admin_id ON ml_app.message_template_history USING btree (admin_id);


--
-- Name: index_message_template_history_on_message_template_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_message_template_history_on_message_template_id ON ml_app.message_template_history USING btree (message_template_id);


--
-- Name: index_message_templates_on_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_message_templates_on_admin_id ON ml_app.message_templates USING btree (admin_id);


--
-- Name: index_model_references_on_from_record_master_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_model_references_on_from_record_master_id ON ml_app.model_references USING btree (from_record_master_id);


--
-- Name: index_model_references_on_from_record_type_and_from_record_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_model_references_on_from_record_type_and_from_record_id ON ml_app.model_references USING btree (from_record_type, from_record_id);


--
-- Name: index_model_references_on_to_record_master_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_model_references_on_to_record_master_id ON ml_app.model_references USING btree (to_record_master_id);


--
-- Name: index_model_references_on_to_record_type_and_to_record_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_model_references_on_to_record_type_and_to_record_id ON ml_app.model_references USING btree (to_record_type, to_record_id);


--
-- Name: index_model_references_on_user_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_model_references_on_user_id ON ml_app.model_references USING btree (user_id);


--
-- Name: index_nfs_store_archived_file_history_on_nfs_store_archived_fil; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_nfs_store_archived_file_history_on_nfs_store_archived_fil ON ml_app.nfs_store_archived_file_history USING btree (nfs_store_archived_file_id);


--
-- Name: index_nfs_store_archived_file_history_on_user_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_nfs_store_archived_file_history_on_user_id ON ml_app.nfs_store_archived_file_history USING btree (user_id);


--
-- Name: index_nfs_store_archived_files_on_nfs_store_container_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_nfs_store_archived_files_on_nfs_store_container_id ON ml_app.nfs_store_archived_files USING btree (nfs_store_container_id);


--
-- Name: index_nfs_store_archived_files_on_nfs_store_stored_file_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_nfs_store_archived_files_on_nfs_store_stored_file_id ON ml_app.nfs_store_archived_files USING btree (nfs_store_stored_file_id);


--
-- Name: index_nfs_store_container_history_on_created_by_user_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_nfs_store_container_history_on_created_by_user_id ON ml_app.nfs_store_container_history USING btree (created_by_user_id);


--
-- Name: index_nfs_store_container_history_on_master_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_nfs_store_container_history_on_master_id ON ml_app.nfs_store_container_history USING btree (master_id);


--
-- Name: index_nfs_store_container_history_on_nfs_store_container_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_nfs_store_container_history_on_nfs_store_container_id ON ml_app.nfs_store_container_history USING btree (nfs_store_container_id);


--
-- Name: index_nfs_store_container_history_on_user_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_nfs_store_container_history_on_user_id ON ml_app.nfs_store_container_history USING btree (user_id);


--
-- Name: index_nfs_store_containers_on_created_by_user_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_nfs_store_containers_on_created_by_user_id ON ml_app.nfs_store_containers USING btree (created_by_user_id);


--
-- Name: index_nfs_store_containers_on_master_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_nfs_store_containers_on_master_id ON ml_app.nfs_store_containers USING btree (master_id);


--
-- Name: index_nfs_store_containers_on_nfs_store_container_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_nfs_store_containers_on_nfs_store_container_id ON ml_app.nfs_store_containers USING btree (nfs_store_container_id);


--
-- Name: index_nfs_store_filter_history_on_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_nfs_store_filter_history_on_admin_id ON ml_app.nfs_store_filter_history USING btree (admin_id);


--
-- Name: index_nfs_store_filter_history_on_nfs_store_filter_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_nfs_store_filter_history_on_nfs_store_filter_id ON ml_app.nfs_store_filter_history USING btree (nfs_store_filter_id);


--
-- Name: index_nfs_store_filters_on_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_nfs_store_filters_on_admin_id ON ml_app.nfs_store_filters USING btree (admin_id);


--
-- Name: index_nfs_store_filters_on_app_type_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_nfs_store_filters_on_app_type_id ON ml_app.nfs_store_filters USING btree (app_type_id);


--
-- Name: index_nfs_store_filters_on_user_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_nfs_store_filters_on_user_id ON ml_app.nfs_store_filters USING btree (user_id);


--
-- Name: index_nfs_store_stored_file_history_on_nfs_store_stored_file_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_nfs_store_stored_file_history_on_nfs_store_stored_file_id ON ml_app.nfs_store_stored_file_history USING btree (nfs_store_stored_file_id);


--
-- Name: index_nfs_store_stored_file_history_on_user_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_nfs_store_stored_file_history_on_user_id ON ml_app.nfs_store_stored_file_history USING btree (user_id);


--
-- Name: index_nfs_store_stored_files_on_nfs_store_container_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_nfs_store_stored_files_on_nfs_store_container_id ON ml_app.nfs_store_stored_files USING btree (nfs_store_container_id);


--
-- Name: index_nfs_store_uploads_on_nfs_store_stored_file_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_nfs_store_uploads_on_nfs_store_stored_file_id ON ml_app.nfs_store_uploads USING btree (nfs_store_stored_file_id);


--
-- Name: index_nfs_store_uploads_on_upload_set; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_nfs_store_uploads_on_upload_set ON ml_app.nfs_store_uploads USING btree (upload_set);


--
-- Name: index_page_layout_history_on_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_page_layout_history_on_admin_id ON ml_app.page_layout_history USING btree (admin_id);


--
-- Name: index_page_layout_history_on_page_layout_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_page_layout_history_on_page_layout_id ON ml_app.page_layout_history USING btree (page_layout_id);


--
-- Name: index_page_layouts_on_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_page_layouts_on_admin_id ON ml_app.page_layouts USING btree (admin_id);


--
-- Name: index_page_layouts_on_app_type_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_page_layouts_on_app_type_id ON ml_app.page_layouts USING btree (app_type_id);


--
-- Name: index_player_contact_history_on_master_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_player_contact_history_on_master_id ON ml_app.player_contact_history USING btree (master_id);


--
-- Name: index_player_contact_history_on_player_contact_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_player_contact_history_on_player_contact_id ON ml_app.player_contact_history USING btree (player_contact_id);


--
-- Name: index_player_contact_history_on_user_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_player_contact_history_on_user_id ON ml_app.player_contact_history USING btree (user_id);


--
-- Name: index_player_contacts_on_master_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_player_contacts_on_master_id ON ml_app.player_contacts USING btree (master_id);


--
-- Name: index_player_contacts_on_user_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_player_contacts_on_user_id ON ml_app.player_contacts USING btree (user_id);


--
-- Name: index_player_info_history_on_master_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_player_info_history_on_master_id ON ml_app.player_info_history USING btree (master_id);


--
-- Name: index_player_info_history_on_player_info_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_player_info_history_on_player_info_id ON ml_app.player_info_history USING btree (player_info_id);


--
-- Name: index_player_info_history_on_user_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_player_info_history_on_user_id ON ml_app.player_info_history USING btree (user_id);


--
-- Name: index_player_infos_on_master_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_player_infos_on_master_id ON ml_app.player_infos USING btree (master_id);


--
-- Name: index_player_infos_on_user_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_player_infos_on_user_id ON ml_app.player_infos USING btree (user_id);


--
-- Name: index_pro_infos_on_master_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_pro_infos_on_master_id ON ml_app.pro_infos USING btree (master_id);


--
-- Name: index_pro_infos_on_user_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_pro_infos_on_user_id ON ml_app.pro_infos USING btree (user_id);


--
-- Name: index_protocol_event_history_on_protocol_event_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_protocol_event_history_on_protocol_event_id ON ml_app.protocol_event_history USING btree (protocol_event_id);


--
-- Name: index_protocol_events_on_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_protocol_events_on_admin_id ON ml_app.protocol_events USING btree (admin_id);


--
-- Name: index_protocol_events_on_sub_process_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_protocol_events_on_sub_process_id ON ml_app.protocol_events USING btree (sub_process_id);


--
-- Name: index_protocol_history_on_protocol_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_protocol_history_on_protocol_id ON ml_app.protocol_history USING btree (protocol_id);


--
-- Name: index_protocols_on_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_protocols_on_admin_id ON ml_app.protocols USING btree (admin_id);


--
-- Name: index_protocols_on_app_type_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_protocols_on_app_type_id ON ml_app.protocols USING btree (app_type_id);


--
-- Name: index_report_history_on_report_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_report_history_on_report_id ON ml_app.report_history USING btree (report_id);


--
-- Name: index_reports_on_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_reports_on_admin_id ON ml_app.reports USING btree (admin_id);


--
-- Name: index_role_description_history_on_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_role_description_history_on_admin_id ON ml_app.role_description_history USING btree (admin_id);


--
-- Name: index_role_description_history_on_app_type_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_role_description_history_on_app_type_id ON ml_app.role_description_history USING btree (app_type_id);


--
-- Name: index_role_descriptions_on_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_role_descriptions_on_admin_id ON ml_app.role_descriptions USING btree (admin_id);


--
-- Name: index_role_descriptions_on_app_type_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_role_descriptions_on_app_type_id ON ml_app.role_descriptions USING btree (app_type_id);


--
-- Name: index_sage_assignments_on_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_sage_assignments_on_admin_id ON ml_app.sage_assignments USING btree (admin_id);


--
-- Name: index_sage_assignments_on_master_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_sage_assignments_on_master_id ON ml_app.sage_assignments USING btree (master_id);


--
-- Name: index_sage_assignments_on_sage_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE UNIQUE INDEX index_sage_assignments_on_sage_id ON ml_app.sage_assignments USING btree (sage_id);


--
-- Name: index_sage_assignments_on_user_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_sage_assignments_on_user_id ON ml_app.sage_assignments USING btree (user_id);


--
-- Name: index_scantron_history_on_master_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_scantron_history_on_master_id ON ml_app.scantron_history USING btree (master_id);


--
-- Name: index_scantron_history_on_scantron_table_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_scantron_history_on_scantron_table_id ON ml_app.scantron_history USING btree (scantron_table_id);


--
-- Name: index_scantron_history_on_user_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_scantron_history_on_user_id ON ml_app.scantron_history USING btree (user_id);


--
-- Name: index_scantrons_on_master_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_scantrons_on_master_id ON ml_app.scantrons USING btree (master_id);


--
-- Name: index_scantrons_on_user_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_scantrons_on_user_id ON ml_app.scantrons USING btree (user_id);


--
-- Name: index_sessions_on_session_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE UNIQUE INDEX index_sessions_on_session_id ON ml_app.sessions USING btree (session_id);


--
-- Name: index_sessions_on_updated_at; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_sessions_on_updated_at ON ml_app.sessions USING btree (updated_at);


--
-- Name: index_sub_process_history_on_sub_process_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_sub_process_history_on_sub_process_id ON ml_app.sub_process_history USING btree (sub_process_id);


--
-- Name: index_sub_processes_on_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_sub_processes_on_admin_id ON ml_app.sub_processes USING btree (admin_id);


--
-- Name: index_sub_processes_on_protocol_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_sub_processes_on_protocol_id ON ml_app.sub_processes USING btree (protocol_id);


--
-- Name: index_tracker_history_on_item_type_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_tracker_history_on_item_type_id ON ml_app.tracker_history USING btree (item_type, item_id);


--
-- Name: index_tracker_history_on_master_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_tracker_history_on_master_id ON ml_app.tracker_history USING btree (master_id);


--
-- Name: index_tracker_history_on_protocol_event_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_tracker_history_on_protocol_event_id ON ml_app.tracker_history USING btree (protocol_event_id);


--
-- Name: index_tracker_history_on_protocol_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_tracker_history_on_protocol_id ON ml_app.tracker_history USING btree (protocol_id);


--
-- Name: index_tracker_history_on_sub_process_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_tracker_history_on_sub_process_id ON ml_app.tracker_history USING btree (sub_process_id);


--
-- Name: index_tracker_history_on_tracker_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_tracker_history_on_tracker_id ON ml_app.tracker_history USING btree (tracker_id);


--
-- Name: index_tracker_history_on_user_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_tracker_history_on_user_id ON ml_app.tracker_history USING btree (user_id);


--
-- Name: index_trackers_on_master_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_trackers_on_master_id ON ml_app.trackers USING btree (master_id);


--
-- Name: index_trackers_on_protocol_event_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_trackers_on_protocol_event_id ON ml_app.trackers USING btree (protocol_event_id);


--
-- Name: index_trackers_on_protocol_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_trackers_on_protocol_id ON ml_app.trackers USING btree (protocol_id);


--
-- Name: index_trackers_on_sub_process_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_trackers_on_sub_process_id ON ml_app.trackers USING btree (sub_process_id);


--
-- Name: index_trackers_on_user_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_trackers_on_user_id ON ml_app.trackers USING btree (user_id);


--
-- Name: index_user_access_control_history_on_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_user_access_control_history_on_admin_id ON ml_app.user_access_control_history USING btree (admin_id);


--
-- Name: index_user_access_control_history_on_user_access_control_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_user_access_control_history_on_user_access_control_id ON ml_app.user_access_control_history USING btree (user_access_control_id);


--
-- Name: index_user_access_controls_on_app_type_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_user_access_controls_on_app_type_id ON ml_app.user_access_controls USING btree (app_type_id);


--
-- Name: index_user_action_logs_on_app_type_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_user_action_logs_on_app_type_id ON ml_app.user_action_logs USING btree (app_type_id);


--
-- Name: index_user_action_logs_on_master_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_user_action_logs_on_master_id ON ml_app.user_action_logs USING btree (master_id);


--
-- Name: index_user_action_logs_on_user_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_user_action_logs_on_user_id ON ml_app.user_action_logs USING btree (user_id);


--
-- Name: index_user_authorization_history_on_user_authorization_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_user_authorization_history_on_user_authorization_id ON ml_app.user_authorization_history USING btree (user_authorization_id);


--
-- Name: index_user_description_history_on_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_user_description_history_on_admin_id ON ml_app.user_description_history USING btree (admin_id);


--
-- Name: index_user_description_history_on_app_type_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_user_description_history_on_app_type_id ON ml_app.user_description_history USING btree (app_type_id);


--
-- Name: index_user_descriptions_on_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_user_descriptions_on_admin_id ON ml_app.user_descriptions USING btree (admin_id);


--
-- Name: index_user_descriptions_on_app_type_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_user_descriptions_on_app_type_id ON ml_app.user_descriptions USING btree (app_type_id);


--
-- Name: index_user_history_on_app_type_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_user_history_on_app_type_id ON ml_app.user_history USING btree (app_type_id);


--
-- Name: index_user_history_on_user_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_user_history_on_user_id ON ml_app.user_history USING btree (user_id);


--
-- Name: index_user_preferences_on_user_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE UNIQUE INDEX index_user_preferences_on_user_id ON ml_app.user_preferences USING btree (user_id);


--
-- Name: index_user_role_history_on_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_user_role_history_on_admin_id ON ml_app.user_role_history USING btree (admin_id);


--
-- Name: index_user_role_history_on_user_role_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_user_role_history_on_user_role_id ON ml_app.user_role_history USING btree (user_role_id);


--
-- Name: index_user_roles_on_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_user_roles_on_admin_id ON ml_app.user_roles USING btree (admin_id);


--
-- Name: index_user_roles_on_app_type_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_user_roles_on_app_type_id ON ml_app.user_roles USING btree (app_type_id);


--
-- Name: index_user_roles_on_user_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_user_roles_on_user_id ON ml_app.user_roles USING btree (user_id);


--
-- Name: index_users_contact_infos_on_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_users_contact_infos_on_admin_id ON ml_app.users_contact_infos USING btree (admin_id);


--
-- Name: index_users_contact_infos_on_user_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_users_contact_infos_on_user_id ON ml_app.users_contact_infos USING btree (user_id);


--
-- Name: index_users_on_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_users_on_admin_id ON ml_app.users USING btree (admin_id);


--
-- Name: index_users_on_app_type_id; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE INDEX index_users_on_app_type_id ON ml_app.users USING btree (app_type_id);


--
-- Name: index_users_on_authentication_token; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE UNIQUE INDEX index_users_on_authentication_token ON ml_app.users USING btree (authentication_token);


--
-- Name: index_users_on_confirmation_token; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE UNIQUE INDEX index_users_on_confirmation_token ON ml_app.users USING btree (confirmation_token);


--
-- Name: index_users_on_email; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE UNIQUE INDEX index_users_on_email ON ml_app.users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON ml_app.users USING btree (reset_password_token);


--
-- Name: index_users_on_unlock_token; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE UNIQUE INDEX index_users_on_unlock_token ON ml_app.users USING btree (unlock_token);


--
-- Name: nfs_store_stored_files_unique_file; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE UNIQUE INDEX nfs_store_stored_files_unique_file ON ml_app.nfs_store_stored_files USING btree (nfs_store_container_id, file_hash, file_name, path);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: ml_app; Owner: -
--

CREATE UNIQUE INDEX unique_schema_migrations ON ml_app.schema_migrations USING btree (version);


--
-- Name: 13f4f74e_id_idx; Type: INDEX; Schema: redcap; Owner: -
--

CREATE INDEX "13f4f74e_id_idx" ON redcap.viva_meta_variable_history USING btree (viva_meta_variable_id);


--
-- Name: 13f4f74e_user_idx; Type: INDEX; Schema: redcap; Owner: -
--

CREATE INDEX "13f4f74e_user_idx" ON redcap.viva_meta_variable_history USING btree (user_id);


--
-- Name: b53dc2a4_id_idx; Type: INDEX; Schema: redcap; Owner: -
--

CREATE INDEX b53dc2a4_id_idx ON redcap.q2_demo_rc_history USING btree (q2_demo_rc_id);


--
-- Name: b53dc2a4_user_idx; Type: INDEX; Schema: redcap; Owner: -
--

CREATE INDEX b53dc2a4_user_idx ON redcap.q2_demo_rc_history USING btree (user_id);


--
-- Name: index_redcap.q2_demo_rcs_on_user_id; Type: INDEX; Schema: redcap; Owner: -
--

CREATE INDEX "index_redcap.q2_demo_rcs_on_user_id" ON redcap.q2_demo_rcs USING btree (user_id);


--
-- Name: index_redcap.viva_meta_variables_on_user_id; Type: INDEX; Schema: redcap; Owner: -
--

CREATE INDEX "index_redcap.viva_meta_variables_on_user_id" ON redcap.viva_meta_variables USING btree (user_id);


--
-- Name: idx_dch_on_redcap_dd_id; Type: INDEX; Schema: ref_data; Owner: -
--

CREATE INDEX idx_dch_on_redcap_dd_id ON ref_data.datadic_choice_history USING btree (redcap_data_dictionary_id);


--
-- Name: idx_dv_equiv; Type: INDEX; Schema: ref_data; Owner: -
--

CREATE INDEX idx_dv_equiv ON ref_data.datadic_variables USING btree (equivalent_to_id);


--
-- Name: idx_dvh_equiv; Type: INDEX; Schema: ref_data; Owner: -
--

CREATE INDEX idx_dvh_equiv ON ref_data.datadic_variable_history USING btree (equivalent_to_id);


--
-- Name: idx_dvh_on_redcap_dd_id; Type: INDEX; Schema: ref_data; Owner: -
--

CREATE INDEX idx_dvh_on_redcap_dd_id ON ref_data.datadic_variable_history USING btree (redcap_data_dictionary_id);


--
-- Name: idx_h_on_datadic_variable_id; Type: INDEX; Schema: ref_data; Owner: -
--

CREATE INDEX idx_h_on_datadic_variable_id ON ref_data.datadic_variable_history USING btree (datadic_variable_id);


--
-- Name: idx_h_on_proj_admin_id; Type: INDEX; Schema: ref_data; Owner: -
--

CREATE INDEX idx_h_on_proj_admin_id ON ref_data.redcap_project_user_history USING btree (redcap_project_admin_id);


--
-- Name: idx_h_on_rdci_id; Type: INDEX; Schema: ref_data; Owner: -
--

CREATE INDEX idx_h_on_rdci_id ON ref_data.redcap_data_collection_instrument_history USING btree (redcap_data_collection_instrument_id);


--
-- Name: idx_h_on_redcap_admin_id; Type: INDEX; Schema: ref_data; Owner: -
--

CREATE INDEX idx_h_on_redcap_admin_id ON ref_data.redcap_data_dictionary_history USING btree (redcap_project_admin_id);


--
-- Name: idx_h_on_redcap_project_user_id; Type: INDEX; Schema: ref_data; Owner: -
--

CREATE INDEX idx_h_on_redcap_project_user_id ON ref_data.redcap_project_user_history USING btree (redcap_project_user_id);


--
-- Name: idx_history_on_datadic_choice_id; Type: INDEX; Schema: ref_data; Owner: -
--

CREATE INDEX idx_history_on_datadic_choice_id ON ref_data.datadic_choice_history USING btree (datadic_choice_id);


--
-- Name: idx_history_on_redcap_data_dictionary_id; Type: INDEX; Schema: ref_data; Owner: -
--

CREATE INDEX idx_history_on_redcap_data_dictionary_id ON ref_data.redcap_data_dictionary_history USING btree (redcap_data_dictionary_id);


--
-- Name: idx_history_on_redcap_project_admin_id; Type: INDEX; Schema: ref_data; Owner: -
--

CREATE INDEX idx_history_on_redcap_project_admin_id ON ref_data.redcap_project_admin_history USING btree (redcap_project_admin_id);


--
-- Name: idx_on_redcap_admin_id; Type: INDEX; Schema: ref_data; Owner: -
--

CREATE INDEX idx_on_redcap_admin_id ON ref_data.redcap_data_dictionaries USING btree (redcap_project_admin_id);


--
-- Name: idx_rcr_on_redcap_admin_id; Type: INDEX; Schema: ref_data; Owner: -
--

CREATE INDEX idx_rcr_on_redcap_admin_id ON ref_data.redcap_client_requests USING btree (redcap_project_admin_id);


--
-- Name: idx_rdci_pa; Type: INDEX; Schema: ref_data; Owner: -
--

CREATE INDEX idx_rdci_pa ON ref_data.redcap_data_collection_instruments USING btree (redcap_project_admin_id);


--
-- Name: idx_rdcih_on_admin_id; Type: INDEX; Schema: ref_data; Owner: -
--

CREATE INDEX idx_rdcih_on_admin_id ON ref_data.redcap_data_collection_instrument_history USING btree (admin_id);


--
-- Name: idx_rdcih_on_proj_admin_id; Type: INDEX; Schema: ref_data; Owner: -
--

CREATE INDEX idx_rdcih_on_proj_admin_id ON ref_data.redcap_data_collection_instrument_history USING btree (redcap_project_admin_id);


--
-- Name: index_datadic_variable_history_on_user_id; Type: INDEX; Schema: ref_data; Owner: -
--

CREATE INDEX index_datadic_variable_history_on_user_id ON ref_data.datadic_variable_history USING btree (user_id);


--
-- Name: index_datadic_variables_on_user_id; Type: INDEX; Schema: ref_data; Owner: -
--

CREATE INDEX index_datadic_variables_on_user_id ON ref_data.datadic_variables USING btree (user_id);


--
-- Name: index_ref_data.datadic_choice_history_on_admin_id; Type: INDEX; Schema: ref_data; Owner: -
--

CREATE INDEX "index_ref_data.datadic_choice_history_on_admin_id" ON ref_data.datadic_choice_history USING btree (admin_id);


--
-- Name: index_ref_data.datadic_choices_on_admin_id; Type: INDEX; Schema: ref_data; Owner: -
--

CREATE INDEX "index_ref_data.datadic_choices_on_admin_id" ON ref_data.datadic_choices USING btree (admin_id);


--
-- Name: index_ref_data.datadic_choices_on_redcap_data_dictionary_id; Type: INDEX; Schema: ref_data; Owner: -
--

CREATE INDEX "index_ref_data.datadic_choices_on_redcap_data_dictionary_id" ON ref_data.datadic_choices USING btree (redcap_data_dictionary_id);


--
-- Name: index_ref_data.datadic_variable_history_on_admin_id; Type: INDEX; Schema: ref_data; Owner: -
--

CREATE INDEX "index_ref_data.datadic_variable_history_on_admin_id" ON ref_data.datadic_variable_history USING btree (admin_id);


--
-- Name: index_ref_data.datadic_variables_on_admin_id; Type: INDEX; Schema: ref_data; Owner: -
--

CREATE INDEX "index_ref_data.datadic_variables_on_admin_id" ON ref_data.datadic_variables USING btree (admin_id);


--
-- Name: index_ref_data.datadic_variables_on_redcap_data_dictionary_id; Type: INDEX; Schema: ref_data; Owner: -
--

CREATE INDEX "index_ref_data.datadic_variables_on_redcap_data_dictionary_id" ON ref_data.datadic_variables USING btree (redcap_data_dictionary_id);


--
-- Name: index_ref_data.redcap_client_requests_on_admin_id; Type: INDEX; Schema: ref_data; Owner: -
--

CREATE INDEX "index_ref_data.redcap_client_requests_on_admin_id" ON ref_data.redcap_client_requests USING btree (admin_id);


--
-- Name: index_ref_data.redcap_data_collection_instruments_on_admin_id; Type: INDEX; Schema: ref_data; Owner: -
--

CREATE INDEX "index_ref_data.redcap_data_collection_instruments_on_admin_id" ON ref_data.redcap_data_collection_instruments USING btree (admin_id);


--
-- Name: index_ref_data.redcap_data_dictionaries_on_admin_id; Type: INDEX; Schema: ref_data; Owner: -
--

CREATE INDEX "index_ref_data.redcap_data_dictionaries_on_admin_id" ON ref_data.redcap_data_dictionaries USING btree (admin_id);


--
-- Name: index_ref_data.redcap_data_dictionary_history_on_admin_id; Type: INDEX; Schema: ref_data; Owner: -
--

CREATE INDEX "index_ref_data.redcap_data_dictionary_history_on_admin_id" ON ref_data.redcap_data_dictionary_history USING btree (admin_id);


--
-- Name: index_ref_data.redcap_project_admin_history_on_admin_id; Type: INDEX; Schema: ref_data; Owner: -
--

CREATE INDEX "index_ref_data.redcap_project_admin_history_on_admin_id" ON ref_data.redcap_project_admin_history USING btree (admin_id);


--
-- Name: index_ref_data.redcap_project_admins_on_admin_id; Type: INDEX; Schema: ref_data; Owner: -
--

CREATE INDEX "index_ref_data.redcap_project_admins_on_admin_id" ON ref_data.redcap_project_admins USING btree (admin_id);


--
-- Name: index_ref_data.redcap_project_user_history_on_admin_id; Type: INDEX; Schema: ref_data; Owner: -
--

CREATE INDEX "index_ref_data.redcap_project_user_history_on_admin_id" ON ref_data.redcap_project_user_history USING btree (admin_id);


--
-- Name: index_ref_data.redcap_project_users_on_admin_id; Type: INDEX; Schema: ref_data; Owner: -
--

CREATE INDEX "index_ref_data.redcap_project_users_on_admin_id" ON ref_data.redcap_project_users USING btree (admin_id);


--
-- Name: index_ref_data.redcap_project_users_on_redcap_project_admin_id; Type: INDEX; Schema: ref_data; Owner: -
--

CREATE INDEX "index_ref_data.redcap_project_users_on_redcap_project_admin_id" ON ref_data.redcap_project_users USING btree (redcap_project_admin_id);


--
-- Name: activity_log_project_assignment_simple_tests log_activity_log_project_assignment_simple_test_history_insert; Type: TRIGGER; Schema: dynamic; Owner: -
--

CREATE TRIGGER log_activity_log_project_assignment_simple_test_history_insert AFTER INSERT ON dynamic.activity_log_project_assignment_simple_tests FOR EACH ROW EXECUTE FUNCTION dynamic.log_activity_log_project_assignment_simple_tests_update();


--
-- Name: activity_log_project_assignment_simple_tests log_activity_log_project_assignment_simple_test_history_update; Type: TRIGGER; Schema: dynamic; Owner: -
--

CREATE TRIGGER log_activity_log_project_assignment_simple_test_history_update AFTER UPDATE ON dynamic.activity_log_project_assignment_simple_tests FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION dynamic.log_activity_log_project_assignment_simple_tests_update();


--
-- Name: project_imports log_project_import_history_insert; Type: TRIGGER; Schema: dynamic; Owner: -
--

CREATE TRIGGER log_project_import_history_insert AFTER INSERT ON dynamic.project_imports FOR EACH ROW EXECUTE FUNCTION dynamic.log_project_imports_update();


--
-- Name: project_imports log_project_import_history_update; Type: TRIGGER; Schema: dynamic; Owner: -
--

CREATE TRIGGER log_project_import_history_update AFTER UPDATE ON dynamic.project_imports FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION dynamic.log_project_imports_update();


--
-- Name: test_fields log_test_field_history_insert; Type: TRIGGER; Schema: dynamic; Owner: -
--

CREATE TRIGGER log_test_field_history_insert AFTER INSERT ON dynamic.test_fields FOR EACH ROW EXECUTE FUNCTION dynamic.log_test_fields_update();


--
-- Name: test_fields log_test_field_history_update; Type: TRIGGER; Schema: dynamic; Owner: -
--

CREATE TRIGGER log_test_field_history_update AFTER UPDATE ON dynamic.test_fields FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION dynamic.log_test_fields_update();


--
-- Name: tests log_test_history_insert; Type: TRIGGER; Schema: dynamic; Owner: -
--

CREATE TRIGGER log_test_history_insert AFTER INSERT ON dynamic.tests FOR EACH ROW EXECUTE FUNCTION dynamic.log_tests_update();


--
-- Name: tests log_test_history_update; Type: TRIGGER; Schema: dynamic; Owner: -
--

CREATE TRIGGER log_test_history_update AFTER UPDATE ON dynamic.tests FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION dynamic.log_tests_update();


--
-- Name: test_model_b_embeds log_test_model_b_embed_history_insert; Type: TRIGGER; Schema: dynamic; Owner: -
--

CREATE TRIGGER log_test_model_b_embed_history_insert AFTER INSERT ON dynamic.test_model_b_embeds FOR EACH ROW EXECUTE FUNCTION dynamic.log_test_model_b_embeds_update();


--
-- Name: test_model_b_embeds log_test_model_b_embed_history_update; Type: TRIGGER; Schema: dynamic; Owner: -
--

CREATE TRIGGER log_test_model_b_embed_history_update AFTER UPDATE ON dynamic.test_model_b_embeds FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION dynamic.log_test_model_b_embeds_update();


--
-- Name: test_model_b_embed_recs log_test_model_b_embed_rec_history_insert; Type: TRIGGER; Schema: dynamic; Owner: -
--

CREATE TRIGGER log_test_model_b_embed_rec_history_insert AFTER INSERT ON dynamic.test_model_b_embed_recs FOR EACH ROW EXECUTE FUNCTION dynamic.log_test_model_b_embed_recs_update();


--
-- Name: test_model_b_embed_recs log_test_model_b_embed_rec_history_update; Type: TRIGGER; Schema: dynamic; Owner: -
--

CREATE TRIGGER log_test_model_b_embed_rec_history_update AFTER UPDATE ON dynamic.test_model_b_embed_recs FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION dynamic.log_test_model_b_embed_recs_update();


--
-- Name: test_model_c_embeds log_test_model_c_embed_history_insert; Type: TRIGGER; Schema: dynamic; Owner: -
--

CREATE TRIGGER log_test_model_c_embed_history_insert AFTER INSERT ON dynamic.test_model_c_embeds FOR EACH ROW EXECUTE FUNCTION dynamic.log_test_model_c_embeds_update();


--
-- Name: test_model_c_embeds log_test_model_c_embed_history_update; Type: TRIGGER; Schema: dynamic; Owner: -
--

CREATE TRIGGER log_test_model_c_embed_history_update AFTER UPDATE ON dynamic.test_model_c_embeds FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION dynamic.log_test_model_c_embeds_update();


--
-- Name: test_model_c_embed_recs log_test_model_c_embed_rec_history_insert; Type: TRIGGER; Schema: dynamic; Owner: -
--

CREATE TRIGGER log_test_model_c_embed_rec_history_insert AFTER INSERT ON dynamic.test_model_c_embed_recs FOR EACH ROW EXECUTE FUNCTION dynamic.log_test_model_c_embed_recs_update();


--
-- Name: test_model_c_embed_recs log_test_model_c_embed_rec_history_update; Type: TRIGGER; Schema: dynamic; Owner: -
--

CREATE TRIGGER log_test_model_c_embed_rec_history_update AFTER UPDATE ON dynamic.test_model_c_embed_recs FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION dynamic.log_test_model_c_embed_recs_update();


--
-- Name: test_model_embeds log_test_model_embed_history_insert; Type: TRIGGER; Schema: dynamic; Owner: -
--

CREATE TRIGGER log_test_model_embed_history_insert AFTER INSERT ON dynamic.test_model_embeds FOR EACH ROW EXECUTE FUNCTION dynamic.log_test_model_embeds_update();


--
-- Name: test_model_embeds log_test_model_embed_history_update; Type: TRIGGER; Schema: dynamic; Owner: -
--

CREATE TRIGGER log_test_model_embed_history_update AFTER UPDATE ON dynamic.test_model_embeds FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION dynamic.log_test_model_embeds_update();


--
-- Name: test_model_embed_recs log_test_model_embed_rec_history_insert; Type: TRIGGER; Schema: dynamic; Owner: -
--

CREATE TRIGGER log_test_model_embed_rec_history_insert AFTER INSERT ON dynamic.test_model_embed_recs FOR EACH ROW EXECUTE FUNCTION dynamic.log_test_model_embed_recs_update();


--
-- Name: test_model_embed_recs log_test_model_embed_rec_history_update; Type: TRIGGER; Schema: dynamic; Owner: -
--

CREATE TRIGGER log_test_model_embed_rec_history_update AFTER UPDATE ON dynamic.test_model_embed_recs FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION dynamic.log_test_model_embed_recs_update();


--
-- Name: test_refs log_test_ref_history_insert; Type: TRIGGER; Schema: dynamic; Owner: -
--

CREATE TRIGGER log_test_ref_history_insert AFTER INSERT ON dynamic.test_refs FOR EACH ROW EXECUTE FUNCTION dynamic.log_test_refs_update();


--
-- Name: test_refs log_test_ref_history_update; Type: TRIGGER; Schema: dynamic; Owner: -
--

CREATE TRIGGER log_test_ref_history_update AFTER UPDATE ON dynamic.test_refs FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION dynamic.log_test_refs_update();


--
-- Name: test_references log_test_reference_history_insert; Type: TRIGGER; Schema: dynamic; Owner: -
--

CREATE TRIGGER log_test_reference_history_insert AFTER INSERT ON dynamic.test_references FOR EACH ROW EXECUTE FUNCTION dynamic.log_test_references_update();


--
-- Name: test_references log_test_reference_history_update; Type: TRIGGER; Schema: dynamic; Owner: -
--

CREATE TRIGGER log_test_reference_history_update AFTER UPDATE ON dynamic.test_references FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION dynamic.log_test_references_update();


--
-- Name: test_times log_test_time_history_insert; Type: TRIGGER; Schema: dynamic; Owner: -
--

CREATE TRIGGER log_test_time_history_insert AFTER INSERT ON dynamic.test_times FOR EACH ROW EXECUTE FUNCTION dynamic.log_test_times_update();


--
-- Name: test_times log_test_time_history_update; Type: TRIGGER; Schema: dynamic; Owner: -
--

CREATE TRIGGER log_test_time_history_update AFTER UPDATE ON dynamic.test_times FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION dynamic.log_test_times_update();


--
-- Name: grit_assignments log_grit_assignment_history_insert; Type: TRIGGER; Schema: extra_app; Owner: -
--

CREATE TRIGGER log_grit_assignment_history_insert AFTER INSERT ON extra_app.grit_assignments FOR EACH ROW EXECUTE FUNCTION extra_app.log_grit_assignments_update();


--
-- Name: grit_assignments log_grit_assignment_history_update; Type: TRIGGER; Schema: extra_app; Owner: -
--

CREATE TRIGGER log_grit_assignment_history_update AFTER UPDATE ON extra_app.grit_assignments FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION extra_app.log_grit_assignments_update();


--
-- Name: pitt_bhi_assignments log_pitt_bhi_assignment_history_insert; Type: TRIGGER; Schema: extra_app; Owner: -
--

CREATE TRIGGER log_pitt_bhi_assignment_history_insert AFTER INSERT ON extra_app.pitt_bhi_assignments FOR EACH ROW EXECUTE FUNCTION extra_app.log_pitt_bhi_assignments_update();


--
-- Name: pitt_bhi_assignments log_pitt_bhi_assignment_history_update; Type: TRIGGER; Schema: extra_app; Owner: -
--

CREATE TRIGGER log_pitt_bhi_assignment_history_update AFTER UPDATE ON extra_app.pitt_bhi_assignments FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION extra_app.log_pitt_bhi_assignments_update();


--
-- Name: sleep_assignments log_sleep_assignment_history_insert; Type: TRIGGER; Schema: extra_app; Owner: -
--

CREATE TRIGGER log_sleep_assignment_history_insert AFTER INSERT ON extra_app.sleep_assignments FOR EACH ROW EXECUTE FUNCTION extra_app.log_sleep_assignments_update();


--
-- Name: sleep_assignments log_sleep_assignment_history_update; Type: TRIGGER; Schema: extra_app; Owner: -
--

CREATE TRIGGER log_sleep_assignment_history_update AFTER UPDATE ON extra_app.sleep_assignments FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION extra_app.log_sleep_assignments_update();


--
-- Name: accuracy_scores accuracy_score_history_insert; Type: TRIGGER; Schema: ml_app; Owner: -
--

CREATE TRIGGER accuracy_score_history_insert AFTER INSERT ON ml_app.accuracy_scores FOR EACH ROW EXECUTE FUNCTION ml_app.log_accuracy_score_update();


--
-- Name: accuracy_scores accuracy_score_history_update; Type: TRIGGER; Schema: ml_app; Owner: -
--

CREATE TRIGGER accuracy_score_history_update AFTER UPDATE ON ml_app.accuracy_scores FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION ml_app.log_accuracy_score_update();


--
-- Name: activity_logs activity_log_history_insert; Type: TRIGGER; Schema: ml_app; Owner: -
--

CREATE TRIGGER activity_log_history_insert AFTER INSERT ON ml_app.activity_logs FOR EACH ROW EXECUTE FUNCTION ml_app.log_activity_log_update();


--
-- Name: activity_logs activity_log_history_update; Type: TRIGGER; Schema: ml_app; Owner: -
--

CREATE TRIGGER activity_log_history_update AFTER UPDATE ON ml_app.activity_logs FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION ml_app.log_activity_log_update();


--
-- Name: activity_log_player_contact_phones activity_log_player_contact_phone_history_insert; Type: TRIGGER; Schema: ml_app; Owner: -
--

CREATE TRIGGER activity_log_player_contact_phone_history_insert AFTER INSERT ON ml_app.activity_log_player_contact_phones FOR EACH ROW EXECUTE FUNCTION ml_app.log_activity_log_player_contact_phone_update();


--
-- Name: activity_log_player_contact_phones activity_log_player_contact_phone_history_update; Type: TRIGGER; Schema: ml_app; Owner: -
--

CREATE TRIGGER activity_log_player_contact_phone_history_update AFTER UPDATE ON ml_app.activity_log_player_contact_phones FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION ml_app.log_activity_log_player_contact_phone_update();


--
-- Name: addresses address_history_insert; Type: TRIGGER; Schema: ml_app; Owner: -
--

CREATE TRIGGER address_history_insert AFTER INSERT ON ml_app.addresses FOR EACH ROW EXECUTE FUNCTION ml_app.log_address_update();


--
-- Name: addresses address_history_update; Type: TRIGGER; Schema: ml_app; Owner: -
--

CREATE TRIGGER address_history_update AFTER UPDATE ON ml_app.addresses FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION ml_app.log_address_update();


--
-- Name: addresses address_insert; Type: TRIGGER; Schema: ml_app; Owner: -
--

CREATE TRIGGER address_insert BEFORE INSERT ON ml_app.addresses FOR EACH ROW EXECUTE FUNCTION ml_app.handle_address_update();


--
-- Name: addresses address_update; Type: TRIGGER; Schema: ml_app; Owner: -
--

CREATE TRIGGER address_update BEFORE UPDATE ON ml_app.addresses FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION ml_app.handle_address_update();


--
-- Name: admins admin_history_insert; Type: TRIGGER; Schema: ml_app; Owner: -
--

CREATE TRIGGER admin_history_insert AFTER INSERT ON ml_app.admins FOR EACH ROW EXECUTE FUNCTION ml_app.log_admin_update();


--
-- Name: admins admin_history_update; Type: TRIGGER; Schema: ml_app; Owner: -
--

CREATE TRIGGER admin_history_update AFTER UPDATE ON ml_app.admins FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION ml_app.log_admin_update();


--
-- Name: app_configurations app_configuration_history_insert; Type: TRIGGER; Schema: ml_app; Owner: -
--

CREATE TRIGGER app_configuration_history_insert AFTER INSERT ON ml_app.app_configurations FOR EACH ROW EXECUTE FUNCTION ml_app.log_app_configuration_update();


--
-- Name: app_configurations app_configuration_history_update; Type: TRIGGER; Schema: ml_app; Owner: -
--

CREATE TRIGGER app_configuration_history_update AFTER UPDATE ON ml_app.app_configurations FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION ml_app.log_app_configuration_update();


--
-- Name: app_types app_type_history_insert; Type: TRIGGER; Schema: ml_app; Owner: -
--

CREATE TRIGGER app_type_history_insert AFTER INSERT ON ml_app.app_types FOR EACH ROW EXECUTE FUNCTION ml_app.log_app_type_update();


--
-- Name: app_types app_type_history_update; Type: TRIGGER; Schema: ml_app; Owner: -
--

CREATE TRIGGER app_type_history_update AFTER UPDATE ON ml_app.app_types FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION ml_app.log_app_type_update();


--
-- Name: colleges college_history_insert; Type: TRIGGER; Schema: ml_app; Owner: -
--

CREATE TRIGGER college_history_insert AFTER INSERT ON ml_app.colleges FOR EACH ROW EXECUTE FUNCTION ml_app.log_college_update();


--
-- Name: colleges college_history_update; Type: TRIGGER; Schema: ml_app; Owner: -
--

CREATE TRIGGER college_history_update AFTER UPDATE ON ml_app.colleges FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION ml_app.log_college_update();


--
-- Name: config_libraries config_library_history_insert; Type: TRIGGER; Schema: ml_app; Owner: -
--

CREATE TRIGGER config_library_history_insert AFTER INSERT ON ml_app.config_libraries FOR EACH ROW EXECUTE FUNCTION ml_app.log_config_library_update();


--
-- Name: config_libraries config_library_history_update; Type: TRIGGER; Schema: ml_app; Owner: -
--

CREATE TRIGGER config_library_history_update AFTER UPDATE ON ml_app.config_libraries FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION ml_app.log_config_library_update();


--
-- Name: dynamic_models dynamic_model_history_insert; Type: TRIGGER; Schema: ml_app; Owner: -
--

CREATE TRIGGER dynamic_model_history_insert AFTER INSERT ON ml_app.dynamic_models FOR EACH ROW EXECUTE FUNCTION ml_app.log_dynamic_model_update();


--
-- Name: dynamic_models dynamic_model_history_update; Type: TRIGGER; Schema: ml_app; Owner: -
--

CREATE TRIGGER dynamic_model_history_update AFTER UPDATE ON ml_app.dynamic_models FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION ml_app.log_dynamic_model_update();


--
-- Name: external_identifiers external_identifier_history_insert; Type: TRIGGER; Schema: ml_app; Owner: -
--

CREATE TRIGGER external_identifier_history_insert AFTER INSERT ON ml_app.external_identifiers FOR EACH ROW EXECUTE FUNCTION ml_app.log_external_identifier_update();


--
-- Name: external_identifiers external_identifier_history_update; Type: TRIGGER; Schema: ml_app; Owner: -
--

CREATE TRIGGER external_identifier_history_update AFTER UPDATE ON ml_app.external_identifiers FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION ml_app.log_external_identifier_update();


--
-- Name: external_links external_link_history_insert; Type: TRIGGER; Schema: ml_app; Owner: -
--

CREATE TRIGGER external_link_history_insert AFTER INSERT ON ml_app.external_links FOR EACH ROW EXECUTE FUNCTION ml_app.log_external_link_update();


--
-- Name: external_links external_link_history_update; Type: TRIGGER; Schema: ml_app; Owner: -
--

CREATE TRIGGER external_link_history_update AFTER UPDATE ON ml_app.external_links FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION ml_app.log_external_link_update();


--
-- Name: general_selections general_selection_history_insert; Type: TRIGGER; Schema: ml_app; Owner: -
--

CREATE TRIGGER general_selection_history_insert AFTER INSERT ON ml_app.general_selections FOR EACH ROW EXECUTE FUNCTION ml_app.log_general_selection_update();


--
-- Name: general_selections general_selection_history_update; Type: TRIGGER; Schema: ml_app; Owner: -
--

CREATE TRIGGER general_selection_history_update AFTER UPDATE ON ml_app.general_selections FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION ml_app.log_general_selection_update();


--
-- Name: item_flags item_flag_history_insert; Type: TRIGGER; Schema: ml_app; Owner: -
--

CREATE TRIGGER item_flag_history_insert AFTER INSERT ON ml_app.item_flags FOR EACH ROW EXECUTE FUNCTION ml_app.log_item_flag_update();


--
-- Name: item_flags item_flag_history_update; Type: TRIGGER; Schema: ml_app; Owner: -
--

CREATE TRIGGER item_flag_history_update AFTER UPDATE ON ml_app.item_flags FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION ml_app.log_item_flag_update();


--
-- Name: item_flag_names item_flag_name_history_insert; Type: TRIGGER; Schema: ml_app; Owner: -
--

CREATE TRIGGER item_flag_name_history_insert AFTER INSERT ON ml_app.item_flag_names FOR EACH ROW EXECUTE FUNCTION ml_app.log_item_flag_name_update();


--
-- Name: item_flag_names item_flag_name_history_update; Type: TRIGGER; Schema: ml_app; Owner: -
--

CREATE TRIGGER item_flag_name_history_update AFTER UPDATE ON ml_app.item_flag_names FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION ml_app.log_item_flag_name_update();


--
-- Name: role_descriptions log_role_description_history_insert; Type: TRIGGER; Schema: ml_app; Owner: -
--

CREATE TRIGGER log_role_description_history_insert AFTER INSERT ON ml_app.role_descriptions FOR EACH ROW EXECUTE FUNCTION ml_app.role_description_history_upd();


--
-- Name: role_descriptions log_role_description_history_update; Type: TRIGGER; Schema: ml_app; Owner: -
--

CREATE TRIGGER log_role_description_history_update AFTER UPDATE ON ml_app.role_descriptions FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION ml_app.role_description_history_upd();


--
-- Name: user_descriptions log_user_description_history_insert; Type: TRIGGER; Schema: ml_app; Owner: -
--

CREATE TRIGGER log_user_description_history_insert AFTER INSERT ON ml_app.user_descriptions FOR EACH ROW EXECUTE FUNCTION ml_app.user_description_history_upd();


--
-- Name: user_descriptions log_user_description_history_update; Type: TRIGGER; Schema: ml_app; Owner: -
--

CREATE TRIGGER log_user_description_history_update AFTER UPDATE ON ml_app.user_descriptions FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION ml_app.user_description_history_upd();


--
-- Name: message_templates message_template_history_insert; Type: TRIGGER; Schema: ml_app; Owner: -
--

CREATE TRIGGER message_template_history_insert AFTER INSERT ON ml_app.message_templates FOR EACH ROW EXECUTE FUNCTION ml_app.log_message_template_update();


--
-- Name: message_templates message_template_history_update; Type: TRIGGER; Schema: ml_app; Owner: -
--

CREATE TRIGGER message_template_history_update AFTER UPDATE ON ml_app.message_templates FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION ml_app.log_message_template_update();


--
-- Name: nfs_store_archived_files nfs_store_archived_file_history_insert; Type: TRIGGER; Schema: ml_app; Owner: -
--

CREATE TRIGGER nfs_store_archived_file_history_insert AFTER INSERT ON ml_app.nfs_store_archived_files FOR EACH ROW EXECUTE FUNCTION ml_app.log_nfs_store_archived_file_update();


--
-- Name: nfs_store_archived_files nfs_store_archived_file_history_update; Type: TRIGGER; Schema: ml_app; Owner: -
--

CREATE TRIGGER nfs_store_archived_file_history_update AFTER UPDATE ON ml_app.nfs_store_archived_files FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION ml_app.log_nfs_store_archived_file_update();


--
-- Name: nfs_store_containers nfs_store_container_history_insert; Type: TRIGGER; Schema: ml_app; Owner: -
--

CREATE TRIGGER nfs_store_container_history_insert AFTER INSERT ON ml_app.nfs_store_containers FOR EACH ROW EXECUTE FUNCTION ml_app.log_nfs_store_container_update();


--
-- Name: nfs_store_containers nfs_store_container_history_update; Type: TRIGGER; Schema: ml_app; Owner: -
--

CREATE TRIGGER nfs_store_container_history_update AFTER UPDATE ON ml_app.nfs_store_containers FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION ml_app.log_nfs_store_container_update();


--
-- Name: nfs_store_filters nfs_store_filter_history_insert; Type: TRIGGER; Schema: ml_app; Owner: -
--

CREATE TRIGGER nfs_store_filter_history_insert AFTER INSERT ON ml_app.nfs_store_filters FOR EACH ROW EXECUTE FUNCTION ml_app.log_nfs_store_filter_update();


--
-- Name: nfs_store_filters nfs_store_filter_history_update; Type: TRIGGER; Schema: ml_app; Owner: -
--

CREATE TRIGGER nfs_store_filter_history_update AFTER UPDATE ON ml_app.nfs_store_filters FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION ml_app.log_nfs_store_filter_update();


--
-- Name: nfs_store_stored_files nfs_store_stored_file_history_insert; Type: TRIGGER; Schema: ml_app; Owner: -
--

CREATE TRIGGER nfs_store_stored_file_history_insert AFTER INSERT ON ml_app.nfs_store_stored_files FOR EACH ROW EXECUTE FUNCTION ml_app.log_nfs_store_stored_file_update();


--
-- Name: nfs_store_stored_files nfs_store_stored_file_history_update; Type: TRIGGER; Schema: ml_app; Owner: -
--

CREATE TRIGGER nfs_store_stored_file_history_update AFTER UPDATE ON ml_app.nfs_store_stored_files FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION ml_app.log_nfs_store_stored_file_update();


--
-- Name: page_layouts page_layout_history_insert; Type: TRIGGER; Schema: ml_app; Owner: -
--

CREATE TRIGGER page_layout_history_insert AFTER INSERT ON ml_app.page_layouts FOR EACH ROW EXECUTE FUNCTION ml_app.log_page_layout_update();


--
-- Name: page_layouts page_layout_history_update; Type: TRIGGER; Schema: ml_app; Owner: -
--

CREATE TRIGGER page_layout_history_update AFTER UPDATE ON ml_app.page_layouts FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION ml_app.log_page_layout_update();


--
-- Name: player_contacts player_contact_history_insert; Type: TRIGGER; Schema: ml_app; Owner: -
--

CREATE TRIGGER player_contact_history_insert AFTER INSERT ON ml_app.player_contacts FOR EACH ROW EXECUTE FUNCTION ml_app.log_player_contact_update();


--
-- Name: player_contacts player_contact_history_update; Type: TRIGGER; Schema: ml_app; Owner: -
--

CREATE TRIGGER player_contact_history_update AFTER UPDATE ON ml_app.player_contacts FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION ml_app.log_player_contact_update();


--
-- Name: player_contacts player_contact_insert; Type: TRIGGER; Schema: ml_app; Owner: -
--

CREATE TRIGGER player_contact_insert BEFORE INSERT ON ml_app.player_contacts FOR EACH ROW EXECUTE FUNCTION ml_app.handle_player_contact_update();


--
-- Name: player_contacts player_contact_update; Type: TRIGGER; Schema: ml_app; Owner: -
--

CREATE TRIGGER player_contact_update BEFORE UPDATE ON ml_app.player_contacts FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION ml_app.handle_player_contact_update();


--
-- Name: player_infos player_info_before_update; Type: TRIGGER; Schema: ml_app; Owner: -
--

CREATE TRIGGER player_info_before_update BEFORE UPDATE ON ml_app.player_infos FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION ml_app.handle_player_info_before_update();


--
-- Name: player_infos player_info_history_insert; Type: TRIGGER; Schema: ml_app; Owner: -
--

CREATE TRIGGER player_info_history_insert AFTER INSERT ON ml_app.player_infos FOR EACH ROW EXECUTE FUNCTION ml_app.log_player_info_update();


--
-- Name: player_infos player_info_history_update; Type: TRIGGER; Schema: ml_app; Owner: -
--

CREATE TRIGGER player_info_history_update AFTER UPDATE ON ml_app.player_infos FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION ml_app.log_player_info_update();


--
-- Name: player_infos player_info_insert; Type: TRIGGER; Schema: ml_app; Owner: -
--

CREATE TRIGGER player_info_insert AFTER INSERT ON ml_app.player_infos FOR EACH ROW EXECUTE FUNCTION ml_app.update_master_with_player_info();


--
-- Name: player_infos player_info_update; Type: TRIGGER; Schema: ml_app; Owner: -
--

CREATE TRIGGER player_info_update AFTER UPDATE ON ml_app.player_infos FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION ml_app.update_master_with_player_info();


--
-- Name: pro_infos pro_info_insert; Type: TRIGGER; Schema: ml_app; Owner: -
--

CREATE TRIGGER pro_info_insert AFTER INSERT ON ml_app.pro_infos FOR EACH ROW EXECUTE FUNCTION ml_app.update_master_with_pro_info();


--
-- Name: pro_infos pro_info_update; Type: TRIGGER; Schema: ml_app; Owner: -
--

CREATE TRIGGER pro_info_update AFTER UPDATE ON ml_app.pro_infos FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION ml_app.update_master_with_pro_info();


--
-- Name: protocol_events protocol_event_history_insert; Type: TRIGGER; Schema: ml_app; Owner: -
--

CREATE TRIGGER protocol_event_history_insert AFTER INSERT ON ml_app.protocol_events FOR EACH ROW EXECUTE FUNCTION ml_app.log_protocol_event_update();


--
-- Name: protocol_events protocol_event_history_update; Type: TRIGGER; Schema: ml_app; Owner: -
--

CREATE TRIGGER protocol_event_history_update AFTER UPDATE ON ml_app.protocol_events FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION ml_app.log_protocol_event_update();


--
-- Name: protocols protocol_history_insert; Type: TRIGGER; Schema: ml_app; Owner: -
--

CREATE TRIGGER protocol_history_insert AFTER INSERT ON ml_app.protocols FOR EACH ROW EXECUTE FUNCTION ml_app.log_protocol_update();


--
-- Name: protocols protocol_history_update; Type: TRIGGER; Schema: ml_app; Owner: -
--

CREATE TRIGGER protocol_history_update AFTER UPDATE ON ml_app.protocols FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION ml_app.log_protocol_update();


--
-- Name: rc_stage_cif_copy rc_cis_update; Type: TRIGGER; Schema: ml_app; Owner: -
--

CREATE TRIGGER rc_cis_update BEFORE UPDATE ON ml_app.rc_stage_cif_copy FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION ml_app.handle_rc_cis_update();


--
-- Name: reports report_history_insert; Type: TRIGGER; Schema: ml_app; Owner: -
--

CREATE TRIGGER report_history_insert AFTER INSERT ON ml_app.reports FOR EACH ROW EXECUTE FUNCTION ml_app.log_report_update();


--
-- Name: reports report_history_update; Type: TRIGGER; Schema: ml_app; Owner: -
--

CREATE TRIGGER report_history_update AFTER UPDATE ON ml_app.reports FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION ml_app.log_report_update();


--
-- Name: scantrons scantron_history_insert; Type: TRIGGER; Schema: ml_app; Owner: -
--

CREATE TRIGGER scantron_history_insert AFTER INSERT ON ml_app.scantrons FOR EACH ROW EXECUTE FUNCTION ml_app.log_scantron_update();


--
-- Name: scantrons scantron_history_update; Type: TRIGGER; Schema: ml_app; Owner: -
--

CREATE TRIGGER scantron_history_update AFTER UPDATE ON ml_app.scantrons FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION ml_app.log_scantron_update();


--
-- Name: sub_processes sub_process_history_insert; Type: TRIGGER; Schema: ml_app; Owner: -
--

CREATE TRIGGER sub_process_history_insert AFTER INSERT ON ml_app.sub_processes FOR EACH ROW EXECUTE FUNCTION ml_app.log_sub_process_update();


--
-- Name: sub_processes sub_process_history_update; Type: TRIGGER; Schema: ml_app; Owner: -
--

CREATE TRIGGER sub_process_history_update AFTER UPDATE ON ml_app.sub_processes FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION ml_app.log_sub_process_update();


--
-- Name: trackers tracker_history_insert; Type: TRIGGER; Schema: ml_app; Owner: -
--

CREATE TRIGGER tracker_history_insert AFTER INSERT ON ml_app.trackers FOR EACH ROW EXECUTE FUNCTION ml_app.log_tracker_update();


--
-- Name: tracker_history tracker_history_update; Type: TRIGGER; Schema: ml_app; Owner: -
--

CREATE TRIGGER tracker_history_update BEFORE UPDATE ON ml_app.tracker_history FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION ml_app.handle_tracker_history_update();


--
-- Name: trackers tracker_history_update; Type: TRIGGER; Schema: ml_app; Owner: -
--

CREATE TRIGGER tracker_history_update AFTER UPDATE ON ml_app.trackers FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION ml_app.log_tracker_update();


--
-- Name: tracker_history tracker_record_delete; Type: TRIGGER; Schema: ml_app; Owner: -
--

CREATE TRIGGER tracker_record_delete AFTER DELETE ON ml_app.tracker_history FOR EACH ROW EXECUTE FUNCTION ml_app.handle_delete();


--
-- Name: trackers tracker_upsert; Type: TRIGGER; Schema: ml_app; Owner: -
--

CREATE TRIGGER tracker_upsert BEFORE INSERT ON ml_app.trackers FOR EACH ROW EXECUTE FUNCTION ml_app.tracker_upsert();


--
-- Name: user_access_controls user_access_control_history_insert; Type: TRIGGER; Schema: ml_app; Owner: -
--

CREATE TRIGGER user_access_control_history_insert AFTER INSERT ON ml_app.user_access_controls FOR EACH ROW EXECUTE FUNCTION ml_app.log_user_access_control_update();


--
-- Name: user_access_controls user_access_control_history_update; Type: TRIGGER; Schema: ml_app; Owner: -
--

CREATE TRIGGER user_access_control_history_update AFTER UPDATE ON ml_app.user_access_controls FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION ml_app.log_user_access_control_update();


--
-- Name: user_authorizations user_authorization_history_insert; Type: TRIGGER; Schema: ml_app; Owner: -
--

CREATE TRIGGER user_authorization_history_insert AFTER INSERT ON ml_app.user_authorizations FOR EACH ROW EXECUTE FUNCTION ml_app.log_user_authorization_update();


--
-- Name: user_authorizations user_authorization_history_update; Type: TRIGGER; Schema: ml_app; Owner: -
--

CREATE TRIGGER user_authorization_history_update AFTER UPDATE ON ml_app.user_authorizations FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION ml_app.log_user_authorization_update();


--
-- Name: users user_history_insert; Type: TRIGGER; Schema: ml_app; Owner: -
--

CREATE TRIGGER user_history_insert AFTER INSERT ON ml_app.users FOR EACH ROW EXECUTE FUNCTION ml_app.log_user_update();


--
-- Name: users user_history_update; Type: TRIGGER; Schema: ml_app; Owner: -
--

CREATE TRIGGER user_history_update AFTER UPDATE ON ml_app.users FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION ml_app.log_user_update();


--
-- Name: user_roles user_role_history_insert; Type: TRIGGER; Schema: ml_app; Owner: -
--

CREATE TRIGGER user_role_history_insert AFTER INSERT ON ml_app.user_roles FOR EACH ROW EXECUTE FUNCTION ml_app.log_user_role_update();


--
-- Name: user_roles user_role_history_update; Type: TRIGGER; Schema: ml_app; Owner: -
--

CREATE TRIGGER user_role_history_update AFTER UPDATE ON ml_app.user_roles FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION ml_app.log_user_role_update();


--
-- Name: q2_demo_rcs log_q2_demo_rc_history_insert; Type: TRIGGER; Schema: redcap; Owner: -
--

CREATE TRIGGER log_q2_demo_rc_history_insert AFTER INSERT ON redcap.q2_demo_rcs FOR EACH ROW EXECUTE FUNCTION redcap.log_q2_demo_rcs_update();


--
-- Name: q2_demo_rcs log_q2_demo_rc_history_update; Type: TRIGGER; Schema: redcap; Owner: -
--

CREATE TRIGGER log_q2_demo_rc_history_update AFTER UPDATE ON redcap.q2_demo_rcs FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION redcap.log_q2_demo_rcs_update();


--
-- Name: datadic_choices log_datadic_choice_history_insert; Type: TRIGGER; Schema: ref_data; Owner: -
--

CREATE TRIGGER log_datadic_choice_history_insert AFTER INSERT ON ref_data.datadic_choices FOR EACH ROW EXECUTE FUNCTION ml_app.datadic_choice_history_upd();


--
-- Name: datadic_choices log_datadic_choice_history_update; Type: TRIGGER; Schema: ref_data; Owner: -
--

CREATE TRIGGER log_datadic_choice_history_update AFTER UPDATE ON ref_data.datadic_choices FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION ml_app.datadic_choice_history_upd();


--
-- Name: datadic_variables log_datadic_variable_history_insert; Type: TRIGGER; Schema: ref_data; Owner: -
--

CREATE TRIGGER log_datadic_variable_history_insert AFTER INSERT ON ref_data.datadic_variables FOR EACH ROW EXECUTE FUNCTION ref_data.log_datadic_variables_update();


--
-- Name: datadic_variables log_datadic_variable_history_update; Type: TRIGGER; Schema: ref_data; Owner: -
--

CREATE TRIGGER log_datadic_variable_history_update AFTER UPDATE ON ref_data.datadic_variables FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION ref_data.log_datadic_variables_update();


--
-- Name: redcap_data_collection_instruments log_redcap_data_collection_instrument_history_insert; Type: TRIGGER; Schema: ref_data; Owner: -
--

CREATE TRIGGER log_redcap_data_collection_instrument_history_insert AFTER INSERT ON ref_data.redcap_data_collection_instruments FOR EACH ROW EXECUTE FUNCTION ref_data.redcap_data_collection_instrument_history_upd();


--
-- Name: redcap_data_collection_instruments log_redcap_data_collection_instrument_history_update; Type: TRIGGER; Schema: ref_data; Owner: -
--

CREATE TRIGGER log_redcap_data_collection_instrument_history_update AFTER UPDATE ON ref_data.redcap_data_collection_instruments FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION ref_data.redcap_data_collection_instrument_history_upd();


--
-- Name: redcap_data_dictionaries log_redcap_data_dictionary_history_insert; Type: TRIGGER; Schema: ref_data; Owner: -
--

CREATE TRIGGER log_redcap_data_dictionary_history_insert AFTER INSERT ON ref_data.redcap_data_dictionaries FOR EACH ROW EXECUTE FUNCTION ml_app.redcap_data_dictionary_history_upd();


--
-- Name: redcap_data_dictionaries log_redcap_data_dictionary_history_update; Type: TRIGGER; Schema: ref_data; Owner: -
--

CREATE TRIGGER log_redcap_data_dictionary_history_update AFTER UPDATE ON ref_data.redcap_data_dictionaries FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION ml_app.redcap_data_dictionary_history_upd();


--
-- Name: redcap_project_admins log_redcap_project_admin_history_insert; Type: TRIGGER; Schema: ref_data; Owner: -
--

CREATE TRIGGER log_redcap_project_admin_history_insert AFTER INSERT ON ref_data.redcap_project_admins FOR EACH ROW EXECUTE FUNCTION ml_app.redcap_project_admin_history_upd();


--
-- Name: redcap_project_admins log_redcap_project_admin_history_update; Type: TRIGGER; Schema: ref_data; Owner: -
--

CREATE TRIGGER log_redcap_project_admin_history_update AFTER UPDATE ON ref_data.redcap_project_admins FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION ml_app.redcap_project_admin_history_upd();


--
-- Name: redcap_project_users log_redcap_project_user_history_insert; Type: TRIGGER; Schema: ref_data; Owner: -
--

CREATE TRIGGER log_redcap_project_user_history_insert AFTER INSERT ON ref_data.redcap_project_users FOR EACH ROW EXECUTE FUNCTION ref_data.redcap_project_user_history_upd();


--
-- Name: redcap_project_users log_redcap_project_user_history_update; Type: TRIGGER; Schema: ref_data; Owner: -
--

CREATE TRIGGER log_redcap_project_user_history_update AFTER UPDATE ON ref_data.redcap_project_users FOR EACH ROW WHEN ((old.* IS DISTINCT FROM new.*)) EXECUTE FUNCTION ref_data.redcap_project_user_history_upd();


--
-- Name: test_model_embeds fk_rails_03cdb7fc71; Type: FK CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_model_embeds
    ADD CONSTRAINT fk_rails_03cdb7fc71 FOREIGN KEY (master_id) REFERENCES ml_app.masters(id);


--
-- Name: activity_log_project_assignment_simple_test_history fk_rails_04314ab903; Type: FK CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.activity_log_project_assignment_simple_test_history
    ADD CONSTRAINT fk_rails_04314ab903 FOREIGN KEY (user_id) REFERENCES ml_app.users(id);


--
-- Name: test_model_embed_recs fk_rails_08a3f9cb73; Type: FK CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_model_embed_recs
    ADD CONSTRAINT fk_rails_08a3f9cb73 FOREIGN KEY (user_id) REFERENCES ml_app.users(id);


--
-- Name: test_model_b_embeds fk_rails_0a82559ea7; Type: FK CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_model_b_embeds
    ADD CONSTRAINT fk_rails_0a82559ea7 FOREIGN KEY (user_id) REFERENCES ml_app.users(id);


--
-- Name: test_model_embeds fk_rails_10c6929334; Type: FK CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_model_embeds
    ADD CONSTRAINT fk_rails_10c6929334 FOREIGN KEY (user_id) REFERENCES ml_app.users(id);


--
-- Name: test_model_b_embed_recs fk_rails_11313d7ae3; Type: FK CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_model_b_embed_recs
    ADD CONSTRAINT fk_rails_11313d7ae3 FOREIGN KEY (master_id) REFERENCES ml_app.masters(id);


--
-- Name: test_model_b_embed_history fk_rails_12484d97b2; Type: FK CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_model_b_embed_history
    ADD CONSTRAINT fk_rails_12484d97b2 FOREIGN KEY (user_id) REFERENCES ml_app.users(id);


--
-- Name: activity_log_project_assignment_simple_test_history fk_rails_1380a03ce8; Type: FK CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.activity_log_project_assignment_simple_test_history
    ADD CONSTRAINT fk_rails_1380a03ce8 FOREIGN KEY (project_assignment_id) REFERENCES projects.project_assignments(id);


--
-- Name: test_model_c_embed_rec_history fk_rails_13c6b52f98; Type: FK CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_model_c_embed_rec_history
    ADD CONSTRAINT fk_rails_13c6b52f98 FOREIGN KEY (test_model_c_embed_rec_id) REFERENCES dynamic.test_model_c_embed_recs(id);


--
-- Name: test_references fk_rails_1b2fddbf39; Type: FK CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_references
    ADD CONSTRAINT fk_rails_1b2fddbf39 FOREIGN KEY (user_id) REFERENCES ml_app.users(id);


--
-- Name: test_model_embed_rec_history fk_rails_2376e547f6; Type: FK CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_model_embed_rec_history
    ADD CONSTRAINT fk_rails_2376e547f6 FOREIGN KEY (master_id) REFERENCES ml_app.masters(id);


--
-- Name: test_model_b_embed_history fk_rails_239937ee4d; Type: FK CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_model_b_embed_history
    ADD CONSTRAINT fk_rails_239937ee4d FOREIGN KEY (test_model_b_embed_id) REFERENCES dynamic.test_model_b_embeds(id);


--
-- Name: test_field_history fk_rails_247419beb3; Type: FK CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_field_history
    ADD CONSTRAINT fk_rails_247419beb3 FOREIGN KEY (test_field_id) REFERENCES dynamic.test_fields(id);


--
-- Name: test_model_c_embeds fk_rails_250f9e6349; Type: FK CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_model_c_embeds
    ADD CONSTRAINT fk_rails_250f9e6349 FOREIGN KEY (master_id) REFERENCES ml_app.masters(id);


--
-- Name: test_time_history fk_rails_26388ddca5; Type: FK CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_time_history
    ADD CONSTRAINT fk_rails_26388ddca5 FOREIGN KEY (test_time_id) REFERENCES dynamic.test_times(id);


--
-- Name: activity_log_project_assignment_simple_test_history fk_rails_2a8011fa6d; Type: FK CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.activity_log_project_assignment_simple_test_history
    ADD CONSTRAINT fk_rails_2a8011fa6d FOREIGN KEY (activity_log_project_assignment_simple_test_id) REFERENCES dynamic.activity_log_project_assignment_simple_tests(id);


--
-- Name: test_model_embed_history fk_rails_3377de4975; Type: FK CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_model_embed_history
    ADD CONSTRAINT fk_rails_3377de4975 FOREIGN KEY (user_id) REFERENCES ml_app.users(id);


--
-- Name: test_model_embed_history fk_rails_3874d697a9; Type: FK CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_model_embed_history
    ADD CONSTRAINT fk_rails_3874d697a9 FOREIGN KEY (master_id) REFERENCES ml_app.masters(id);


--
-- Name: test_model_c_embed_recs fk_rails_3f9b57dccc; Type: FK CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_model_c_embed_recs
    ADD CONSTRAINT fk_rails_3f9b57dccc FOREIGN KEY (user_id) REFERENCES ml_app.users(id);


--
-- Name: activity_log_project_assignment_simple_tests fk_rails_40a4af0a3b; Type: FK CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.activity_log_project_assignment_simple_tests
    ADD CONSTRAINT fk_rails_40a4af0a3b FOREIGN KEY (project_assignment_id) REFERENCES projects.project_assignments(id);


--
-- Name: project_import_history fk_rails_42472c918e; Type: FK CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.project_import_history
    ADD CONSTRAINT fk_rails_42472c918e FOREIGN KEY (user_id) REFERENCES ml_app.users(id);


--
-- Name: test_history fk_rails_43a2e0bc36; Type: FK CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_history
    ADD CONSTRAINT fk_rails_43a2e0bc36 FOREIGN KEY (test_id) REFERENCES dynamic.tests(id);


--
-- Name: test_model_embed_recs fk_rails_444c1fc708; Type: FK CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_model_embed_recs
    ADD CONSTRAINT fk_rails_444c1fc708 FOREIGN KEY (master_id) REFERENCES ml_app.masters(id);


--
-- Name: test_model_c_embed_history fk_rails_44e847fb73; Type: FK CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_model_c_embed_history
    ADD CONSTRAINT fk_rails_44e847fb73 FOREIGN KEY (user_id) REFERENCES ml_app.users(id);


--
-- Name: test_field_history fk_rails_45efcd0314; Type: FK CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_field_history
    ADD CONSTRAINT fk_rails_45efcd0314 FOREIGN KEY (master_id) REFERENCES ml_app.masters(id);


--
-- Name: test_model_c_embed_rec_history fk_rails_46e70e42db; Type: FK CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_model_c_embed_rec_history
    ADD CONSTRAINT fk_rails_46e70e42db FOREIGN KEY (user_id) REFERENCES ml_app.users(id);


--
-- Name: test_reference_history fk_rails_4bd2212f34; Type: FK CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_reference_history
    ADD CONSTRAINT fk_rails_4bd2212f34 FOREIGN KEY (user_id) REFERENCES ml_app.users(id);


--
-- Name: test_references fk_rails_4cdb4d2a71; Type: FK CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_references
    ADD CONSTRAINT fk_rails_4cdb4d2a71 FOREIGN KEY (master_id) REFERENCES ml_app.masters(id);


--
-- Name: test_model_b_embed_rec_history fk_rails_56bf918815; Type: FK CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_model_b_embed_rec_history
    ADD CONSTRAINT fk_rails_56bf918815 FOREIGN KEY (user_id) REFERENCES ml_app.users(id);


--
-- Name: test_times fk_rails_5726c3b693; Type: FK CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_times
    ADD CONSTRAINT fk_rails_5726c3b693 FOREIGN KEY (user_id) REFERENCES ml_app.users(id);


--
-- Name: test_model_c_embed_history fk_rails_6fec2d919e; Type: FK CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_model_c_embed_history
    ADD CONSTRAINT fk_rails_6fec2d919e FOREIGN KEY (test_model_c_embed_id) REFERENCES dynamic.test_model_c_embeds(id);


--
-- Name: activity_log_project_assignment_simple_test_history fk_rails_74888510b1; Type: FK CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.activity_log_project_assignment_simple_test_history
    ADD CONSTRAINT fk_rails_74888510b1 FOREIGN KEY (master_id) REFERENCES ml_app.masters(id);


--
-- Name: test_fields fk_rails_7c87f5820a; Type: FK CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_fields
    ADD CONSTRAINT fk_rails_7c87f5820a FOREIGN KEY (master_id) REFERENCES ml_app.masters(id);


--
-- Name: test_model_b_embed_rec_history fk_rails_85eb650828; Type: FK CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_model_b_embed_rec_history
    ADD CONSTRAINT fk_rails_85eb650828 FOREIGN KEY (master_id) REFERENCES ml_app.masters(id);


--
-- Name: activity_log_project_assignment_simple_tests fk_rails_8cb88e458a; Type: FK CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.activity_log_project_assignment_simple_tests
    ADD CONSTRAINT fk_rails_8cb88e458a FOREIGN KEY (created_by_user_id) REFERENCES ml_app.users(id);


--
-- Name: test_history fk_rails_8da75b7058; Type: FK CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_history
    ADD CONSTRAINT fk_rails_8da75b7058 FOREIGN KEY (user_id) REFERENCES ml_app.users(id);


--
-- Name: test_time_history fk_rails_977fc4271c; Type: FK CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_time_history
    ADD CONSTRAINT fk_rails_977fc4271c FOREIGN KEY (user_id) REFERENCES ml_app.users(id);


--
-- Name: test_model_c_embed_rec_history fk_rails_9913e7ab1d; Type: FK CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_model_c_embed_rec_history
    ADD CONSTRAINT fk_rails_9913e7ab1d FOREIGN KEY (master_id) REFERENCES ml_app.masters(id);


--
-- Name: test_model_embed_history fk_rails_9a84a23fc3; Type: FK CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_model_embed_history
    ADD CONSTRAINT fk_rails_9a84a23fc3 FOREIGN KEY (test_model_embed_id) REFERENCES dynamic.test_model_embeds(id);


--
-- Name: test_model_b_embeds fk_rails_a1efd0409c; Type: FK CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_model_b_embeds
    ADD CONSTRAINT fk_rails_a1efd0409c FOREIGN KEY (master_id) REFERENCES ml_app.masters(id);


--
-- Name: test_ref_history fk_rails_a520d50d17; Type: FK CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_ref_history
    ADD CONSTRAINT fk_rails_a520d50d17 FOREIGN KEY (test_ref_id) REFERENCES dynamic.test_refs(id);


--
-- Name: activity_log_project_assignment_simple_tests fk_rails_a583f8596a; Type: FK CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.activity_log_project_assignment_simple_tests
    ADD CONSTRAINT fk_rails_a583f8596a FOREIGN KEY (master_id) REFERENCES ml_app.masters(id);


--
-- Name: test_refs fk_rails_aa1993b784; Type: FK CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_refs
    ADD CONSTRAINT fk_rails_aa1993b784 FOREIGN KEY (user_id) REFERENCES ml_app.users(id);


--
-- Name: test_model_embed_rec_history fk_rails_afe687234b; Type: FK CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_model_embed_rec_history
    ADD CONSTRAINT fk_rails_afe687234b FOREIGN KEY (user_id) REFERENCES ml_app.users(id);


--
-- Name: test_model_c_embed_recs fk_rails_b0f7c5c5a1; Type: FK CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_model_c_embed_recs
    ADD CONSTRAINT fk_rails_b0f7c5c5a1 FOREIGN KEY (master_id) REFERENCES ml_app.masters(id);


--
-- Name: test_model_b_embed_rec_history fk_rails_b34144f5b5; Type: FK CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_model_b_embed_rec_history
    ADD CONSTRAINT fk_rails_b34144f5b5 FOREIGN KEY (test_model_b_embed_rec_id) REFERENCES dynamic.test_model_b_embed_recs(id);


--
-- Name: test_reference_history fk_rails_b8cc1fcb00; Type: FK CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_reference_history
    ADD CONSTRAINT fk_rails_b8cc1fcb00 FOREIGN KEY (test_reference_id) REFERENCES dynamic.test_references(id);


--
-- Name: test_field_history fk_rails_ba7f2f9b9a; Type: FK CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_field_history
    ADD CONSTRAINT fk_rails_ba7f2f9b9a FOREIGN KEY (user_id) REFERENCES ml_app.users(id);


--
-- Name: project_imports fk_rails_bfbc93fc96; Type: FK CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.project_imports
    ADD CONSTRAINT fk_rails_bfbc93fc96 FOREIGN KEY (master_id) REFERENCES ml_app.masters(id);


--
-- Name: test_model_c_embed_history fk_rails_d25273d2e4; Type: FK CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_model_c_embed_history
    ADD CONSTRAINT fk_rails_d25273d2e4 FOREIGN KEY (master_id) REFERENCES ml_app.masters(id);


--
-- Name: project_import_history fk_rails_dbc5339fab; Type: FK CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.project_import_history
    ADD CONSTRAINT fk_rails_dbc5339fab FOREIGN KEY (project_import_id) REFERENCES dynamic.project_imports(id);


--
-- Name: project_import_history fk_rails_e0bb58632d; Type: FK CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.project_import_history
    ADD CONSTRAINT fk_rails_e0bb58632d FOREIGN KEY (master_id) REFERENCES ml_app.masters(id);


--
-- Name: test_model_b_embed_recs fk_rails_e6107b8d6a; Type: FK CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_model_b_embed_recs
    ADD CONSTRAINT fk_rails_e6107b8d6a FOREIGN KEY (user_id) REFERENCES ml_app.users(id);


--
-- Name: test_model_b_embed_history fk_rails_ec50800a5f; Type: FK CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_model_b_embed_history
    ADD CONSTRAINT fk_rails_ec50800a5f FOREIGN KEY (master_id) REFERENCES ml_app.masters(id);


--
-- Name: project_imports fk_rails_f01fbb2df4; Type: FK CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.project_imports
    ADD CONSTRAINT fk_rails_f01fbb2df4 FOREIGN KEY (user_id) REFERENCES ml_app.users(id);


--
-- Name: activity_log_project_assignment_simple_test_history fk_rails_f052debd11; Type: FK CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.activity_log_project_assignment_simple_test_history
    ADD CONSTRAINT fk_rails_f052debd11 FOREIGN KEY (created_by_user_id) REFERENCES ml_app.users(id);


--
-- Name: test_reference_history fk_rails_f398788c07; Type: FK CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_reference_history
    ADD CONSTRAINT fk_rails_f398788c07 FOREIGN KEY (master_id) REFERENCES ml_app.masters(id);


--
-- Name: tests fk_rails_f48c9c1bd6; Type: FK CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.tests
    ADD CONSTRAINT fk_rails_f48c9c1bd6 FOREIGN KEY (user_id) REFERENCES ml_app.users(id);


--
-- Name: activity_log_project_assignment_simple_tests fk_rails_f4ba922a7e; Type: FK CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.activity_log_project_assignment_simple_tests
    ADD CONSTRAINT fk_rails_f4ba922a7e FOREIGN KEY (user_id) REFERENCES ml_app.users(id);


--
-- Name: test_ref_history fk_rails_f51ac81ec1; Type: FK CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_ref_history
    ADD CONSTRAINT fk_rails_f51ac81ec1 FOREIGN KEY (user_id) REFERENCES ml_app.users(id);


--
-- Name: test_model_embed_rec_history fk_rails_f6cceb1d38; Type: FK CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_model_embed_rec_history
    ADD CONSTRAINT fk_rails_f6cceb1d38 FOREIGN KEY (test_model_embed_rec_id) REFERENCES dynamic.test_model_embed_recs(id);


--
-- Name: test_fields fk_rails_f81a05a3de; Type: FK CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_fields
    ADD CONSTRAINT fk_rails_f81a05a3de FOREIGN KEY (user_id) REFERENCES ml_app.users(id);


--
-- Name: test_model_c_embeds fk_rails_fdbe544c3c; Type: FK CONSTRAINT; Schema: dynamic; Owner: -
--

ALTER TABLE ONLY dynamic.test_model_c_embeds
    ADD CONSTRAINT fk_rails_fdbe544c3c FOREIGN KEY (user_id) REFERENCES ml_app.users(id);


--
-- Name: grit_assignments fk_rails_081ee3469f; Type: FK CONSTRAINT; Schema: extra_app; Owner: -
--

ALTER TABLE ONLY extra_app.grit_assignments
    ADD CONSTRAINT fk_rails_081ee3469f FOREIGN KEY (admin_id) REFERENCES ml_app.admins(id);


--
-- Name: grit_assignment_history fk_rails_15a9d2b53b; Type: FK CONSTRAINT; Schema: extra_app; Owner: -
--

ALTER TABLE ONLY extra_app.grit_assignment_history
    ADD CONSTRAINT fk_rails_15a9d2b53b FOREIGN KEY (master_id) REFERENCES ml_app.masters(id);


--
-- Name: pitt_bhi_assignment_history fk_rails_3657d6c5a5; Type: FK CONSTRAINT; Schema: extra_app; Owner: -
--

ALTER TABLE ONLY extra_app.pitt_bhi_assignment_history
    ADD CONSTRAINT fk_rails_3657d6c5a5 FOREIGN KEY (master_id) REFERENCES ml_app.masters(id);


--
-- Name: pitt_bhi_assignments fk_rails_3e2d90b6a7; Type: FK CONSTRAINT; Schema: extra_app; Owner: -
--

ALTER TABLE ONLY extra_app.pitt_bhi_assignments
    ADD CONSTRAINT fk_rails_3e2d90b6a7 FOREIGN KEY (user_id) REFERENCES ml_app.users(id);


--
-- Name: sleep_assignment_history fk_rails_4498353cb8; Type: FK CONSTRAINT; Schema: extra_app; Owner: -
--

ALTER TABLE ONLY extra_app.sleep_assignment_history
    ADD CONSTRAINT fk_rails_4498353cb8 FOREIGN KEY (user_id) REFERENCES ml_app.users(id);


--
-- Name: sleep_assignment_history fk_rails_5948cd2e04; Type: FK CONSTRAINT; Schema: extra_app; Owner: -
--

ALTER TABLE ONLY extra_app.sleep_assignment_history
    ADD CONSTRAINT fk_rails_5948cd2e04 FOREIGN KEY (master_id) REFERENCES ml_app.masters(id);


--
-- Name: grit_assignments fk_rails_5953540cf4; Type: FK CONSTRAINT; Schema: extra_app; Owner: -
--

ALTER TABLE ONLY extra_app.grit_assignments
    ADD CONSTRAINT fk_rails_5953540cf4 FOREIGN KEY (master_id) REFERENCES ml_app.masters(id);


--
-- Name: pitt_bhi_assignments fk_rails_675c55afb1; Type: FK CONSTRAINT; Schema: extra_app; Owner: -
--

ALTER TABLE ONLY extra_app.pitt_bhi_assignments
    ADD CONSTRAINT fk_rails_675c55afb1 FOREIGN KEY (master_id) REFERENCES ml_app.masters(id);


--
-- Name: grit_assignment_history fk_rails_6fb9cf3716; Type: FK CONSTRAINT; Schema: extra_app; Owner: -
--

ALTER TABLE ONLY extra_app.grit_assignment_history
    ADD CONSTRAINT fk_rails_6fb9cf3716 FOREIGN KEY (user_id) REFERENCES ml_app.users(id);


--
-- Name: pitt_bhi_assignment_history fk_rails_8075a87e8f; Type: FK CONSTRAINT; Schema: extra_app; Owner: -
--

ALTER TABLE ONLY extra_app.pitt_bhi_assignment_history
    ADD CONSTRAINT fk_rails_8075a87e8f FOREIGN KEY (user_id) REFERENCES ml_app.users(id);


--
-- Name: sleep_assignments fk_rails_821973c8c6; Type: FK CONSTRAINT; Schema: extra_app; Owner: -
--

ALTER TABLE ONLY extra_app.sleep_assignments
    ADD CONSTRAINT fk_rails_821973c8c6 FOREIGN KEY (admin_id) REFERENCES ml_app.admins(id);


--
-- Name: sleep_assignment_history fk_rails_838684f7e8; Type: FK CONSTRAINT; Schema: extra_app; Owner: -
--

ALTER TABLE ONLY extra_app.sleep_assignment_history
    ADD CONSTRAINT fk_rails_838684f7e8 FOREIGN KEY (admin_id) REFERENCES ml_app.admins(id);


--
-- Name: sleep_assignments fk_rails_8b41db7451; Type: FK CONSTRAINT; Schema: extra_app; Owner: -
--

ALTER TABLE ONLY extra_app.sleep_assignments
    ADD CONSTRAINT fk_rails_8b41db7451 FOREIGN KEY (master_id) REFERENCES ml_app.masters(id);


--
-- Name: sleep_assignment_history fk_rails_8fcf1391e1; Type: FK CONSTRAINT; Schema: extra_app; Owner: -
--

ALTER TABLE ONLY extra_app.sleep_assignment_history
    ADD CONSTRAINT fk_rails_8fcf1391e1 FOREIGN KEY (sleep_assignment_table_id) REFERENCES extra_app.sleep_assignments(id);


--
-- Name: sleep_assignments fk_rails_ab8e683d49; Type: FK CONSTRAINT; Schema: extra_app; Owner: -
--

ALTER TABLE ONLY extra_app.sleep_assignments
    ADD CONSTRAINT fk_rails_ab8e683d49 FOREIGN KEY (user_id) REFERENCES ml_app.users(id);


--
-- Name: pitt_bhi_assignments fk_rails_cbc00f914a; Type: FK CONSTRAINT; Schema: extra_app; Owner: -
--

ALTER TABLE ONLY extra_app.pitt_bhi_assignments
    ADD CONSTRAINT fk_rails_cbc00f914a FOREIGN KEY (admin_id) REFERENCES ml_app.admins(id);


--
-- Name: grit_assignment_history fk_rails_cbe030ce55; Type: FK CONSTRAINT; Schema: extra_app; Owner: -
--

ALTER TABLE ONLY extra_app.grit_assignment_history
    ADD CONSTRAINT fk_rails_cbe030ce55 FOREIGN KEY (admin_id) REFERENCES ml_app.admins(id);


--
-- Name: grit_assignments fk_rails_db9353d15f; Type: FK CONSTRAINT; Schema: extra_app; Owner: -
--

ALTER TABLE ONLY extra_app.grit_assignments
    ADD CONSTRAINT fk_rails_db9353d15f FOREIGN KEY (user_id) REFERENCES ml_app.users(id);


--
-- Name: pitt_bhi_assignment_history fk_rails_dc3803548c; Type: FK CONSTRAINT; Schema: extra_app; Owner: -
--

ALTER TABLE ONLY extra_app.pitt_bhi_assignment_history
    ADD CONSTRAINT fk_rails_dc3803548c FOREIGN KEY (admin_id) REFERENCES ml_app.admins(id);


--
-- Name: grit_assignment_history fk_rails_de5807ee5f; Type: FK CONSTRAINT; Schema: extra_app; Owner: -
--

ALTER TABLE ONLY extra_app.grit_assignment_history
    ADD CONSTRAINT fk_rails_de5807ee5f FOREIGN KEY (grit_assignment_table_id) REFERENCES extra_app.grit_assignments(id);


--
-- Name: pitt_bhi_assignment_history fk_rails_fdd5a80000; Type: FK CONSTRAINT; Schema: extra_app; Owner: -
--

ALTER TABLE ONLY extra_app.pitt_bhi_assignment_history
    ADD CONSTRAINT fk_rails_fdd5a80000 FOREIGN KEY (pitt_bhi_assignment_table_id) REFERENCES extra_app.pitt_bhi_assignments(id);


--
-- Name: accuracy_score_history fk_accuracy_score_history_accuracy_scores; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.accuracy_score_history
    ADD CONSTRAINT fk_accuracy_score_history_accuracy_scores FOREIGN KEY (accuracy_score_id) REFERENCES ml_app.accuracy_scores(id);


--
-- Name: activity_log_player_contact_phone_history fk_activity_log_player_contact_phone_history_activity_log_playe; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.activity_log_player_contact_phone_history
    ADD CONSTRAINT fk_activity_log_player_contact_phone_history_activity_log_playe FOREIGN KEY (activity_log_player_contact_phone_id) REFERENCES ml_app.activity_log_player_contact_phones(id);


--
-- Name: activity_log_player_contact_phone_history fk_activity_log_player_contact_phone_history_masters; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.activity_log_player_contact_phone_history
    ADD CONSTRAINT fk_activity_log_player_contact_phone_history_masters FOREIGN KEY (master_id) REFERENCES ml_app.masters(id);


--
-- Name: activity_log_player_contact_phone_history fk_activity_log_player_contact_phone_history_player_contact_pho; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.activity_log_player_contact_phone_history
    ADD CONSTRAINT fk_activity_log_player_contact_phone_history_player_contact_pho FOREIGN KEY (player_contact_id) REFERENCES ml_app.player_contacts(id);


--
-- Name: activity_log_player_contact_phone_history fk_activity_log_player_contact_phone_history_users; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.activity_log_player_contact_phone_history
    ADD CONSTRAINT fk_activity_log_player_contact_phone_history_users FOREIGN KEY (user_id) REFERENCES ml_app.users(id);


--
-- Name: address_history fk_address_history_addresses; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.address_history
    ADD CONSTRAINT fk_address_history_addresses FOREIGN KEY (address_id) REFERENCES ml_app.addresses(id);


--
-- Name: address_history fk_address_history_masters; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.address_history
    ADD CONSTRAINT fk_address_history_masters FOREIGN KEY (master_id) REFERENCES ml_app.masters(id);


--
-- Name: address_history fk_address_history_users; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.address_history
    ADD CONSTRAINT fk_address_history_users FOREIGN KEY (user_id) REFERENCES ml_app.users(id);


--
-- Name: admin_history fk_admin_history_admins; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.admin_history
    ADD CONSTRAINT fk_admin_history_admins FOREIGN KEY (admin_id) REFERENCES ml_app.admins(id);


--
-- Name: admin_history fk_admin_history_upd_admins; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.admin_history
    ADD CONSTRAINT fk_admin_history_upd_admins FOREIGN KEY (updated_by_admin_id) REFERENCES ml_app.admins(id);


--
-- Name: app_configuration_history fk_app_configuration_history_admins; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.app_configuration_history
    ADD CONSTRAINT fk_app_configuration_history_admins FOREIGN KEY (admin_id) REFERENCES ml_app.admins(id);


--
-- Name: app_configuration_history fk_app_configuration_history_app_configurations; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.app_configuration_history
    ADD CONSTRAINT fk_app_configuration_history_app_configurations FOREIGN KEY (app_configuration_id) REFERENCES ml_app.app_configurations(id);


--
-- Name: app_type_history fk_app_type_history_admins; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.app_type_history
    ADD CONSTRAINT fk_app_type_history_admins FOREIGN KEY (admin_id) REFERENCES ml_app.admins(id);


--
-- Name: app_type_history fk_app_type_history_app_types; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.app_type_history
    ADD CONSTRAINT fk_app_type_history_app_types FOREIGN KEY (app_type_id) REFERENCES ml_app.app_types(id);


--
-- Name: college_history fk_college_history_colleges; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.college_history
    ADD CONSTRAINT fk_college_history_colleges FOREIGN KEY (college_id) REFERENCES ml_app.colleges(id);


--
-- Name: dynamic_model_history fk_dynamic_model_history_dynamic_models; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.dynamic_model_history
    ADD CONSTRAINT fk_dynamic_model_history_dynamic_models FOREIGN KEY (dynamic_model_id) REFERENCES ml_app.dynamic_models(id);


--
-- Name: external_link_history fk_external_link_history_external_links; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.external_link_history
    ADD CONSTRAINT fk_external_link_history_external_links FOREIGN KEY (external_link_id) REFERENCES ml_app.external_links(id);


--
-- Name: general_selection_history fk_general_selection_history_general_selections; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.general_selection_history
    ADD CONSTRAINT fk_general_selection_history_general_selections FOREIGN KEY (general_selection_id) REFERENCES ml_app.general_selections(id);


--
-- Name: item_flag_history fk_item_flag_history_item_flags; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.item_flag_history
    ADD CONSTRAINT fk_item_flag_history_item_flags FOREIGN KEY (item_flag_id) REFERENCES ml_app.item_flags(id);


--
-- Name: item_flag_name_history fk_item_flag_name_history_item_flag_names; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.item_flag_name_history
    ADD CONSTRAINT fk_item_flag_name_history_item_flag_names FOREIGN KEY (item_flag_name_id) REFERENCES ml_app.item_flag_names(id);


--
-- Name: message_template_history fk_message_template_history_admins; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.message_template_history
    ADD CONSTRAINT fk_message_template_history_admins FOREIGN KEY (admin_id) REFERENCES ml_app.admins(id);


--
-- Name: message_template_history fk_message_template_history_message_templates; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.message_template_history
    ADD CONSTRAINT fk_message_template_history_message_templates FOREIGN KEY (message_template_id) REFERENCES ml_app.message_templates(id);


--
-- Name: nfs_store_archived_file_history fk_nfs_store_archived_file_history_nfs_store_archived_files; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.nfs_store_archived_file_history
    ADD CONSTRAINT fk_nfs_store_archived_file_history_nfs_store_archived_files FOREIGN KEY (nfs_store_archived_file_id) REFERENCES ml_app.nfs_store_archived_files(id);


--
-- Name: nfs_store_archived_file_history fk_nfs_store_archived_file_history_users; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.nfs_store_archived_file_history
    ADD CONSTRAINT fk_nfs_store_archived_file_history_users FOREIGN KEY (user_id) REFERENCES ml_app.users(id);


--
-- Name: nfs_store_container_history fk_nfs_store_container_history_masters; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.nfs_store_container_history
    ADD CONSTRAINT fk_nfs_store_container_history_masters FOREIGN KEY (master_id) REFERENCES ml_app.masters(id);


--
-- Name: nfs_store_container_history fk_nfs_store_container_history_nfs_store_containers; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.nfs_store_container_history
    ADD CONSTRAINT fk_nfs_store_container_history_nfs_store_containers FOREIGN KEY (nfs_store_container_id) REFERENCES ml_app.nfs_store_containers(id);


--
-- Name: nfs_store_container_history fk_nfs_store_container_history_users; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.nfs_store_container_history
    ADD CONSTRAINT fk_nfs_store_container_history_users FOREIGN KEY (user_id) REFERENCES ml_app.users(id);


--
-- Name: nfs_store_filter_history fk_nfs_store_filter_history_admins; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.nfs_store_filter_history
    ADD CONSTRAINT fk_nfs_store_filter_history_admins FOREIGN KEY (admin_id) REFERENCES ml_app.admins(id);


--
-- Name: nfs_store_filter_history fk_nfs_store_filter_history_nfs_store_filters; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.nfs_store_filter_history
    ADD CONSTRAINT fk_nfs_store_filter_history_nfs_store_filters FOREIGN KEY (nfs_store_filter_id) REFERENCES ml_app.nfs_store_filters(id);


--
-- Name: nfs_store_stored_file_history fk_nfs_store_stored_file_history_nfs_store_stored_files; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.nfs_store_stored_file_history
    ADD CONSTRAINT fk_nfs_store_stored_file_history_nfs_store_stored_files FOREIGN KEY (nfs_store_stored_file_id) REFERENCES ml_app.nfs_store_stored_files(id);


--
-- Name: nfs_store_stored_file_history fk_nfs_store_stored_file_history_users; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.nfs_store_stored_file_history
    ADD CONSTRAINT fk_nfs_store_stored_file_history_users FOREIGN KEY (user_id) REFERENCES ml_app.users(id);


--
-- Name: page_layout_history fk_page_layout_history_admins; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.page_layout_history
    ADD CONSTRAINT fk_page_layout_history_admins FOREIGN KEY (admin_id) REFERENCES ml_app.admins(id);


--
-- Name: page_layout_history fk_page_layout_history_page_layouts; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.page_layout_history
    ADD CONSTRAINT fk_page_layout_history_page_layouts FOREIGN KEY (page_layout_id) REFERENCES ml_app.page_layouts(id);


--
-- Name: player_contact_history fk_player_contact_history_masters; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.player_contact_history
    ADD CONSTRAINT fk_player_contact_history_masters FOREIGN KEY (master_id) REFERENCES ml_app.masters(id);


--
-- Name: player_contact_history fk_player_contact_history_player_contacts; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.player_contact_history
    ADD CONSTRAINT fk_player_contact_history_player_contacts FOREIGN KEY (player_contact_id) REFERENCES ml_app.player_contacts(id);


--
-- Name: player_contact_history fk_player_contact_history_users; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.player_contact_history
    ADD CONSTRAINT fk_player_contact_history_users FOREIGN KEY (user_id) REFERENCES ml_app.users(id);


--
-- Name: player_info_history fk_player_info_history_masters; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.player_info_history
    ADD CONSTRAINT fk_player_info_history_masters FOREIGN KEY (master_id) REFERENCES ml_app.masters(id);


--
-- Name: player_info_history fk_player_info_history_player_infos; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.player_info_history
    ADD CONSTRAINT fk_player_info_history_player_infos FOREIGN KEY (player_info_id) REFERENCES ml_app.player_infos(id);


--
-- Name: player_info_history fk_player_info_history_users; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.player_info_history
    ADD CONSTRAINT fk_player_info_history_users FOREIGN KEY (user_id) REFERENCES ml_app.users(id);


--
-- Name: protocol_event_history fk_protocol_event_history_protocol_events; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.protocol_event_history
    ADD CONSTRAINT fk_protocol_event_history_protocol_events FOREIGN KEY (protocol_event_id) REFERENCES ml_app.protocol_events(id);


--
-- Name: protocol_history fk_protocol_history_protocols; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.protocol_history
    ADD CONSTRAINT fk_protocol_history_protocols FOREIGN KEY (protocol_id) REFERENCES ml_app.protocols(id);


--
-- Name: masters fk_rails_00b234154d; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.masters
    ADD CONSTRAINT fk_rails_00b234154d FOREIGN KEY (user_id) REFERENCES ml_app.users(id);


--
-- Name: app_configurations fk_rails_00f31a00c4; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.app_configurations
    ADD CONSTRAINT fk_rails_00f31a00c4 FOREIGN KEY (user_id) REFERENCES ml_app.users(id);


--
-- Name: nfs_store_filters fk_rails_0208c3b54d; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.nfs_store_filters
    ADD CONSTRAINT fk_rails_0208c3b54d FOREIGN KEY (user_id) REFERENCES ml_app.users(id);


--
-- Name: external_identifier_history fk_rails_0210618434; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.external_identifier_history
    ADD CONSTRAINT fk_rails_0210618434 FOREIGN KEY (external_identifier_id) REFERENCES ml_app.external_identifiers(id);


--
-- Name: player_infos fk_rails_08e7f66647; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.player_infos
    ADD CONSTRAINT fk_rails_08e7f66647 FOREIGN KEY (master_id) REFERENCES ml_app.masters(id);


--
-- Name: user_action_logs fk_rails_08eec3f089; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.user_action_logs
    ADD CONSTRAINT fk_rails_08eec3f089 FOREIGN KEY (master_id) REFERENCES ml_app.masters(id);


--
-- Name: role_description_history fk_rails_0910ca20ea; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.role_description_history
    ADD CONSTRAINT fk_rails_0910ca20ea FOREIGN KEY (admin_id) REFERENCES ml_app.admins(id);


--
-- Name: protocol_events fk_rails_0a64e1160a; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.protocol_events
    ADD CONSTRAINT fk_rails_0a64e1160a FOREIGN KEY (admin_id) REFERENCES ml_app.admins(id);


--
-- Name: nfs_store_imports fk_rails_0ad81c489c; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.nfs_store_imports
    ADD CONSTRAINT fk_rails_0ad81c489c FOREIGN KEY (user_id) REFERENCES ml_app.users(id);


--
-- Name: nfs_store_containers fk_rails_0c84487284; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.nfs_store_containers
    ADD CONSTRAINT fk_rails_0c84487284 FOREIGN KEY (nfs_store_container_id) REFERENCES ml_app.nfs_store_containers(id);


--
-- Name: nfs_store_imports fk_rails_0d30944d1b; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.nfs_store_imports
    ADD CONSTRAINT fk_rails_0d30944d1b FOREIGN KEY (nfs_store_container_id) REFERENCES ml_app.nfs_store_containers(id);


--
-- Name: nfs_store_stored_files fk_rails_0de144234e; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.nfs_store_stored_files
    ADD CONSTRAINT fk_rails_0de144234e FOREIGN KEY (nfs_store_container_id) REFERENCES ml_app.nfs_store_containers(id);


--
-- Name: nfs_store_trash_actions fk_rails_0e2ecd8d43; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.nfs_store_trash_actions
    ADD CONSTRAINT fk_rails_0e2ecd8d43 FOREIGN KEY (nfs_store_container_id) REFERENCES ml_app.nfs_store_containers(id);


--
-- Name: masters fk_rails_10869244dc; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.masters
    ADD CONSTRAINT fk_rails_10869244dc FOREIGN KEY (created_by_user_id) REFERENCES ml_app.users(id);


--
-- Name: users fk_rails_1694bfe639; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.users
    ADD CONSTRAINT fk_rails_1694bfe639 FOREIGN KEY (admin_id) REFERENCES ml_app.admins(id);


--
-- Name: activity_log_history fk_rails_16d57266f7; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.activity_log_history
    ADD CONSTRAINT fk_rails_16d57266f7 FOREIGN KEY (activity_log_id) REFERENCES ml_app.activity_logs(id);


--
-- Name: user_roles fk_rails_174e058eb3; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.user_roles
    ADD CONSTRAINT fk_rails_174e058eb3 FOREIGN KEY (admin_id) REFERENCES ml_app.admins(id);


--
-- Name: scantrons fk_rails_1a7e2b01e0; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.scantrons
    ADD CONSTRAINT fk_rails_1a7e2b01e0 FOREIGN KEY (user_id) REFERENCES ml_app.users(id);


--
-- Name: nfs_store_stored_files fk_rails_1cc4562569; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.nfs_store_stored_files
    ADD CONSTRAINT fk_rails_1cc4562569 FOREIGN KEY (user_id) REFERENCES ml_app.users(id);


--
-- Name: activity_log_player_contact_phones fk_rails_1d67a3e7f2; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.activity_log_player_contact_phones
    ADD CONSTRAINT fk_rails_1d67a3e7f2 FOREIGN KEY (protocol_id) REFERENCES ml_app.protocols(id);


--
-- Name: config_library_history fk_rails_1ec40f248c; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.config_library_history
    ADD CONSTRAINT fk_rails_1ec40f248c FOREIGN KEY (admin_id) REFERENCES ml_app.admins(id);


--
-- Name: sub_processes fk_rails_1fc7475261; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.sub_processes
    ADD CONSTRAINT fk_rails_1fc7475261 FOREIGN KEY (admin_id) REFERENCES ml_app.admins(id);


--
-- Name: pro_infos fk_rails_20667815e3; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.pro_infos
    ADD CONSTRAINT fk_rails_20667815e3 FOREIGN KEY (user_id) REFERENCES ml_app.users(id);


--
-- Name: item_flag_names fk_rails_22ccfd95e1; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.item_flag_names
    ADD CONSTRAINT fk_rails_22ccfd95e1 FOREIGN KEY (admin_id) REFERENCES ml_app.admins(id);


--
-- Name: player_infos fk_rails_23cd255bc6; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.player_infos
    ADD CONSTRAINT fk_rails_23cd255bc6 FOREIGN KEY (user_id) REFERENCES ml_app.users(id);


--
-- Name: nfs_store_containers fk_rails_2708bd6a94; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.nfs_store_containers
    ADD CONSTRAINT fk_rails_2708bd6a94 FOREIGN KEY (master_id) REFERENCES ml_app.masters(id);


--
-- Name: nfs_store_downloads fk_rails_272f69e6af; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.nfs_store_downloads
    ADD CONSTRAINT fk_rails_272f69e6af FOREIGN KEY (nfs_store_container_id) REFERENCES ml_app.nfs_store_containers(id);


--
-- Name: role_descriptions fk_rails_291bbea3bc; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.role_descriptions
    ADD CONSTRAINT fk_rails_291bbea3bc FOREIGN KEY (app_type_id) REFERENCES ml_app.app_types(id);


--
-- Name: nfs_store_archived_files fk_rails_2b59e23148; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.nfs_store_archived_files
    ADD CONSTRAINT fk_rails_2b59e23148 FOREIGN KEY (nfs_store_stored_file_id) REFERENCES ml_app.nfs_store_stored_files(id);


--
-- Name: user_description_history fk_rails_2cf2ce330f; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.user_description_history
    ADD CONSTRAINT fk_rails_2cf2ce330f FOREIGN KEY (admin_id) REFERENCES ml_app.admins(id);


--
-- Name: model_references fk_rails_2d8072edea; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.model_references
    ADD CONSTRAINT fk_rails_2d8072edea FOREIGN KEY (to_record_master_id) REFERENCES ml_app.masters(id);


--
-- Name: activity_log_player_contact_phones fk_rails_2de1cadfad; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.activity_log_player_contact_phones
    ADD CONSTRAINT fk_rails_2de1cadfad FOREIGN KEY (master_id) REFERENCES ml_app.masters(id);


--
-- Name: nfs_store_archived_files fk_rails_2eab578259; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.nfs_store_archived_files
    ADD CONSTRAINT fk_rails_2eab578259 FOREIGN KEY (user_id) REFERENCES ml_app.users(id);


--
-- Name: user_roles fk_rails_318345354e; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.user_roles
    ADD CONSTRAINT fk_rails_318345354e FOREIGN KEY (user_id) REFERENCES ml_app.users(id);


--
-- Name: admin_action_logs fk_rails_3389f178f6; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.admin_action_logs
    ADD CONSTRAINT fk_rails_3389f178f6 FOREIGN KEY (admin_id) REFERENCES ml_app.admins(id);


--
-- Name: page_layouts fk_rails_37a2f11066; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.page_layouts
    ADD CONSTRAINT fk_rails_37a2f11066 FOREIGN KEY (app_type_id) REFERENCES ml_app.app_types(id);


--
-- Name: message_notifications fk_rails_3a3553e146; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.message_notifications
    ADD CONSTRAINT fk_rails_3a3553e146 FOREIGN KEY (master_id) REFERENCES ml_app.masters(id);


--
-- Name: nfs_store_uploads fk_rails_3f5167a964; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.nfs_store_uploads
    ADD CONSTRAINT fk_rails_3f5167a964 FOREIGN KEY (nfs_store_container_id) REFERENCES ml_app.nfs_store_containers(id);


--
-- Name: trackers fk_rails_447d125f63; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.trackers
    ADD CONSTRAINT fk_rails_447d125f63 FOREIGN KEY (master_id) REFERENCES ml_app.masters(id);


--
-- Name: scantrons fk_rails_45205ed085; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.scantrons
    ADD CONSTRAINT fk_rails_45205ed085 FOREIGN KEY (master_id) REFERENCES ml_app.masters(id);


--
-- Name: role_description_history fk_rails_47581bba71; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.role_description_history
    ADD CONSTRAINT fk_rails_47581bba71 FOREIGN KEY (app_type_id) REFERENCES ml_app.app_types(id);


--
-- Name: trackers fk_rails_47b051d356; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.trackers
    ADD CONSTRAINT fk_rails_47b051d356 FOREIGN KEY (sub_process_id) REFERENCES ml_app.sub_processes(id);


--
-- Name: addresses fk_rails_48c9e0c5a2; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.addresses
    ADD CONSTRAINT fk_rails_48c9e0c5a2 FOREIGN KEY (user_id) REFERENCES ml_app.users(id);


--
-- Name: colleges fk_rails_49306e4f49; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.colleges
    ADD CONSTRAINT fk_rails_49306e4f49 FOREIGN KEY (user_id) REFERENCES ml_app.users(id);


--
-- Name: model_references fk_rails_4bbf83b940; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.model_references
    ADD CONSTRAINT fk_rails_4bbf83b940 FOREIGN KEY (user_id) REFERENCES ml_app.users(id);


--
-- Name: users_contact_infos fk_rails_4decdf690b; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.users_contact_infos
    ADD CONSTRAINT fk_rails_4decdf690b FOREIGN KEY (user_id) REFERENCES ml_app.users(id);


--
-- Name: message_templates fk_rails_4fe5122ed4; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.message_templates
    ADD CONSTRAINT fk_rails_4fe5122ed4 FOREIGN KEY (admin_id) REFERENCES ml_app.admins(id);


--
-- Name: nfs_store_uploads fk_rails_4ff6d28f98; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.nfs_store_uploads
    ADD CONSTRAINT fk_rails_4ff6d28f98 FOREIGN KEY (nfs_store_stored_file_id) REFERENCES ml_app.nfs_store_stored_files(id);


--
-- Name: exception_logs fk_rails_51ae125c4f; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.exception_logs
    ADD CONSTRAINT fk_rails_51ae125c4f FOREIGN KEY (admin_id) REFERENCES ml_app.admins(id);


--
-- Name: protocol_events fk_rails_564af80fb6; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.protocol_events
    ADD CONSTRAINT fk_rails_564af80fb6 FOREIGN KEY (sub_process_id) REFERENCES ml_app.sub_processes(id);


--
-- Name: user_descriptions fk_rails_5a9926bbe8; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.user_descriptions
    ADD CONSTRAINT fk_rails_5a9926bbe8 FOREIGN KEY (app_type_id) REFERENCES ml_app.app_types(id);


--
-- Name: external_identifier_history fk_rails_5b0628cf42; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.external_identifier_history
    ADD CONSTRAINT fk_rails_5b0628cf42 FOREIGN KEY (admin_id) REFERENCES ml_app.admins(id);


--
-- Name: activity_log_player_contact_phones fk_rails_5ce1857310; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.activity_log_player_contact_phones
    ADD CONSTRAINT fk_rails_5ce1857310 FOREIGN KEY (user_id) REFERENCES ml_app.users(id);


--
-- Name: trackers fk_rails_623e0ca5ac; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.trackers
    ADD CONSTRAINT fk_rails_623e0ca5ac FOREIGN KEY (protocol_id) REFERENCES ml_app.protocols(id);


--
-- Name: nfs_store_user_file_actions fk_rails_639da31037; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.nfs_store_user_file_actions
    ADD CONSTRAINT fk_rails_639da31037 FOREIGN KEY (user_id) REFERENCES ml_app.users(id);


--
-- Name: app_configurations fk_rails_647c63b069; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.app_configurations
    ADD CONSTRAINT fk_rails_647c63b069 FOREIGN KEY (app_type_id) REFERENCES ml_app.app_types(id);


--
-- Name: nfs_store_containers fk_rails_6a3d7bf39f; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.nfs_store_containers
    ADD CONSTRAINT fk_rails_6a3d7bf39f FOREIGN KEY (app_type_id) REFERENCES ml_app.app_types(id);


--
-- Name: users fk_rails_6a971dc818; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.users
    ADD CONSTRAINT fk_rails_6a971dc818 FOREIGN KEY (app_type_id) REFERENCES ml_app.app_types(id);


--
-- Name: protocols fk_rails_6de4fd560d; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.protocols
    ADD CONSTRAINT fk_rails_6de4fd560d FOREIGN KEY (admin_id) REFERENCES ml_app.admins(id);


--
-- Name: tracker_history fk_rails_6e050927c2; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.tracker_history
    ADD CONSTRAINT fk_rails_6e050927c2 FOREIGN KEY (tracker_id) REFERENCES ml_app.trackers(id);


--
-- Name: accuracy_scores fk_rails_70c17e88fd; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.accuracy_scores
    ADD CONSTRAINT fk_rails_70c17e88fd FOREIGN KEY (admin_id) REFERENCES ml_app.admins(id);


--
-- Name: external_identifiers fk_rails_7218113eac; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.external_identifiers
    ADD CONSTRAINT fk_rails_7218113eac FOREIGN KEY (admin_id) REFERENCES ml_app.admins(id);


--
-- Name: player_contacts fk_rails_72b1afe72f; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.player_contacts
    ADD CONSTRAINT fk_rails_72b1afe72f FOREIGN KEY (user_id) REFERENCES ml_app.users(id);


--
-- Name: nfs_store_move_actions fk_rails_75138f1972; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.nfs_store_move_actions
    ADD CONSTRAINT fk_rails_75138f1972 FOREIGN KEY (user_id) REFERENCES ml_app.users(id);


--
-- Name: nfs_store_filters fk_rails_776e17eafd; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.nfs_store_filters
    ADD CONSTRAINT fk_rails_776e17eafd FOREIGN KEY (admin_id) REFERENCES ml_app.admins(id);


--
-- Name: users_contact_infos fk_rails_7808f5fdb3; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.users_contact_infos
    ADD CONSTRAINT fk_rails_7808f5fdb3 FOREIGN KEY (admin_id) REFERENCES ml_app.admins(id);


--
-- Name: sub_processes fk_rails_7c10a99849; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.sub_processes
    ADD CONSTRAINT fk_rails_7c10a99849 FOREIGN KEY (protocol_id) REFERENCES ml_app.protocols(id);


--
-- Name: user_access_controls fk_rails_8108e25f83; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.user_access_controls
    ADD CONSTRAINT fk_rails_8108e25f83 FOREIGN KEY (app_type_id) REFERENCES ml_app.app_types(id);


--
-- Name: tracker_history fk_rails_83aa075398; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.tracker_history
    ADD CONSTRAINT fk_rails_83aa075398 FOREIGN KEY (master_id) REFERENCES ml_app.masters(id);


--
-- Name: user_description_history fk_rails_864938f733; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.user_description_history
    ADD CONSTRAINT fk_rails_864938f733 FOREIGN KEY (user_description_id) REFERENCES ml_app.user_descriptions(id);


--
-- Name: pro_infos fk_rails_86cecb1e36; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.pro_infos
    ADD CONSTRAINT fk_rails_86cecb1e36 FOREIGN KEY (master_id) REFERENCES ml_app.masters(id);


--
-- Name: config_library_history fk_rails_88664b466b; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.config_library_history
    ADD CONSTRAINT fk_rails_88664b466b FOREIGN KEY (config_library_id) REFERENCES ml_app.config_libraries(id);


--
-- Name: app_types fk_rails_8be93bcf4b; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.app_types
    ADD CONSTRAINT fk_rails_8be93bcf4b FOREIGN KEY (admin_id) REFERENCES ml_app.admins(id);


--
-- Name: user_description_history fk_rails_8f99de6d81; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.user_description_history
    ADD CONSTRAINT fk_rails_8f99de6d81 FOREIGN KEY (app_type_id) REFERENCES ml_app.app_types(id);


--
-- Name: tracker_history fk_rails_9513fd1c35; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.tracker_history
    ADD CONSTRAINT fk_rails_9513fd1c35 FOREIGN KEY (sub_process_id) REFERENCES ml_app.sub_processes(id);


--
-- Name: sage_assignments fk_rails_971255ec2c; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.sage_assignments
    ADD CONSTRAINT fk_rails_971255ec2c FOREIGN KEY (user_id) REFERENCES ml_app.users(id);


--
-- Name: protocols fk_rails_990daa5f76; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.protocols
    ADD CONSTRAINT fk_rails_990daa5f76 FOREIGN KEY (app_type_id) REFERENCES ml_app.app_types(id);


--
-- Name: role_description_history fk_rails_9d88430088; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.role_description_history
    ADD CONSTRAINT fk_rails_9d88430088 FOREIGN KEY (role_description_id) REFERENCES ml_app.role_descriptions(id);


--
-- Name: tracker_history fk_rails_9e92bdfe65; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.tracker_history
    ADD CONSTRAINT fk_rails_9e92bdfe65 FOREIGN KEY (protocol_event_id) REFERENCES ml_app.protocol_events(id);


--
-- Name: tracker_history fk_rails_9f5797d684; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.tracker_history
    ADD CONSTRAINT fk_rails_9f5797d684 FOREIGN KEY (protocol_id) REFERENCES ml_app.protocols(id);


--
-- Name: addresses fk_rails_a44670b00a; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.addresses
    ADD CONSTRAINT fk_rails_a44670b00a FOREIGN KEY (master_id) REFERENCES ml_app.masters(id);


--
-- Name: model_references fk_rails_a4eb981c4a; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.model_references
    ADD CONSTRAINT fk_rails_a4eb981c4a FOREIGN KEY (from_record_master_id) REFERENCES ml_app.masters(id);


--
-- Name: user_preferences fk_rails_a69bfcfd81; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.user_preferences
    ADD CONSTRAINT fk_rails_a69bfcfd81 FOREIGN KEY (user_id) REFERENCES ml_app.users(id);


--
-- Name: user_history fk_rails_af2f6ffc55; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.user_history
    ADD CONSTRAINT fk_rails_af2f6ffc55 FOREIGN KEY (app_type_id) REFERENCES ml_app.app_types(id);


--
-- Name: activity_log_player_contact_phones fk_rails_b071294797; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.activity_log_player_contact_phones
    ADD CONSTRAINT fk_rails_b071294797 FOREIGN KEY (player_contact_id) REFERENCES ml_app.player_contacts(id);


--
-- Name: colleges fk_rails_b0a6220067; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.colleges
    ADD CONSTRAINT fk_rails_b0a6220067 FOREIGN KEY (admin_id) REFERENCES ml_app.admins(id);


--
-- Name: reports fk_rails_b138baacff; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.reports
    ADD CONSTRAINT fk_rails_b138baacff FOREIGN KEY (admin_id) REFERENCES ml_app.admins(id);


--
-- Name: imports fk_rails_b1e2154c26; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.imports
    ADD CONSTRAINT fk_rails_b1e2154c26 FOREIGN KEY (user_id) REFERENCES ml_app.users(id);


--
-- Name: user_roles fk_rails_b345649dfe; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.user_roles
    ADD CONSTRAINT fk_rails_b345649dfe FOREIGN KEY (app_type_id) REFERENCES ml_app.app_types(id);


--
-- Name: trackers fk_rails_b822840dc1; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.trackers
    ADD CONSTRAINT fk_rails_b822840dc1 FOREIGN KEY (user_id) REFERENCES ml_app.users(id);


--
-- Name: trackers fk_rails_bb6af37155; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.trackers
    ADD CONSTRAINT fk_rails_bb6af37155 FOREIGN KEY (protocol_event_id) REFERENCES ml_app.protocol_events(id);


--
-- Name: imports_model_generators fk_rails_bd9f10d2c7; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.imports_model_generators
    ADD CONSTRAINT fk_rails_bd9f10d2c7 FOREIGN KEY (admin_id) REFERENCES ml_app.admins(id);


--
-- Name: nfs_store_uploads fk_rails_bdb308087e; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.nfs_store_uploads
    ADD CONSTRAINT fk_rails_bdb308087e FOREIGN KEY (user_id) REFERENCES ml_app.users(id);


--
-- Name: admins fk_rails_c05d151591; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.admins
    ADD CONSTRAINT fk_rails_c05d151591 FOREIGN KEY (admin_id) REFERENCES ml_app.admins(id);


--
-- Name: nfs_store_move_actions fk_rails_c1ea9a5fd9; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.nfs_store_move_actions
    ADD CONSTRAINT fk_rails_c1ea9a5fd9 FOREIGN KEY (nfs_store_container_id) REFERENCES ml_app.nfs_store_containers(id);


--
-- Name: item_flags fk_rails_c2d5bb8930; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.item_flags
    ADD CONSTRAINT fk_rails_c2d5bb8930 FOREIGN KEY (item_flag_name_id) REFERENCES ml_app.item_flag_names(id);


--
-- Name: nfs_store_user_file_actions fk_rails_c423dc1802; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.nfs_store_user_file_actions
    ADD CONSTRAINT fk_rails_c423dc1802 FOREIGN KEY (nfs_store_container_id) REFERENCES ml_app.nfs_store_containers(id);


--
-- Name: tracker_history fk_rails_c55341c576; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.tracker_history
    ADD CONSTRAINT fk_rails_c55341c576 FOREIGN KEY (user_id) REFERENCES ml_app.users(id);


--
-- Name: exception_logs fk_rails_c720bf523c; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.exception_logs
    ADD CONSTRAINT fk_rails_c720bf523c FOREIGN KEY (user_id) REFERENCES ml_app.users(id);


--
-- Name: user_action_logs fk_rails_c94bae872a; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.user_action_logs
    ADD CONSTRAINT fk_rails_c94bae872a FOREIGN KEY (app_type_id) REFERENCES ml_app.app_types(id);


--
-- Name: nfs_store_downloads fk_rails_cd756b42dd; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.nfs_store_downloads
    ADD CONSTRAINT fk_rails_cd756b42dd FOREIGN KEY (user_id) REFERENCES ml_app.users(id);


--
-- Name: user_action_logs fk_rails_cfc9dc539f; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.user_action_logs
    ADD CONSTRAINT fk_rails_cfc9dc539f FOREIGN KEY (user_id) REFERENCES ml_app.users(id);


--
-- Name: user_descriptions fk_rails_d15f63d454; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.user_descriptions
    ADD CONSTRAINT fk_rails_d15f63d454 FOREIGN KEY (admin_id) REFERENCES ml_app.admins(id);


--
-- Name: message_notifications fk_rails_d3566ee56d; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.message_notifications
    ADD CONSTRAINT fk_rails_d3566ee56d FOREIGN KEY (app_type_id) REFERENCES ml_app.app_types(id);


--
-- Name: player_contacts fk_rails_d3c0ddde90; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.player_contacts
    ADD CONSTRAINT fk_rails_d3c0ddde90 FOREIGN KEY (master_id) REFERENCES ml_app.masters(id);


--
-- Name: nfs_store_container_history fk_rails_d6593e5c9d; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.nfs_store_container_history
    ADD CONSTRAINT fk_rails_d6593e5c9d FOREIGN KEY (created_by_user_id) REFERENCES ml_app.users(id);


--
-- Name: config_libraries fk_rails_da3ba4f850; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.config_libraries
    ADD CONSTRAINT fk_rails_da3ba4f850 FOREIGN KEY (admin_id) REFERENCES ml_app.admins(id);


--
-- Name: item_flags fk_rails_dce5169cfd; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.item_flags
    ADD CONSTRAINT fk_rails_dce5169cfd FOREIGN KEY (user_id) REFERENCES ml_app.users(id);


--
-- Name: nfs_store_trash_actions fk_rails_de41d50f67; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.nfs_store_trash_actions
    ADD CONSTRAINT fk_rails_de41d50f67 FOREIGN KEY (user_id) REFERENCES ml_app.users(id);


--
-- Name: dynamic_models fk_rails_deec8fcb38; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.dynamic_models
    ADD CONSTRAINT fk_rails_deec8fcb38 FOREIGN KEY (admin_id) REFERENCES ml_app.admins(id);


--
-- Name: nfs_store_containers fk_rails_e01d928507; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.nfs_store_containers
    ADD CONSTRAINT fk_rails_e01d928507 FOREIGN KEY (user_id) REFERENCES ml_app.users(id);


--
-- Name: sage_assignments fk_rails_e3c559b547; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.sage_assignments
    ADD CONSTRAINT fk_rails_e3c559b547 FOREIGN KEY (admin_id) REFERENCES ml_app.admins(id);


--
-- Name: page_layouts fk_rails_e410af4010; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.page_layouts
    ADD CONSTRAINT fk_rails_e410af4010 FOREIGN KEY (admin_id) REFERENCES ml_app.admins(id);


--
-- Name: sage_assignments fk_rails_ebab73db27; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.sage_assignments
    ADD CONSTRAINT fk_rails_ebab73db27 FOREIGN KEY (master_id) REFERENCES ml_app.masters(id);


--
-- Name: external_links fk_rails_ebf3863277; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.external_links
    ADD CONSTRAINT fk_rails_ebf3863277 FOREIGN KEY (admin_id) REFERENCES ml_app.admins(id);


--
-- Name: nfs_store_archived_files fk_rails_ecfa3cb151; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.nfs_store_archived_files
    ADD CONSTRAINT fk_rails_ecfa3cb151 FOREIGN KEY (nfs_store_container_id) REFERENCES ml_app.nfs_store_containers(id);


--
-- Name: nfs_store_containers fk_rails_ee25fc60fa; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.nfs_store_containers
    ADD CONSTRAINT fk_rails_ee25fc60fa FOREIGN KEY (created_by_user_id) REFERENCES ml_app.users(id);


--
-- Name: app_configurations fk_rails_f0ac516fff; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.app_configurations
    ADD CONSTRAINT fk_rails_f0ac516fff FOREIGN KEY (admin_id) REFERENCES ml_app.admins(id);


--
-- Name: nfs_store_filters fk_rails_f547361daa; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.nfs_store_filters
    ADD CONSTRAINT fk_rails_f547361daa FOREIGN KEY (app_type_id) REFERENCES ml_app.app_types(id);


--
-- Name: general_selections fk_rails_f62500107f; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.general_selections
    ADD CONSTRAINT fk_rails_f62500107f FOREIGN KEY (admin_id) REFERENCES ml_app.admins(id);


--
-- Name: role_descriptions fk_rails_f646dbe30d; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.role_descriptions
    ADD CONSTRAINT fk_rails_f646dbe30d FOREIGN KEY (admin_id) REFERENCES ml_app.admins(id);


--
-- Name: message_notifications fk_rails_fa6dbd15de; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.message_notifications
    ADD CONSTRAINT fk_rails_fa6dbd15de FOREIGN KEY (user_id) REFERENCES ml_app.users(id);


--
-- Name: report_history fk_report_history_reports; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.report_history
    ADD CONSTRAINT fk_report_history_reports FOREIGN KEY (report_id) REFERENCES ml_app.reports(id);


--
-- Name: scantron_history fk_scantron_history_masters; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.scantron_history
    ADD CONSTRAINT fk_scantron_history_masters FOREIGN KEY (master_id) REFERENCES ml_app.masters(id);


--
-- Name: scantron_history fk_scantron_history_scantrons; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.scantron_history
    ADD CONSTRAINT fk_scantron_history_scantrons FOREIGN KEY (scantron_table_id) REFERENCES ml_app.scantrons(id);


--
-- Name: scantron_history fk_scantron_history_users; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.scantron_history
    ADD CONSTRAINT fk_scantron_history_users FOREIGN KEY (user_id) REFERENCES ml_app.users(id);


--
-- Name: sub_process_history fk_sub_process_history_sub_processes; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.sub_process_history
    ADD CONSTRAINT fk_sub_process_history_sub_processes FOREIGN KEY (sub_process_id) REFERENCES ml_app.sub_processes(id);


--
-- Name: user_access_control_history fk_user_access_control_history_admins; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.user_access_control_history
    ADD CONSTRAINT fk_user_access_control_history_admins FOREIGN KEY (admin_id) REFERENCES ml_app.admins(id);


--
-- Name: user_access_control_history fk_user_access_control_history_user_access_controls; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.user_access_control_history
    ADD CONSTRAINT fk_user_access_control_history_user_access_controls FOREIGN KEY (user_access_control_id) REFERENCES ml_app.user_access_controls(id);


--
-- Name: user_authorization_history fk_user_authorization_history_user_authorizations; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.user_authorization_history
    ADD CONSTRAINT fk_user_authorization_history_user_authorizations FOREIGN KEY (user_authorization_id) REFERENCES ml_app.user_authorizations(id);


--
-- Name: user_history fk_user_history_users; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.user_history
    ADD CONSTRAINT fk_user_history_users FOREIGN KEY (user_id) REFERENCES ml_app.users(id);


--
-- Name: user_role_history fk_user_role_history_admins; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.user_role_history
    ADD CONSTRAINT fk_user_role_history_admins FOREIGN KEY (admin_id) REFERENCES ml_app.admins(id);


--
-- Name: user_role_history fk_user_role_history_user_roles; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.user_role_history
    ADD CONSTRAINT fk_user_role_history_user_roles FOREIGN KEY (user_role_id) REFERENCES ml_app.user_roles(id);


--
-- Name: rc_cis rc_cis_master_id_fkey; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.rc_cis
    ADD CONSTRAINT rc_cis_master_id_fkey FOREIGN KEY (master_id) REFERENCES ml_app.masters(id);


--
-- Name: tracker_history unique_master_protocol_tracker_id; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.tracker_history
    ADD CONSTRAINT unique_master_protocol_tracker_id FOREIGN KEY (master_id, protocol_id, tracker_id) REFERENCES ml_app.trackers(master_id, protocol_id, id);


--
-- Name: trackers valid_protocol_sub_process; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.trackers
    ADD CONSTRAINT valid_protocol_sub_process FOREIGN KEY (protocol_id, sub_process_id) REFERENCES ml_app.sub_processes(protocol_id, id) MATCH FULL;


--
-- Name: tracker_history valid_protocol_sub_process; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.tracker_history
    ADD CONSTRAINT valid_protocol_sub_process FOREIGN KEY (protocol_id, sub_process_id) REFERENCES ml_app.sub_processes(protocol_id, id) MATCH FULL;


--
-- Name: trackers valid_sub_process_event; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.trackers
    ADD CONSTRAINT valid_sub_process_event FOREIGN KEY (sub_process_id, protocol_event_id) REFERENCES ml_app.protocol_events(sub_process_id, id);


--
-- Name: tracker_history valid_sub_process_event; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--

ALTER TABLE ONLY ml_app.tracker_history
    ADD CONSTRAINT valid_sub_process_event FOREIGN KEY (sub_process_id, protocol_event_id) REFERENCES ml_app.protocol_events(sub_process_id, id);


--
-- Name: viva_meta_variables fk_rails_22773d2230; Type: FK CONSTRAINT; Schema: redcap; Owner: -
--

ALTER TABLE ONLY redcap.viva_meta_variables
    ADD CONSTRAINT fk_rails_22773d2230 FOREIGN KEY (user_id) REFERENCES ml_app.users(id);


--
-- Name: q2_demo_rc_history fk_rails_6ce39db68e; Type: FK CONSTRAINT; Schema: redcap; Owner: -
--

ALTER TABLE ONLY redcap.q2_demo_rc_history
    ADD CONSTRAINT fk_rails_6ce39db68e FOREIGN KEY (q2_demo_rc_id) REFERENCES redcap.q2_demo_rcs(id);


--
-- Name: q2_demo_rcs fk_rails_8e5c114b0e; Type: FK CONSTRAINT; Schema: redcap; Owner: -
--

ALTER TABLE ONLY redcap.q2_demo_rcs
    ADD CONSTRAINT fk_rails_8e5c114b0e FOREIGN KEY (user_id) REFERENCES ml_app.users(id);


--
-- Name: q2_demo_rc_history fk_rails_9042bcd15d; Type: FK CONSTRAINT; Schema: redcap; Owner: -
--

ALTER TABLE ONLY redcap.q2_demo_rc_history
    ADD CONSTRAINT fk_rails_9042bcd15d FOREIGN KEY (user_id) REFERENCES ml_app.users(id);


--
-- Name: viva_meta_variable_history fk_rails_c53c5126b5; Type: FK CONSTRAINT; Schema: redcap; Owner: -
--

ALTER TABLE ONLY redcap.viva_meta_variable_history
    ADD CONSTRAINT fk_rails_c53c5126b5 FOREIGN KEY (user_id) REFERENCES ml_app.users(id);


--
-- Name: viva_meta_variable_history fk_rails_e5b7c1d45d; Type: FK CONSTRAINT; Schema: redcap; Owner: -
--

ALTER TABLE ONLY redcap.viva_meta_variable_history
    ADD CONSTRAINT fk_rails_e5b7c1d45d FOREIGN KEY (viva_meta_variable_id) REFERENCES redcap.viva_meta_variables(id);


--
-- Name: datadic_variables fk_rails_029902d3e3; Type: FK CONSTRAINT; Schema: ref_data; Owner: -
--

ALTER TABLE ONLY ref_data.datadic_variables
    ADD CONSTRAINT fk_rails_029902d3e3 FOREIGN KEY (admin_id) REFERENCES ml_app.admins(id);


--
-- Name: datadic_variable_history fk_rails_143e8a7c25; Type: FK CONSTRAINT; Schema: ref_data; Owner: -
--

ALTER TABLE ONLY ref_data.datadic_variable_history
    ADD CONSTRAINT fk_rails_143e8a7c25 FOREIGN KEY (equivalent_to_id) REFERENCES ref_data.datadic_variables(id);


--
-- Name: redcap_data_dictionaries fk_rails_16cfa46407; Type: FK CONSTRAINT; Schema: ref_data; Owner: -
--

ALTER TABLE ONLY ref_data.redcap_data_dictionaries
    ADD CONSTRAINT fk_rails_16cfa46407 FOREIGN KEY (redcap_project_admin_id) REFERENCES ref_data.redcap_project_admins(id);


--
-- Name: redcap_data_dictionary_history fk_rails_25f366a78c; Type: FK CONSTRAINT; Schema: ref_data; Owner: -
--

ALTER TABLE ONLY ref_data.redcap_data_dictionary_history
    ADD CONSTRAINT fk_rails_25f366a78c FOREIGN KEY (redcap_data_dictionary_id) REFERENCES ref_data.redcap_data_dictionaries(id);


--
-- Name: redcap_data_collection_instruments fk_rails_2aa7bf926a; Type: FK CONSTRAINT; Schema: ref_data; Owner: -
--

ALTER TABLE ONLY ref_data.redcap_data_collection_instruments
    ADD CONSTRAINT fk_rails_2aa7bf926a FOREIGN KEY (admin_id) REFERENCES ml_app.admins(id);


--
-- Name: redcap_client_requests fk_rails_32285f308d; Type: FK CONSTRAINT; Schema: ref_data; Owner: -
--

ALTER TABLE ONLY ref_data.redcap_client_requests
    ADD CONSTRAINT fk_rails_32285f308d FOREIGN KEY (redcap_project_admin_id) REFERENCES ref_data.redcap_project_admins(id);


--
-- Name: datadic_variables fk_rails_34eadb0aee; Type: FK CONSTRAINT; Schema: ref_data; Owner: -
--

ALTER TABLE ONLY ref_data.datadic_variables
    ADD CONSTRAINT fk_rails_34eadb0aee FOREIGN KEY (equivalent_to_id) REFERENCES ref_data.datadic_variables(id);


--
-- Name: redcap_project_users fk_rails_38d0954914; Type: FK CONSTRAINT; Schema: ref_data; Owner: -
--

ALTER TABLE ONLY ref_data.redcap_project_users
    ADD CONSTRAINT fk_rails_38d0954914 FOREIGN KEY (admin_id) REFERENCES ml_app.admins(id);


--
-- Name: datadic_choice_history fk_rails_42389740a0; Type: FK CONSTRAINT; Schema: ref_data; Owner: -
--

ALTER TABLE ONLY ref_data.datadic_choice_history
    ADD CONSTRAINT fk_rails_42389740a0 FOREIGN KEY (admin_id) REFERENCES ml_app.admins(id);


--
-- Name: redcap_data_dictionaries fk_rails_4766ebe50f; Type: FK CONSTRAINT; Schema: ref_data; Owner: -
--

ALTER TABLE ONLY ref_data.redcap_data_dictionaries
    ADD CONSTRAINT fk_rails_4766ebe50f FOREIGN KEY (admin_id) REFERENCES ml_app.admins(id);


--
-- Name: datadic_variable_history fk_rails_5302a77293; Type: FK CONSTRAINT; Schema: ref_data; Owner: -
--

ALTER TABLE ONLY ref_data.datadic_variable_history
    ADD CONSTRAINT fk_rails_5302a77293 FOREIGN KEY (datadic_variable_id) REFERENCES ref_data.datadic_variables(id);


--
-- Name: datadic_choice_history fk_rails_63103b7cf7; Type: FK CONSTRAINT; Schema: ref_data; Owner: -
--

ALTER TABLE ONLY ref_data.datadic_choice_history
    ADD CONSTRAINT fk_rails_63103b7cf7 FOREIGN KEY (datadic_choice_id) REFERENCES ref_data.datadic_choices(id);


--
-- Name: datadic_choices fk_rails_67ca4d7e1f; Type: FK CONSTRAINT; Schema: ref_data; Owner: -
--

ALTER TABLE ONLY ref_data.datadic_choices
    ADD CONSTRAINT fk_rails_67ca4d7e1f FOREIGN KEY (admin_id) REFERENCES ml_app.admins(id);


--
-- Name: redcap_data_collection_instrument_history fk_rails_6c93846f69; Type: FK CONSTRAINT; Schema: ref_data; Owner: -
--

ALTER TABLE ONLY ref_data.redcap_data_collection_instrument_history
    ADD CONSTRAINT fk_rails_6c93846f69 FOREIGN KEY (admin_id) REFERENCES ml_app.admins(id);


--
-- Name: redcap_project_user_history fk_rails_7ba2e90d7d; Type: FK CONSTRAINT; Schema: ref_data; Owner: -
--

ALTER TABLE ONLY ref_data.redcap_project_user_history
    ADD CONSTRAINT fk_rails_7ba2e90d7d FOREIGN KEY (redcap_project_user_id) REFERENCES ref_data.redcap_project_users(id);


--
-- Name: redcap_project_user_history fk_rails_89af917107; Type: FK CONSTRAINT; Schema: ref_data; Owner: -
--

ALTER TABLE ONLY ref_data.redcap_project_user_history
    ADD CONSTRAINT fk_rails_89af917107 FOREIGN KEY (redcap_project_admin_id) REFERENCES ref_data.redcap_project_admins(id);


--
-- Name: datadic_variables fk_rails_8dc5a059ee; Type: FK CONSTRAINT; Schema: ref_data; Owner: -
--

ALTER TABLE ONLY ref_data.datadic_variables
    ADD CONSTRAINT fk_rails_8dc5a059ee FOREIGN KEY (user_id) REFERENCES ml_app.users(id);


--
-- Name: redcap_data_dictionary_history fk_rails_9a6eca0fe7; Type: FK CONSTRAINT; Schema: ref_data; Owner: -
--

ALTER TABLE ONLY ref_data.redcap_data_dictionary_history
    ADD CONSTRAINT fk_rails_9a6eca0fe7 FOREIGN KEY (redcap_project_admin_id) REFERENCES ref_data.redcap_project_admins(id);


--
-- Name: redcap_project_user_history fk_rails_a0bf0fdddb; Type: FK CONSTRAINT; Schema: ref_data; Owner: -
--

ALTER TABLE ONLY ref_data.redcap_project_user_history
    ADD CONSTRAINT fk_rails_a0bf0fdddb FOREIGN KEY (admin_id) REFERENCES ml_app.admins(id);


--
-- Name: redcap_project_users fk_rails_a6952cc0e8; Type: FK CONSTRAINT; Schema: ref_data; Owner: -
--

ALTER TABLE ONLY ref_data.redcap_project_users
    ADD CONSTRAINT fk_rails_a6952cc0e8 FOREIGN KEY (redcap_project_admin_id) REFERENCES ref_data.redcap_project_admins(id);


--
-- Name: redcap_project_admin_history fk_rails_a7610f4fec; Type: FK CONSTRAINT; Schema: ref_data; Owner: -
--

ALTER TABLE ONLY ref_data.redcap_project_admin_history
    ADD CONSTRAINT fk_rails_a7610f4fec FOREIGN KEY (redcap_project_admin_id) REFERENCES ref_data.redcap_project_admins(id);


--
-- Name: redcap_data_collection_instrument_history fk_rails_cb0b57b6c1; Type: FK CONSTRAINT; Schema: ref_data; Owner: -
--

ALTER TABLE ONLY ref_data.redcap_data_collection_instrument_history
    ADD CONSTRAINT fk_rails_cb0b57b6c1 FOREIGN KEY (redcap_project_admin_id) REFERENCES ref_data.redcap_project_admins(id);


--
-- Name: redcap_data_collection_instrument_history fk_rails_ce6075441d; Type: FK CONSTRAINT; Schema: ref_data; Owner: -
--

ALTER TABLE ONLY ref_data.redcap_data_collection_instrument_history
    ADD CONSTRAINT fk_rails_ce6075441d FOREIGN KEY (redcap_data_collection_instrument_id) REFERENCES ref_data.redcap_data_collection_instruments(id);


--
-- Name: datadic_variable_history fk_rails_d7e89fcbde; Type: FK CONSTRAINT; Schema: ref_data; Owner: -
--

ALTER TABLE ONLY ref_data.datadic_variable_history
    ADD CONSTRAINT fk_rails_d7e89fcbde FOREIGN KEY (admin_id) REFERENCES ml_app.admins(id);


--
-- Name: datadic_variable_history fk_rails_ef47f37820; Type: FK CONSTRAINT; Schema: ref_data; Owner: -
--

ALTER TABLE ONLY ref_data.datadic_variable_history
    ADD CONSTRAINT fk_rails_ef47f37820 FOREIGN KEY (user_id) REFERENCES ml_app.users(id);


--
-- Name: redcap_data_dictionary_history fk_rails_fffede9aa7; Type: FK CONSTRAINT; Schema: ref_data; Owner: -
--

ALTER TABLE ONLY ref_data.redcap_data_dictionary_history
    ADD CONSTRAINT fk_rails_fffede9aa7 FOREIGN KEY (admin_id) REFERENCES ml_app.admins(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO ml_app,extra_app,ref_data,redcap,dynamic;

INSERT INTO "schema_migrations" (version) VALUES
('20150602181200'),
('20150602181229'),
('20150602181400'),
('20150602181925'),
('20150602205642'),
('20150603135202'),
('20150603153758'),
('20150603170429'),
('20150604160659'),
('20150609140033'),
('20150609150931'),
('20150609160545'),
('20150609161656'),
('20150609185229'),
('20150609185749'),
('20150609190556'),
('20150610142403'),
('20150610143629'),
('20150610155810'),
('20150610160257'),
('20150610183502'),
('20150610220253'),
('20150610220320'),
('20150610220451'),
('20150611144834'),
('20150611145259'),
('20150611180303'),
('20150611202453'),
('20150616202753'),
('20150616202829'),
('20150618143506'),
('20150618161857'),
('20150618161945'),
('20150619165405'),
('20150622144725'),
('20150623191520'),
('20150623194212'),
('20150625213040'),
('20150626190344'),
('20150629210656'),
('20150630202829'),
('20150702200308'),
('20150707142702'),
('20150707143233'),
('20150707150524'),
('20150707150615'),
('20150707150921'),
('20150707151004'),
('20150707151010'),
('20150707151032'),
('20150707151129'),
('20150707153720'),
('20150707222630'),
('20150710135307'),
('20150710135959'),
('20150710160209'),
('20150710160215'),
('20150715181110'),
('20150720141845'),
('20150720173900'),
('20150720175827'),
('20150721204937'),
('20150724165441'),
('20150727164955'),
('20150728133359'),
('20150728203820'),
('20150728213254'),
('20150728213551'),
('20150729182424'),
('20150730174055'),
('20150730181206'),
('20150730202422'),
('20150803181029'),
('20150803194546'),
('20150803194551'),
('20150804160523'),
('20150804203710'),
('20150805132950'),
('20150805161302'),
('20150805200932'),
('20150811174323'),
('20150812194032'),
('20150820151214'),
('20150820151728'),
('20150820152721'),
('20150820155555'),
('20150826145029'),
('20150826145125'),
('20150924163412'),
('20150924183936'),
('20151005143945'),
('20151009191559'),
('20151013191910'),
('20151015142035'),
('20151015150733'),
('20151015183136'),
('20151016160248'),
('20151019203248'),
('20151019204910'),
('20151020145339'),
('20151021162145'),
('20151021171534'),
('20151022142507'),
('20151022191658'),
('20151023171217'),
('20151026181305'),
('20151028145802'),
('20151028155426'),
('20151109223309'),
('20151120150828'),
('20151120151912'),
('20151123203524'),
('20151124151501'),
('20151125192206'),
('20151202180745'),
('20151208144918'),
('20151208200918'),
('20151208200919'),
('20151208200920'),
('20151208244916'),
('20151208244917'),
('20151208244918'),
('20151216102328'),
('20151218203119'),
('20160210200918'),
('20160210200919'),
('20170823145313'),
('20170901152707'),
('20170908074038'),
('20170922182052'),
('20170926144234'),
('20171002120537'),
('20171013141835'),
('20171013141837'),
('20171025095942'),
('20171031145807'),
('20171207163040'),
('20171207170748'),
('20180119173411'),
('20180123111956'),
('20180123154108'),
('20180126120818'),
('20180206173516'),
('20180209145336'),
('20180209152723'),
('20180209152747'),
('20180209171641'),
('20180228145731'),
('20180301114206'),
('20180302144109'),
('20180313091440'),
('20180319133539'),
('20180319133540'),
('20180319175721'),
('20180320105954'),
('20180320113757'),
('20180320154951'),
('20180320183512'),
('20180321082612'),
('20180321095805'),
('20180404150536'),
('20180405141059'),
('20180416145033'),
('20180426091838'),
('20180502082334'),
('20180504080300'),
('20180531091440'),
('20180723165621'),
('20180725140502'),
('20180814142112'),
('20180814142559'),
('20180814142560'),
('20180814142561'),
('20180814142562'),
('20180814142924'),
('20180814180843'),
('20180815104221'),
('20180817114138'),
('20180817114157'),
('20180818133205'),
('20180821123717'),
('20180822085118'),
('20180822093147'),
('20180830144523'),
('20180831132605'),
('20180911153518'),
('20180913142103'),
('20180924153547'),
('20181002142656'),
('20181002165822'),
('20181003182428'),
('20181004113953'),
('20181008104204'),
('20181030185123'),
('20181108115216'),
('20181113143210'),
('20181113143327'),
('20181113150331'),
('20181113150713'),
('20181113152652'),
('20181113154525'),
('20181113154855'),
('20181113154920'),
('20181113154942'),
('20181113165948'),
('20181113170144'),
('20181113172429'),
('20181113175031'),
('20181113180608'),
('20181113183446'),
('20181113184022'),
('20181113184516'),
('20181113184920'),
('20181113185315'),
('20181205103333'),
('20181206123849'),
('20181220131156'),
('20181220160047'),
('20190130152053'),
('20190130152208'),
('20190131130024'),
('20190201160559'),
('20190201160606'),
('20190225094021'),
('20190226165932'),
('20190226165938'),
('20190226173917'),
('20190312160404'),
('20190312163119'),
('20190416181222'),
('20190502142561'),
('20190517135351'),
('20190523115611'),
('20190528152006'),
('20190612140618'),
('20190614162317'),
('20190624082535'),
('20190628131713'),
('20190709174613'),
('20190709174638'),
('20190711074003'),
('20190711084434'),
('20190902123518'),
('20190906172361'),
('20191115124723'),
('20191115124732'),
('20200313160640'),
('20200403172361'),
('20200611123849'),
('20200723153130'),
('20200727081305'),
('20200727081306'),
('20200727122116'),
('20200727122117'),
('20200731121100'),
('20200731121144'),
('20200731122147'),
('20200731124515'),
('20201109114833'),
('20201111160935'),
('20201111161035'),
('20201111164800'),
('20201111165107'),
('20201111165109'),
('20201111165110'),
('20201112163129'),
('20210108085826'),
('20210110191022'),
('20210110191023'),
('20210110191024'),
('20210110191026'),
('20210110191028'),
('20210110191029'),
('20210110191030'),
('20210110191031'),
('20210110191033'),
('20210124185731'),
('20210124185733'),
('20210124185959'),
('20210124190000'),
('20210124190034'),
('20210124190035'),
('20210124190150'),
('20210124190152'),
('20210124190153'),
('20210124190155'),
('20210124190905'),
('20210124190907'),
('20210124190908'),
('20210124190909'),
('20210124190911'),
('20210124190912'),
('20210128180947'),
('20210129150044'),
('20210129154600'),
('20210201124324'),
('20210204205746'),
('20210209095546'),
('20210209154901'),
('20210215153201'),
('20210216132458'),
('20210216133011'),
('20210303164631'),
('20210303164632'),
('20210305113828'),
('20210308143952'),
('20210312143952'),
('20210318150132'),
('20210318150446'),
('20210330085617'),
('20210406154800'),
('20210428102016'),
('20210526183942'),
('20210712152134'),
('20210809151207'),
('20210816170804'),
('20211020183551'),
('20211031152538'),
('20211031183210'),
('20211031183429'),
('20211041105001'),
('20211115141001'),
('20211117180701'),
('20211124120038'),
('20211126152918'),
('20211206102025'),
('20211206102026'),
('20211206102028'),
('20211206102030'),
('20211206102244'),
('20211206102249'),
('20211206160502'),
('20211220122834'),
('20211220122835'),
('20211220122837'),
('20211220122840'),
('20211220123345'),
('20211220123347'),
('20211220123348'),
('20211220123518'),
('20211220123519'),
('20211220124525'),
('20211220124527'),
('20211220124611'),
('20211220124612'),
('20211220125302'),
('20211220125303'),
('20211220125327'),
('20211220125329'),
('20211220125410'),
('20211220125411'),
('20211220125452'),
('20211220125454'),
('20211220125821'),
('20211220125823'),
('20211220130316'),
('20211220130318'),
('20211220130532'),
('20211220130534'),
('20211220130655'),
('20211220130656'),
('20211220130659'),
('20211222111016'),
('20211222111721'),
('20211222134557'),
('20211222134602'),
('20211222135634'),
('20211222135957'),
('20211222140008'),
('20211222140019'),
('20211231113457'),
('20220121143719'),
('20220131111232'),
('20220131121830'),
('20220131121831'),
('20220131121833'),
('20220131121834'),
('20220131121835'),
('20220131123017'),
('20220131123100'),
('20220131131244'),
('20220131132533'),
('20220131135242'),
('20220131135349'),
('20220131135547'),
('20220131135600'),
('20220131140353'),
('20220131140521'),
('20220131143324'),
('20220131155227'),
('20220131155229'),
('20220131171632'),
('20220131172554'),
('20220131172618'),
('20220131182607'),
('20220131184011'),
('20220131184041'),
('20220131184511'),
('20220201102247'),
('20220201102549'),
('20220201173928'),
('20220201174829'),
('20220202175848'),
('20220202190849'),
('20220202190931'),
('20220202193750'),
('20220203193018'),
('20220203201903'),
('20220214120443'),
('20220214122255'),
('20220214124934'),
('20220214125216'),
('20220214125928'),
('20220214130001'),
('20220214140459'),
('20220214154149'),
('20220216145207'),
('20220217092246'),
('20220217144044'),
('20220218171203'),
('20220218171455'),
('20220221101714'),
('20220221102030'),
('20220221113950'),
('20220221120737'),
('20220221123203'),
('20220222112229'),
('20220222112301'),
('20220223113931'),
('20220223113932'),
('20220223113934'),
('20220223114443'),
('20220223114445'),
('20220223114447'),
('20220223114848'),
('20220223114849'),
('20220223114851'),
('20220223114919'),
('20220223114920'),
('20220223114922'),
('20220223115250'),
('20220223115252'),
('20220223115253'),
('20220223120331'),
('20220223120333'),
('20220223120335'),
('20220223121351'),
('20220223121353'),
('20220223121355'),
('20220223121713'),
('20220223121714'),
('20220223121716'),
('20220224020931'),
('20220224023446'),
('20220224114432'),
('20220224115009'),
('20220224135435'),
('20220224135635'),
('20220224141444'),
('20220224143222'),
('20220225122155'),
('20220301093010'),
('20220301093041'),
('20220301093304'),
('20220301120158'),
('20220301120734'),
('20220301120755'),
('20220301201512'),
('20220303112202'),
('20220304115603'),
('20220304115824'),
('20220304115826'),
('20220304115827'),
('20220304115830'),
('20220304115836'),
('20220304115838'),
('20220304115839'),
('20220304115841'),
('20220304120359'),
('20220304120401'),
('20220304120404'),
('20220304120557'),
('20220304120558'),
('20220304120600'),
('20220304120602'),
('20220304120604'),
('20220304120605'),
('20220307144639'),
('20220307153310'),
('20220307154248'),
('20220307162856'),
('20220307162929'),
('20220307163124'),
('20220307164817'),
('20220307164959'),
('20220324133938'),
('20220324133940'),
('20220324133941'),
('20220324133943'),
('20220324133945'),
('20220324133946'),
('20220324133948'),
('20220324133949'),
('20220324133951'),
('20220324133952'),
('20220324133953'),
('20220328115603'),
('20220329113632'),
('20220329113634'),
('20220329113635'),
('20220329113637'),
('20220329113640'),
('20220329113641'),
('20220329113642'),
('20220329130557'),
('20220329181503'),
('20220330105313'),
('20220330105858'),
('20220331110656'),
('20220331110717'),
('20220331110820'),
('20220421190539'),
('20220421190541'),
('20220421190542'),
('20220421190544'),
('20220421190545'),
('20220421190547'),
('20220421190549'),
('20220421190550'),
('20220421190552'),
('20220421190553'),
('20220421190555'),
('20220421190556'),
('20220421190557'),
('20220421203328'),
('20220422170048'),
('20220422170050'),
('20220422170051'),
('20220422170418'),
('20220422170420'),
('20220422170421'),
('20220422170446'),
('20220422170448'),
('20220422170449'),
('20220422170830'),
('20220422170832'),
('20220422170833'),
('20220422170919'),
('20220422170920'),
('20220422170922'),
('20220422171039'),
('20220422171041'),
('20220422171042'),
('20220422172000'),
('20220422172002'),
('20220422172003'),
('20220422172155'),
('20220422172157'),
('20220422172158'),
('20220422172305'),
('20220422172307'),
('20220422172308'),
('20220422172839'),
('20220422172841'),
('20220422172842'),
('20220422173038'),
('20220422173040'),
('20220422173041'),
('20220422173147'),
('20220422173149'),
('20220422173150'),
('20220422173153'),
('20220422173710'),
('20220422173712'),
('20220422173713'),
('20220422173857'),
('20220422173859'),
('20220422173900'),
('20220422173902'),
('20220422173904'),
('20220422173905'),
('20220422173907'),
('20220422173908'),
('20220422180358'),
('20220422180430'),
('20220422180453'),
('20220422180936'),
('20220422181037'),
('20220426181659'),
('20220427144604'),
('20220427144732'),
('20220429142550'),
('20220429142651'),
('20220503171647'),
('20220503172002'),
('20220503172112'),
('20220503172331'),
('20220503172418'),
('20220503172607'),
('20220503172620'),
('20220503172651'),
('20220503172714'),
('20220505095408'),
('20220509163510'),
('20220510103824'),
('20220510104245'),
('20220510104418'),
('20220510104623'),
('20220510104958'),
('20220510105005'),
('20220510105350'),
('20220510105624'),
('20220510105625'),
('20220510111800'),
('20220510111823'),
('20220510115936'),
('20220510120159'),
('20220510120548'),
('20220510134118'),
('20220510134159'),
('20220511181927'),
('20220511182044'),
('20220512131102'),
('20220512143846'),
('20220512143859'),
('20220512144040'),
('20220512144126'),
('20220512144303'),
('20220512144337'),
('20220512145418'),
('20220512145552'),
('20220512145818'),
('20220512145831'),
('20220512150022'),
('20220512150119'),
('20220512150230'),
('20220512184859'),
('20220512185002'),
('20220512191330'),
('20220512191711'),
('20220512192613'),
('20220512192730'),
('20220512192833'),
('20220512193005'),
('20220512193108'),
('20220512193213'),
('20220512193318'),
('20220512194008'),
('20220512194228'),
('20220512194359'),
('20220512194457'),
('20220512194611'),
('20220512194744'),
('20220512194926'),
('20220516092942'),
('20220516100849'),
('20220516113651'),
('20220516113940'),
('20220516122435'),
('20220516122623'),
('20220516122849'),
('20220516123101'),
('20220516123415'),
('20220516123459'),
('20220516123628'),
('20220517122146'),
('20220517122239'),
('20220517142648'),
('20220517142650'),
('20220517142651'),
('20220517142654'),
('20220517142655'),
('20220517142657'),
('20220517142851'),
('20220517142853'),
('20220517142854'),
('20220517142857'),
('20220517142858'),
('20220517142900'),
('20220517142902'),
('20220517142903'),
('20220517142904'),
('20220517143044'),
('20220517143124'),
('20220517144705'),
('20220517150044'),
('20220519170301'),
('20220524105006'),
('20220524105008'),
('20220524105009'),
('20220524105012'),
('20220524105013'),
('20220524105015'),
('20220524105017'),
('20220524105018'),
('20220526172521'),
('20220526172550'),
('20220526173106'),
('20220526173112'),
('20220526173244'),
('20220526181804'),
('20220526182143'),
('20220531121546'),
('20220601180701'),
('20220621090729'),
('20220621090731'),
('20220621090732'),
('20220621090734'),
('20220621090737'),
('20220621090739'),
('20220621091859'),
('20220621091900'),
('20220621091902'),
('20220621205650'),
('20220621205651'),
('20220621210030'),
('20220621210031'),
('20220621210654'),
('20220621210656'),
('20220621210923'),
('20220621210924'),
('20220621212005'),
('20220621212007'),
('20220621212454'),
('20220621212456'),
('20220621212457'),
('20220621212459'),
('20220621212500'),
('20220621212502'),
('20220621212503'),
('20220621212504'),
('20220621212506'),
('20220621212507'),
('20220621212509'),
('20220621212510'),
('20220621212626'),
('20220621212628'),
('20220621212630'),
('20220621212631'),
('20220621212632'),
('20220621212634'),
('20220621212635'),
('20220621212636'),
('20220621212638'),
('20220621212639'),
('20220621212641'),
('20220621212642'),
('20220621212644'),
('20220621212645'),
('20220621212646'),
('20220621212648'),
('20220621212650'),
('20220621212747'),
('20220621212749'),
('20220621212751'),
('20220621212752'),
('20220621212753'),
('20220621212755'),
('20220621212756'),
('20220621212757'),
('20220621212759'),
('20220621212800'),
('20220621212802'),
('20220621212803'),
('20220621212805'),
('20220621212806'),
('20220621212807'),
('20220621212810'),
('20220621212811'),
('20220621212812'),
('20220621212814'),
('20220622095513'),
('20220622095644'),
('20220624132515'),
('20220624150128'),
('20220624150155'),
('20220627154143'),
('20220627154145'),
('20220627154146'),
('20220627154148'),
('20220627154149'),
('20220627154150'),
('20220627154152'),
('20220627154153'),
('20220627154155'),
('20220627154156'),
('20220627154158'),
('20220627154159'),
('20220627154200'),
('20220627154202'),
('20220627154203'),
('20220627154206'),
('20220627154207'),
('20220627154327'),
('20220627154329'),
('20220627154330'),
('20220627154331'),
('20220627154333'),
('20220627154334'),
('20220627154335'),
('20220627154337'),
('20220627154338'),
('20220627154340'),
('20220627154341'),
('20220627154343'),
('20220627154344'),
('20220627154345'),
('20220627154347'),
('20220627154349'),
('20220627154350'),
('20220630082801'),
('20220704183420'),
('20220704183422'),
('20220704183424'),
('20220704183425'),
('20220704183426'),
('20220704183428'),
('20220704183429'),
('20220704183430'),
('20220704183432'),
('20220704183433'),
('20220704183435'),
('20220704183436'),
('20220704183437'),
('20220704183439'),
('20220704183440'),
('20220704183443'),
('20220704183444'),
('20220824102025'),
('20220824190346'),
('20220915144411'),
('20220915144413'),
('20220915144414'),
('20220915144415'),
('20220915144417'),
('20220915144418'),
('20220915144419'),
('20220915144421'),
('20220915144422'),
('20220915144424'),
('20220915144426'),
('20220915144428'),
('20220915144429'),
('20220915144430'),
('20220915144432'),
('20220915144434'),
('20220915144436'),
('20220915144444'),
('20220915144445'),
('20220916105116'),
('20220916105118'),
('20220916105119'),
('20220916105121'),
('20220916105122'),
('20220916105123'),
('20220916105125'),
('20220916105126'),
('20220916105128'),
('20220916105129'),
('20220916105131'),
('20220916105132'),
('20220916105133'),
('20220916105135'),
('20220916105137'),
('20220916105143'),
('20220916105149'),
('20220916105150'),
('20221031174109'),
('20221110101203'),
('20221110101411'),
('20221110101647'),
('20221110102412'),
('20221110102414'),
('20221110102415'),
('20221110102417'),
('20221110102419'),
('20221110102421'),
('20221110102422'),
('20221110102424'),
('20221110102426'),
('20221110102437'),
('20221110102438'),
('20221110102439'),
('20221110102441'),
('20221110102442'),
('20221110102443'),
('20221110102445'),
('20221110102446'),
('20221110102447'),
('20221110102819'),
('20221110102820'),
('20221110102822'),
('20221110102823'),
('20221110102826'),
('20221110102827'),
('20221110102830'),
('20221110102833'),
('20221110102834'),
('20221110103050'),
('20221110103052'),
('20221110103054'),
('20221110103055'),
('20221110103058'),
('20221110103059'),
('20221110103101'),
('20230104133814'),
('20230117115913'),
('20230209153019'),
('20230309104811'),
('20230309104813'),
('20230309104814'),
('20230309104817'),
('20230309104819'),
('20230309104820'),
('20230309104822'),
('20230309104824'),
('20230309104825'),
('20230309104827'),
('20230309104828'),
('20230309104829'),
('20230309104831'),
('20230309104832'),
('20230309105041'),
('20230309105042'),
('20230309105044'),
('20230309105047'),
('20230309105048'),
('20230309105050'),
('20230309105053'),
('20230309105055'),
('20230309105056'),
('20230309105057'),
('20230309105059'),
('20230309105100'),
('20230309105449'),
('20230309105450'),
('20230309105452'),
('20230309105455'),
('20230309105456'),
('20230309105457'),
('20230309105459'),
('20230309105941'),
('20230309105942'),
('20230309105943'),
('20230309105946'),
('20230309105948'),
('20230309105949'),
('20230309110022'),
('20230309110024'),
('20230309110025'),
('20230309110028'),
('20230309110029'),
('20230309110031'),
('20230309110157'),
('20230309110159'),
('20230309110200'),
('20230309110203'),
('20230309110205'),
('20230309110206'),
('20230309110556'),
('20230309110557'),
('20230309110559'),
('20230309110602'),
('20230309110603'),
('20230309110605'),
('20230309110609'),
('20230309110610'),
('20230309110612'),
('20230309111233'),
('20230309111234'),
('20230309111236'),
('20230309111239'),
('20230309111240'),
('20230309111400'),
('20230309111401'),
('20230309111403'),
('20230309111406'),
('20230309111407'),
('20230309111436'),
('20230309111437'),
('20230309111439'),
('20230309111442'),
('20230309111443'),
('20230309111447'),
('20230309111449'),
('20230309111450'),
('20230309111658'),
('20230309111724'),
('20230309111816'),
('20230420125603'),
('20230420125634'),
('20230502172849'),
('20230502180019'),
('20230502180248'),
('20230502180810'),
('20230711165157'),
('20230711165159'),
('20230711165201'),
('20230711165203'),
('20230711165204'),
('20230711165205'),
('20230711165207'),
('20230711165208'),
('20230711165210'),
('20230711165211'),
('20230711165213'),
('20230711165215'),
('20230711165216'),
('20230711165218'),
('20230711165220'),
('20230711165229'),
('20230711165543'),
('20230711165545'),
('20230711165547'),
('20230711165549'),
('20230711165550'),
('20230711165551'),
('20230711165553'),
('20230711165554'),
('20230711165556'),
('20230711165557'),
('20230711165559'),
('20230711165601'),
('20230711165602'),
('20230711165604'),
('20230711165606'),
('20230711170038'),
('20230711170040'),
('20230711170042'),
('20230711170043'),
('20230711170045'),
('20230711170046'),
('20230711170047'),
('20230711170049'),
('20230711170051'),
('20230711170052'),
('20230711170054'),
('20230711170055'),
('20230711170057'),
('20230711170058'),
('20230711170101'),
('20230711170552'),
('20230711170554'),
('20230711170555'),
('20230711170557'),
('20230711170558'),
('20230711170600'),
('20230711170601'),
('20230711170602'),
('20230711170604'),
('20230711170605'),
('20230711170607'),
('20230711170609'),
('20230711170610'),
('20230711170611'),
('20230711170614'),
('20230711170750'),
('20230711170752'),
('20230711170754'),
('20230711170756'),
('20230711170757'),
('20230711170758'),
('20230711170800'),
('20230711170801'),
('20230711170803'),
('20230711170804'),
('20230711170806'),
('20230711170808'),
('20230711170809'),
('20230711170811'),
('20230711170813'),
('20230711170818'),
('20230711170820'),
('20230712111929'),
('20230712111931'),
('20230712111933'),
('20230712111935'),
('20230712111936'),
('20230712111937'),
('20230712111939'),
('20230712111940'),
('20230712111942'),
('20230712111943'),
('20230712111945'),
('20230712111946'),
('20230712111948'),
('20230712111949'),
('20230712111952'),
('20230712111954'),
('20230712111956'),
('20230712112543'),
('20230712112545'),
('20230712112547'),
('20230712112550'),
('20230712112552'),
('20230712112556'),
('20230712112728'),
('20230712112729'),
('20230712112731'),
('20230712112734'),
('20230712112736'),
('20230712112740'),
('20230712112742'),
('20230712132520'),
('20230712132522'),
('20230712132524'),
('20230712132525'),
('20230712132527'),
('20230712132528'),
('20230712132529'),
('20230712132531'),
('20230712132533'),
('20230712132534'),
('20230712132536'),
('20230712132537'),
('20230712132538'),
('20230712132540'),
('20230712132543'),
('20230712132545'),
('20230712132546'),
('20230712133250'),
('20230712133251'),
('20230712133253'),
('20230712133255'),
('20230712133256'),
('20230712133258'),
('20230712133259'),
('20230712133300'),
('20230712133302'),
('20230712133303'),
('20230712133305'),
('20230712133307'),
('20230712133308'),
('20230712133309'),
('20230712133312'),
('20230712133315'),
('20230712133316'),
('20230809093208'),
('20230809093210'),
('20230809093212'),
('20230809093213'),
('20230809093215'),
('20230809093216'),
('20230809093217'),
('20230809093219'),
('20230809093220'),
('20230809093222'),
('20230809093224'),
('20230809093225'),
('20230809093227'),
('20230809093228'),
('20230809093231'),
('20230809093233'),
('20230809093235'),
('20230814082411'),
('20230814082412'),
('20230814082414'),
('20230814082416'),
('20230814082417'),
('20230814082418'),
('20230814082420'),
('20230814082421'),
('20230814082423'),
('20230814082424'),
('20230814082426'),
('20230814082428'),
('20230814082429'),
('20230814082430'),
('20230814082433'),
('20230814082436'),
('20230814082437'),
('20230822183526'),
('20230822183528'),
('20230822183530'),
('20230822183531'),
('20230822183533'),
('20230822183534'),
('20230822183535'),
('20230822183537'),
('20230822183538'),
('20230822183540'),
('20230822183541'),
('20230822183543'),
('20230822183544'),
('20230822183546'),
('20230822183547'),
('20230822183550'),
('20230822183552'),
('20230822183554'),
('20230824095001'),
('20230920154249'),
('20230920154251'),
('20230920154252'),
('20230920154626'),
('20230920154628'),
('20230920154629'),
('20230920154901'),
('20230920154903'),
('20230920154904'),
('20230920155547'),
('20230920155800'),
('20230920155802'),
('20230920155803'),
('20230920160248'),
('20230920160334'),
('20230920160337'),
('20230920160339'),
('20230920160545'),
('20230920160720'),
('20230927111319'),
('20230927123224'),
('20230927125854'),
('20231011135146'),
('20231011135151'),
('20231011135153'),
('20231011135158'),
('20231011135200'),
('20231011135621'),
('20231011135835'),
('20231011140608'),
('20231012130116'),
('20231017100419'),
('20231017100511'),
('20231017100519'),
('20231017100609'),
('20231017163817'),
('20231030175759'),
('20231030175801'),
('20231106102828'),
('20231106102830'),
('20231106102832'),
('20231106102834'),
('20231106102835'),
('20231106102837'),
('20231106102839'),
('20231106102840'),
('20231106120905'),
('20231107155231'),
('20231115100715'),
('20231115100717'),
('20231115100719'),
('20231127083512'),
('20231127083514'),
('20231127083515'),
('20231130164246'),
('20231130164351'),
('20231130164353'),
('20231130164355'),
('20231204090620'),
('20231212093450'),
('20231212093453'),
('20231212093454'),
('20231212093456'),
('20231212093458'),
('20240116090059'),
('20240116090102'),
('20240116090103'),
('20240116090105'),
('20240116090106'),
('20240116090108'),
('20240116090341'),
('20240116090347'),
('20240116090402'),
('20240129184920'),
('20240129184931'),
('20240129184934'),
('20240213103516'),
('20240213104713'),
('20240506141400');


