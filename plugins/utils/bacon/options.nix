{helpers}: {
  quickfix = {
    enabled = helpers.defaultNullOpts.mkBool true "true to populate the quickfix list with bacon errors and warnings.";
    event_trigger = helpers.defaultNullOpts.mkBool true "triggers the QuickFixCmdPost event after populating the quickfix list";
  };
}
