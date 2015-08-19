begin transaction;
    alter table precis_page add bg_disabled_b boolean not null default false;
    alter table precis_page add linkbox_enabled_b boolean not null default false;
    update
        precis_page
    set
        bg_disabled_b=(
            case bg_disabled
                when 1 then true
                else false
            end
        );
    update
        precis_page
    set
        linkbox_enabled_b=(
            case linkbox_enabled
                when 1 then true
                else false
            end
        );
    alter table precis_page drop bg_disabled;
    alter table precis_page rename bg_disabled_b to bg_disabled;
    alter table precis_page drop linkbox_enabled;
    alter table precis_page rename linkbox_enabled_b to linkbox_enabled;
commit transaction;
