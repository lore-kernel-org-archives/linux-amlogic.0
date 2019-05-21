Return-Path: <SRS0=vjLk=TV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98195C04AAF
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 May 2019 17:49:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F1AE21479
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 May 2019 17:49:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gpmfie5L";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="VkVn705o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F1AE21479
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yo36hheuNuuKs4YdSW3lJfvTA1uQrF2ZNqX94ii5QHQ=; b=gpmfie5LUHoL5e
	Gdw9jBENSrIYcYG2gDk4+i3u3A09J1DA/8eAGp7HcjjJOTBe1LZQyUCxITpehNItAaulgj5jPqMfO
	EkhaL+TGUj1N+LkJEXU9IpWGR0ewE1cY95B2j9YDys3viKhGAFVWqtMGCuuVvN3gMWxpOhZz48Peb
	KSO6VNwQISLnBVCcNyyUWjqPdpQrFWLhHAEC+8mdFHgqx7PXylCCezUhWR/DSGLBro52BlJ1Tk1bK
	8N0wfKIy4PbYhR5ZDOQW+MfbgQy87VZ0UDR0jYSbJbEmWYsUfpXd5sRBEmRCxYj7hXOPMSvodbeeT
	VKHvXri4tZijKuG6zyJg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hT8tR-0004qZ-KN; Tue, 21 May 2019 17:49:41 +0000
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hT8tN-0004q7-OA; Tue, 21 May 2019 17:49:39 +0000
Received: by mail-oi1-x243.google.com with SMTP id y124so9161202oiy.3;
 Tue, 21 May 2019 10:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Yy3oYPWdeUlJWNni35uRANPHnH/KZjqT8e9g9rhiirM=;
 b=VkVn705o7OpQFHF9HbuH2HaFLohjO9EUw3hhXGLr+u/78N8WUwIm/rBJBHffrztZdq
 D+sXQCuVSRDH8pUldl/f0ZVTDRpQf16pGmtJHwNT7TcHo/IcHQbZVzCMnfrDHZOD/7py
 pwTIgpIwHGr5iEI+LGIGeDsKUUZWMGqmw4ffn/Ct7W7tblfJYpcA2CPdw8zDQAHuPehe
 jobcU4jXoITVfWwSOIgahxhHRlHyxWdop5/2bO9cWpV/KnacspWfewatTh/EJVMJUC7S
 p5oca3a4lldAjZSJRVKoC7GXU9HZDyZAqKR1GgO2TT08WomiUPOoVB0V9hgSxBL6PZUh
 4+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Yy3oYPWdeUlJWNni35uRANPHnH/KZjqT8e9g9rhiirM=;
 b=ivAvwbzunrA/GbBKxl9tHKdA4NipnL+FJQSuCte5OzlAb4MRALTdHz3sc4NzrRr/80
 EjL9j73vg7oqIj3N0suA3qAeaeonh/1B2DfPfvoOwblaZMIBLkgWAOkVwZ+zjYltOna4
 q7GPKYSTEr/2iQr/BTrwpJKvi/By3K4NWRviEa6hz3MyMrCTxYg7u3kICSe3h8GKyksi
 gFThlYGvGlKiEb4n00fC5vMXjDZsrVjoZf385t5lm2sfiq3b5cRZEr4vrLEb5sJS6Ik7
 zT7QgqEuofAKUM5BdJHEuBfwH2p5MUPigJ6zk5j/PoSBccrtPkNgIbTYSkSy4CcA+LSV
 CJfg==
X-Gm-Message-State: APjAAAWIJ77KBMZM3YiNpEKX4EFGODwe8sxdlbz5pdIEP2hfcdGbmDKg
 oiJfrn4EBGtuo23kerCq995zuE7YLSEjm31RcERh5FWKjA0=
X-Google-Smtp-Source: APXvYqwsTyLWRVtVJGzYLFw570+vGq26/BU5Rlh7Kr1b1kBkg18irFOUv0iHFMKBHXzmvtcX9F3LescfHwPspCkkezo=
X-Received: by 2002:aca:ed0a:: with SMTP id l10mr4510948oih.39.1558460976843; 
 Tue, 21 May 2019 10:49:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190521150130.31684-1-narmstrong@baylibre.com>
 <20190521150130.31684-3-narmstrong@baylibre.com>
In-Reply-To: <20190521150130.31684-3-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 21 May 2019 19:49:25 +0200
Message-ID: <CAFBinCB+DD=hssuswV6M4i1Buv7bs0-6TfPTRVdUrhaprLMb0w@mail.gmail.com>
Subject: Re: [PATCH 2/3] clk: meson: g12a: Add support for G12B CPUB clocks
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190521_104937_814024_ED2AFE2A 
X-CRM114-Status: GOOD (  12.80  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

On Tue, May 21, 2019 at 5:02 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Update the Meson G12A Clock driver to support the Amlogic G12B SoC.
>
> G12B clock driver is very close, the main differences are :
> - the clock tree is duplicated for the both clusters, and the
>   SYS_PLL are swapped between the clusters
> - G12A has additional clocks like for CSI an other components
should this also be G12B?

[...]
> +static struct clk_regmap g12b_cpub_clk_apb_div = {
if you also think that it's worth it then please add a comment stating
that this is called "PCLK_mux" in the datasheet
same goes for the ATB and AXI clocks below as the naming in the driver
and datasheet differs

> +       .data = &(struct clk_regmap_div_data){
> +               .offset = HHI_SYS_CPUB_CLK_CNTL1,
> +               .shift = 3,
> +               .width = 3,
> +               .flags = CLK_DIVIDER_POWER_OF_TWO,
> +       },
> +       .hw.init = &(struct clk_init_data){
> +               .name = "cpub_clk_apb_div",
> +               .ops = &clk_regmap_divider_ro_ops,
> +               .parent_names = (const char *[]){ "cpub_clk" },
> +               .num_parents = 1,
> +       },
> +};
I'm assuming you checked that this is really a power of two divider,
on the Meson8/8b/8m2 SoCs this is a mux between div[2..8]
(the same goes for the ATB, AXI and trace div clocks below)

> +
> +static struct clk_regmap g12b_cpub_clk_apb = {
> +       .data = &(struct clk_regmap_gate_data){
> +               .offset = HHI_SYS_CPUB_CLK_CNTL1,
> +               .bit_idx = 16,
the public S922X datasheet calls this "PCLK_dis", does this mean you
need a flag here?
  .flags = CLK_GATE_SET_TO_DISABLE,

[...]
> +static struct clk_regmap g12b_cpub_clk_atb = {
> +       .data = &(struct clk_regmap_gate_data){
> +               .offset = HHI_SYS_CPUB_CLK_CNTL1,
> +               .bit_idx = 17,
the public S922X datasheet calls this "ATCLK_clk_dis", does this mean
you need a flag here?
  .flags = CLK_GATE_SET_TO_DISABLE,

[...]
> +static struct clk_regmap g12b_cpub_clk_axi = {
> +       .data = &(struct clk_regmap_gate_data){
> +               .offset = HHI_SYS_CPUB_CLK_CNTL1,
> +               .bit_idx = 18,
the public S922X datasheet calls this "ACLKM_clk_dis", does this mean
you need a flag here?
  .flags = CLK_GATE_SET_TO_DISABLE,

[...]
> +static struct clk_regmap g12b_cpub_clk_trace = {
> +       .data = &(struct clk_regmap_gate_data){
> +               .offset = HHI_SYS_CPUB_CLK_CNTL1,
> +               .bit_idx = 23,
the public S922X datasheet calls this "Trace_clk_dis", does this mean
you need a flag here?
  .flags = CLK_GATE_SET_TO_DISABLE,


Regards
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
