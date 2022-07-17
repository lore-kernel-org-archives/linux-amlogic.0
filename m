Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E0AC433EF
	for <linux-amlogic@archiver.kernel.org>; Sun, 17 Jul 2022 20:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mqQJ+/5duhTcc6wSVcsli5/SgvK3WIKaNIxmwFpGqCU=; b=3Mmvl6YgIgqkCY
	CjtjNvsIyL5S9U3l9HOVN7255hWRx23HfNcmq6xqx/gvHKmUzkz9Ogs3H6TiSmxiw84cUH6DqiXJi
	vxZ9039q5ghOQlAZNgCe5H3VanpFMPALLogwTYsvjNt6NQ9AfBA24iAoXazVayrgROhRDC95Totx0
	e5Ccy6jGADzc87aAjXTxFT+QExEIVa5jWy1oJ4jaJtC/F6F5UXMJi6Ke2TiJMHqBf4xyAdTlIetq9
	kOFbuy4bUne0rYmWmhAkEIGHwpSg2976dcEQb3XY54rsomY7n3oK502SgP4GCUGDfJmYGNjnm/1KO
	HM0MaNyNkNXZiXsjgqSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDBLq-008djg-B2; Sun, 17 Jul 2022 20:58:54 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDBLe-008dgt-3h; Sun, 17 Jul 2022 20:58:44 +0000
Received: by mail-lf1-x12a.google.com with SMTP id t1so16391665lft.8;
        Sun, 17 Jul 2022 13:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Kanw2W2ASERpZFaOvgv2bw3hiX5n9J9uuXMW7Yv/z2U=;
        b=U2pOAfmh/Xxe11p+789pY9PWjsVEDcLcyDchyt1WRfQGyyzdY/yTqgOh8oYRk5yCLw
         FwVW86RDDdzZaQvufLNN+sN/Im4Z7Le0rLMaB9xk029v1PC4lhl/XqBgKynBiu+DeK8s
         LhUqP4VhZWioP13bIi+W3hFL2FvoFD6LukURa9FPh/JXRwt2+UJsYtRKvbxpSASIlGC2
         YwBHdJRMpPRAbfhciEbAl2Do0nEJBWoV2NyNT8F/SbgGGv9GMGFcQK41wxsRcydxXVrR
         LTmECb/HVAQDBYr62c+3oPTezCIoARUIhEddBuZ4vjCdwENp6MG+31XGZoBC05o1VJoF
         uy7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Kanw2W2ASERpZFaOvgv2bw3hiX5n9J9uuXMW7Yv/z2U=;
        b=2baALN6CAINH3lXebVLzzxcfN10wF4aqgkfgJLKNgJMoCeRlCmWYmDUbYJd18AZbpL
         1lVzvi+5tb8eA1ZukCTh3PlJcEDNAe4F+AgcGkaKQdOkafII3FtT/yl8BfPjqwRoTOhI
         YvS/MXNffRDuxpz2dkHdsPJRw2Wx+MlxoZ8eUal1g9NyDSG/6jkPIlPuyydzys8ttYDR
         KwCTqSlV2CNoe8jThXhxug7GZL9AoOcsoobS70JIxAig22AS2Ga14aFBWrwjFud7U++A
         iDtbgs8s9RAYU38L3VuxxU9oDKUdIFEsAnYmYlJwImdN2/ZMaaFUtCC1tzTnfU10Li4N
         l9kw==
X-Gm-Message-State: AJIora8gixioi7K7N/AirWfzU71plVvqHn3RAg2WDJiXSofFhpW7aZKA
	isJyMsk9VPtH/HVS3c/xJY28090XD06xUEmK+gA=
X-Google-Smtp-Source: AGRyM1s12hP9nP2VRpUGUIefpYEJ6cLVZxKIgevyVlKmyAcJ2LjBE3HBNKMleQ9WWA4rKbkJ//yWffj1BxkGW+/DY6Y=
X-Received: by 2002:a05:6512:308c:b0:48a:22a5:f3d0 with SMTP id
 z12-20020a056512308c00b0048a22a5f3d0mr7158729lfd.494.1658091519876; Sun, 17
 Jul 2022 13:58:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220712063641.2790997-1-jiucheng.xu@amlogic.com>
 <55be073b-caf1-320b-dd42-165636b45a74@arm.com> <db31472c-0494-309a-0ac3-cab845b4e74f@amlogic.com>
 <a0c763c0-eaa0-999e-31bb-d2dbaeb988bb@arm.com>
In-Reply-To: <a0c763c0-eaa0-999e-31bb-d2dbaeb988bb@arm.com>
From: Chris Healy <cphealy@gmail.com>
Date: Sun, 17 Jul 2022 13:58:28 -0700
Message-ID: <CAFXsbZqQC7Vq3bO8GtqtY2hyLjh=+C1qa49pH+9BORmFk6P9XQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] perf/amlogic: Add support for Amlogic meson G12 SoC
 DDR PMU driver
To: Robin Murphy <robin.murphy@arm.com>
Cc: Jiucheng Xu <jiucheng.xu@amlogic.com>, linux-kernel <linux-kernel@vger.kernel.org>, 
	linux ARM <linux-arm-kernel@lists.infradead.org>, linux-amlogic@lists.infradead.org, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Neil Armstrong <narmstrong@baylibre.com>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220717_135842_182942_5F3AD5B1 
X-CRM114-Status: GOOD (  73.63  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Resending as plaintext instead of HTML...

On Fri, Jul 15, 2022 at 9:39 AM Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 2022-07-14 09:17, Jiucheng Xu wrote:
> [...]
> >>> +        list_for_each_entry((sibling), &(event)->sibling_list,
> >>> +                    sibling_list) {
> >>> +            if (sibling->pmu != event->pmu &&
> >>> +                !is_software_event(sibling))
> >>> +                return -EINVAL;
> >>
> >> It looks like you don't have multiple sets of hardware counters; if so
> >> you'd also need to reject the group if it contains more than one event
> >> for this PMU.
> > I have 5 HW counters and 5 relevant events. Do you mean I need reject
> > the group?
>
> Ah, I think I understand a bit better now, so each channel is a separate
> counter - in that case you need to check that the group doesn't contain
> more than one event targeting the same channel. The reason is that
> event_add should return an error when another event is already using the
> given counter - when that happens, perf will try to schedule different
> combinations of events to work out which ones can count simultaneously
> and which need to be multiplexed. However if two conflicting events are
> in the same group, and thus required to be scheduled together
> atomically, then it ends up in an infinite loop trying to achieve the
> impossible. Therefore event_init must reject any group whose events
> would never be able to be scheduled together.
>
> [...]
> >>> +static int ddr_perf_offline_cpu(unsigned int cpu, struct hlist_node
> >>> *node)
> >>> +{
> >>> +    struct ddr_pmu *pmu = hlist_entry_safe(node, struct ddr_pmu, node);
> >>> +    int target;
> >>> +
> >>> +    if (cpu != pmu->cpu)
> >>> +        return 0;
> >>> +
> >>> +    target = cpumask_any_but(cpu_online_mask, cpu);
> >>> +    if (target >= nr_cpu_ids)
> >>> +        return 0;
> >>> +
> >>> +    perf_pmu_migrate_context(&pmu->pmu, cpu, target);
> >>> +    pmu->cpu = target;
> >>> +
> >>> +    WARN_ON(irq_set_affinity_hint(pmu->info.irq_num,
> >>> cpumask_of(pmu->cpu)));
> >>
> >> This is wrong, it needs to be irq_set_affinity().
> >
> > Okay, Could you please tell what is the major difference between the two
> > API?
>
> The affinity hint is just a field exposed to userspace, for the benefit
> of tools like irqbalance, it doesn't actually serve any purpose in the
> kernel itself.
>
> Historically, it used to be the case that irq_set_affinity_hint() also
> happened to call irq_set_affinity() internally, and this anti-pattern
> developed around that due to module exports, but that has all been
> cleaned up now.
>
> [...]
> >>> +        goto err2;
> >>> +    }
> >>> +
> >>> +    irq_name = of_get_property(node, "interrupt-names", NULL);
> >>> +    if (!irq_name)
> >>> +        irq_name = "ddr_pmu";
> >>
> >> That's not how the "interrupt-names" property works. If you only have
> >> a single interrupt then there's not much need for it to be named in
> >> the DT at all. If you do want to use named interrupts then use
> >> platform_get_irq_byname(), and the name should probably have a bnit
> >> more functional meaning. Either way, please don't abuse the DT like this.
> > Okay, actually there will be multiple interrupts , but not in current
> > G12 series.
>
> That's fair enough, so we should try to anticipate it in the design of
> the DT binding. If for instance future SoCs are going to move from
> having a single combined overflow interrupt to a separate interrupt for
> each counter, then the driver can reasonably continue to get them by
> index and we'll effectively only need to update maxItems in the binding.
> If on the other hand there's still going to be one combined overflow
> interrupt, plus some other new interrupt for something completely
> different, then it *could* be more appropriate to have names, and thus
> to define and use a standard "overflow" name from the beginning even
> when it is the only one present, so that we can remain consistent later
> once more are added.

My assumption is that the goal of having this "interrupt-names" in DT
is to cover future cases where there is more than one DRAM controller
instance in the SoC and you want to be able to discriminate between
the two instances with this driver's interrupt name.  If this is true,
as an alternative, you could do something like this:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/i2c/busses/i2c-mt65xx.c?h=v5.19-rc6&id=7fb9dc8109bf9713ffcda65617249099a1942f0f

This should result in each instance having a unique name that includes
the base address as the prefix to the interrupt name which should be
sufficient for determining which instance is which.

>
>
> >>> +
> >>> +    ret = request_irq(info->irq_num, dmc_irq_handler,
> >>> +              IRQF_SHARED, irq_name, (void *)info);
> >>
> >> Who else is sharing the IRQ? If it's other instances of this PMU then
> >> that's still manageable under the normal paradigm, the driver just
> >> needs to coordinate affinity chanmges between all instances. If it's
> >> random other devices, then maybe it's time to reason about how system
> >> PMUs could use proper IRQ-safe locking and abandon the affinity stuff,
> >> since this seems to be coming up more and more.
> >
> > The IRQ is private. I will change it.
>
> OK, that's good. In that case you can simply replace IRQF_SHARED with
> IRQF_NOBALANCING here, since that is needed either way to prevent
> userspace changing affinities behind our back.
>
> [...]
> >>> +static void append_attr_list(struct attribute *attr)
> >>> +{
> >>> +    int i;
> >>> +
> >>> +    for (i = 0; g12_pmu_format_attrs[i] && i < 255; i++)
> >>> +        ;
> >>
> >> Eww, what? :(
> >>
> >>> +
> >>> +    g12_pmu_format_attrs[i] = attr;
> >>> +
> >>> +    g12_pmu_format_attrs[i + 1] = NULL;
> >>
> >> (that's pointless either way)
> >>
> >> OK, I think I see what's going on here now. Dynamically patching the
> >> attribute arrays is pretty grim - it's far cleaner and more
> >> sustainable to statically define the whole array with all the possible
> >> attributes, then use .is_visible to hide the ones which aren't
> >> relevant to the current system.
> >>
> > I have not got your point yet. I have no idea how to use .is_visible to
> > hide the irrelevant attribute. I need a little time to think it.
>
> It might be easiest to follow an example like arm_dsu_pmu - in that
> case, the hardware has an ID register that says which event IDs are
> supported; you could have some kind of static bitmap/lookup
> table/function to encode the equivalent data of which AXI IDs are
> relevant to which PMU model(s). Another approach is to encode the
> supported models directly in each attribute itself and thus make the
> lookup the other way round - this is probably more complex to implement,
> and I hesitate to suggest looking at arm-cmn as an example since that's
> rather extreme and hard to follow, but it is another possibility.
>
> A third option might be to push all the AXI ID data out to JSON in the
> userspace perf tool, like fsl_imx8_ddr_perf seems to do, however that
> might make it less accessible to other userspace tools, so it probably
> depends on your expected use-cases whether that's worth considering or not.
>
> [...]
> >>> +    struct device_node *node = pdev->dev.of_node;
> >>> +    const char *model;
> >>> +
> >>> +    if (of_property_read_string(node, "model", &model))
> >>> +        return -EINVAL;
> >>
> >> No, use of_device_is_compatible(), and define the binding properly.
> >
> > Why the "model" property couldn't be used? Do you mean use existing
> > property rather than creating new one?
>
> Yes, as I suggested on patch #4, the standard practice would be to have
> hierarchical compatible strings in the DT like so:
>
>         compatible = "amlogic,g12b-ddr-pmu", "amlogic,g12-ddr-pmu";
>
> then your of_device_id table can still match on the generic
> "amlogic,g12-ddr-pmu" string to bind the driver, and where necessary you
> can then do:
>
>         if (of_device_is_compatible(node, "amlogic,g12b-ddr-pmu"))
>                 /* do G12B-specific stuff */
>
> Alternatively, you can put all the SoC-specific compatibles directly in
> the of_device_id table and use the .data member to associate your
> SoC-specific identifier or static data which you can then retrieve with
> device_get_match_data(). Both approaches are commonly used.
>
> >>> +    dev_info(&pdev->dev, "%s", model);
> >>> +
> >>> +    if (strcmp(model, "g12a") == 0) {
> >>> +        dev_info(&pdev->dev, "ddr pmu for g12a\n");
> >>> +    } else if (strcmp(model, "g12b") == 0) {
> >>> +        dev_info(&pdev->dev, "ddr pmu for g12b\n");
> >>> +
> >>> +        append_attr_list(&format_attr_nna.attr);
> >>> +        append_attr_list(&format_attr_gdc.attr);
> >>> +        append_attr_list(&format_attr_arm1.attr);
> >>> +        append_attr_list(&format_attr_mipi_isp.attr);
> >>> +        append_attr_list(&format_attr_sd_emmc_a.attr);
> >>> +    } else if (strcmp(model, "sm1") == 0) {
> >>> +        dev_info(&pdev->dev, "ddr pmu for sm1\n");
> >>> +
> >>> +        append_attr_list(&format_attr_nna.attr);
> >>> +    }
> >>> +#endif
> >>> +    return aml_ddr_pmu_create(pdev, &g12_ops, g12_pmu_format_attrs);
> >>> +}
> >>> +
> >>> +static int  __exit g12_ddr_pmu_remove(struct platform_device *pdev)
> >>> +{
> >>> +    aml_ddr_pmu_remove(pdev);
> >>> +
> >>> +    return 0;
> >>> +}
> >>> +
> >>> +#ifdef CONFIG_OF
> >>> +static const struct of_device_id aml_ddr_pmu_dt_match[] = {
> >>> +    {
> >>> +        .compatible = "amlogic,g12-ddr-pmu",
> >>> +    },
> >>> +    {}
> >>> +};
> >>> +#endif
> >>> +
> >>> +static struct platform_driver g12_ddr_pmu_driver = {
> >>> +    .driver = {
> >>> +        .name = "amlogic,ddr-pmu",
> >>> +        .owner = THIS_MODULE,
> >>
> >> The driver core sets this automatically.
> >>
> >>> +    #ifdef CONFIG_OF
> >>> +        .of_match_table = aml_ddr_pmu_dt_match,
> >>> +    #endif
> >>> +    },
> >>> +    .remove = g12_ddr_pmu_remove,
> >>> +};
> >>> +
> >>> +static int __init aml_g12_ddr_pmu_init(void)
> >>> +{
> >>> +    return platform_driver_probe(&g12_ddr_pmu_driver,
> >>> g12_ddr_pmu_probe);
> >>> +}
> >>> +
> >>> +static void __exit aml_g12_ddr_pmu_exit(void)
> >>> +{
> >>> +    platform_driver_unregister(&g12_ddr_pmu_driver);
> >>> +}
> >>> +
> >>> +module_init(aml_g12_ddr_pmu_init);
> >>> +module_exit(aml_g12_ddr_pmu_exit);
> >>
> >> Use module_platform_driver_probe() (if of course you really think the
> >> __init shenanigans are beneficial, otherwise just use regular
> >> module_platform_driver() for even less surprise).
> >>
> >> Thanks,
> >> Robin.
> >
> >
> > Thanks for your time, Robin! TBH I'm a little nervous since this is my
> > first submitting to upstream. Your comments are great and helpful. I
> > will update the driver.
>
> No worries, this is actually pretty good for a first submission. And the
> perf APIs in particular do have some horribly subtle aspects which took
> me a long time to fully understand too :)
>
> Thanks,
> Robin.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
