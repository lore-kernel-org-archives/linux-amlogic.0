Return-Path: <SRS0=2I4g=RX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBC5AC43381
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 Mar 2019 11:16:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 985262184E
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 Mar 2019 11:16:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rPPJz5mF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="d4uoWJLJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 985262184E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r96gonRtpJxfTUajAUo7OgasU2yJkNHGdhUT6oYq2m0=; b=rPPJz5mF8yt9S3
	qLCzF1rib/aTDQeKA/yWIuGe74AT2myckP+5U4bxmJxlOwKaFd6AWPIE1h8SCoFP6zKrwxh4w61QH
	I5hHNvs9AL6TLtNtt/L156jKAx93jK0LkmGNe/+eglyFg2PgASw5937vuTPYXHJiK0HgPp2wE0UZI
	fn5+G7ZSyKKJCpqepv0RBjxPbW/tOEZR6ue0FP0qZDVO+WqJxVga9EH7RsncipyzMKciYr1/Ktste
	f9cVRXU34haWuVI+FtdC00iiNibBpi9GeLkObotNN4EwiaRlwtA5hmUTCghPibCntXIJbAKylS58N
	Gj1G7jkrC6tfuiCuxzsA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6ZD2-0005HL-1t; Wed, 20 Mar 2019 11:16:36 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6ZCy-0005Gj-G8
 for linux-amlogic@lists.infradead.org; Wed, 20 Mar 2019 11:16:34 +0000
Received: by mail-wr1-x443.google.com with SMTP id p10so2315567wrq.1
 for <linux-amlogic@lists.infradead.org>; Wed, 20 Mar 2019 04:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XxwEeTJrKxvdIq9KmR+Syknb75EDo1+TS+oJ0VL1P98=;
 b=d4uoWJLJd0lQM8VDywdO6F3s4L/3hLvXfLNt1Qz7bg0mPZuJisZeAYj1b9mGydwBJ6
 pTdec56r619oRYegTuljqcw5yIlgfPS+030RcQnamVcLQrmNqQLpsx0R2ikIj/kRfgJV
 pky01myCzVQJbKqyEYoC9M/zb0K6xeEQZyCrg5Mf5aYBP3XgP/AxfDan4AvIo9x1WniG
 FNIyesuwysAXMVLDaDSN9xygoQpubY0kFLxDWiCIksHTK+Hh2rKYNYe7cPWGN+5WiPVd
 CLcJ36ENwlv8oJ5UwrPuPRyWTypCVR1+55ALdikyFgYdvrZtfUo6OJs6K/vGZVxJKjuT
 T+UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XxwEeTJrKxvdIq9KmR+Syknb75EDo1+TS+oJ0VL1P98=;
 b=eHMqrcwpqi84jp8ykqkZIMakaQ5pb+McOjL34UtlN4KOC5DGjHSUWmD50kHbZ9yoD6
 QggRgGXLf7lPh020mZoZIJtOJVzraNOKxMpvYgqu/ewcC87fJkZHC2Qwc/TaW3J2K+DR
 XvmvTMad9BJ1xrKzWTzluUMzjU2vcz/B6KnSbqGRsDt/GX21FgJVm4IPwWmiM2No4mn0
 KgtLotjDUG0q6zG8pLV0MgpD42YpvYwhdLTsFWNulDj6Rf8XPONeTW0s3CcFbnAC7tT/
 P3dzIzY8I0Sp/DSFQWn7uQj4JRLF1cVfUsixQZpBA/jDgoiszwztURU00ILs9ONSUWsA
 ZfJw==
X-Gm-Message-State: APjAAAVVN1Mj2dziZPMifxO3K532Xk3SLrherMO4LSSEWx+RX26g1omP
 b91xWFagjbPrle3ob95xX9QwJS/O+ZGrsLY17pmvDA==
X-Google-Smtp-Source: APXvYqyzwPiTAuL/zT10YIwXj+PU5ubImTb5ceI/fSoqvAu5l6JLptTVoXT62kcqmis4k9vv+qFshjmiUmJ42h/63Lg=
X-Received: by 2002:a5d:4750:: with SMTP id o16mr21050445wrs.238.1553080590503; 
 Wed, 20 Mar 2019 04:16:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190319220012.31065-1-martin.blumenstingl@googlemail.com>
 <20190319220012.31065-3-martin.blumenstingl@googlemail.com>
In-Reply-To: <20190319220012.31065-3-martin.blumenstingl@googlemail.com>
From: Maxime Jourdan <mjourdan@baylibre.com>
Date: Wed, 20 Mar 2019 12:16:19 +0100
Message-ID: <CAMO6nawKpBRrp0oBtrGY8KskD6tUX9ZCNeDqSGPB-kMnm27HnA@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: meson: meson8b: add the video decoder clock trees
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190320_041632_686885_B60D9528 
X-CRM114-Status: GOOD (  20.24  )
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Martin, thanks for looking into the video decoder for meson8!
On Tue, Mar 19, 2019 at 11:00 PM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> This adds the four video decoder clock trees.
>
> VDEC_1 is split into two paths on Meson8b and Meson8m2:
> - input mux called "vdec_1_sel"
> - two dividers ("vdec_1_1_div" and "vdec_1_2_div") and gates ("vdec_1_1"
>   and "vdec_1_2")
> - and an output mux (probably glitch-free) called "vdec_1"

Yes, all vdec clocks have a glitch-free mux to be able to safely
adjust the frequency on the fly, although in practice it's barely
used.

> On Meson8 the VDEC_1 tree is simpler because there's only one path:
> - input mux called "vdec_1_sel"
> - divider ("vdec_1_1_div") and gate ("vdec_1_1")
> - (the gate is used as output directly, there's no mux)
>
> The VDEC_HCODEC and VDEC_2 clocks are simple composite clocks each
> consisting of an input mux, divider and a gate.
>
> The VDEC_HEVC clock seems to have two paths similar to the VDEC_1 clock.
> However, the register offsets of the second clock path is not known.
> Amlogic's 3.10 kernel (which is used as reference) sets
> HHI_VDEC2_CLK_CNTL[31] to 1 before changing the VDEC_HEVC clock and back
> to 0 afterwards. For now, leave a TODO comment and only add the first
> path.
>

Looking at aml-3.10/drivers/amlogic/amports/m8b/vdec_clk.c, it's weird
indeed. They seem to copy the divider's value to the same place
(HHI_VDEC2_CLK_CNTL[16~23]), and the only thing that stands out is
enabling HHI_VDEC2_CLK_CNTL[31].

Then again they don't make use of that codepath at all, so who knows..

> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  drivers/clk/meson/meson8b.c | 312 ++++++++++++++++++++++++++++++++++++
>  drivers/clk/meson/meson8b.h |  17 +-
>  2 files changed, 328 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
> index 8e091c2d10e6..37cf0f01bb5d 100644
> --- a/drivers/clk/meson/meson8b.c
> +++ b/drivers/clk/meson/meson8b.c
> @@ -1902,6 +1902,257 @@ static struct clk_regmap meson8b_vpu = {
>         },
>  };
>
> +static const char * const meson8b_vdec_parent_names[] = {
> +       "fclk_div4", "fclk_div3", "fclk_div5", "fclk_div7", "mpll2", "mpll1"
> +};
> +
> +static struct clk_regmap meson8b_vdec_1_sel = {
> +       .data = &(struct clk_regmap_mux_data){
> +               .offset = HHI_VDEC_CLK_CNTL,
> +               .mask = 0x3,
> +               .shift = 9,
> +               .flags = CLK_MUX_ROUND_CLOSEST,
> +       },
> +       .hw.init = &(struct clk_init_data){
> +               .name = "vdec_1_sel",
> +               .ops = &clk_regmap_mux_ops,
> +               .parent_names = meson8b_vdec_parent_names,
> +               .num_parents = ARRAY_SIZE(meson8b_vdec_parent_names),
> +               .flags = CLK_SET_RATE_PARENT,
> +       },
> +};
> +
> +static struct clk_regmap meson8b_vdec_1_1_div = {
> +       .data = &(struct clk_regmap_div_data){
> +               .offset = HHI_VDEC_CLK_CNTL,
> +               .shift = 0,
> +               .width = 7,
> +               .flags = CLK_DIVIDER_ROUND_CLOSEST,
> +       },
> +       .hw.init = &(struct clk_init_data){
> +               .name = "vdec_1_1_div",
> +               .ops = &clk_regmap_divider_ops,
> +               .parent_names = (const char *[]){ "vdec_1_sel" },
> +               .num_parents = 1,
> +               .flags = CLK_SET_RATE_PARENT,
> +       },
> +};
> +
> +static struct clk_regmap meson8b_vdec_1_1 = {
> +       .data = &(struct clk_regmap_gate_data){
> +               .offset = HHI_VDEC_CLK_CNTL,
> +               .bit_idx = 8,
> +       },
> +       .hw.init = &(struct clk_init_data) {
> +               .name = "vdec_1_1",
> +               .ops = &clk_regmap_gate_ops,
> +               .parent_names = (const char *[]){ "vdec_1_1_div" },
> +               .num_parents = 1,
> +               .flags = CLK_SET_RATE_PARENT,
> +       },
> +};
> +
> +static struct clk_regmap meson8b_vdec_1_2_div = {
> +       .data = &(struct clk_regmap_div_data){
> +               .offset = HHI_VDEC3_CLK_CNTL,
> +               .shift = 0,
> +               .width = 7,
> +               .flags = CLK_DIVIDER_ROUND_CLOSEST,
> +       },
> +       .hw.init = &(struct clk_init_data){
> +               .name = "vdec_1_2_div",
> +               .ops = &clk_regmap_divider_ops,
> +               .parent_names = (const char *[]){ "vdec_1_sel" },
> +               .num_parents = 1,
> +               .flags = CLK_SET_RATE_PARENT,
> +       },
> +};
> +
> +static struct clk_regmap meson8b_vdec_1_2 = {
> +       .data = &(struct clk_regmap_gate_data){
> +               .offset = HHI_VDEC3_CLK_CNTL,
> +               .bit_idx = 8,
> +       },
> +       .hw.init = &(struct clk_init_data) {
> +               .name = "vdec_1_2",
> +               .ops = &clk_regmap_gate_ops,
> +               .parent_names = (const char *[]){ "vdec_1_2_div" },
> +               .num_parents = 1,
> +               .flags = CLK_SET_RATE_PARENT,
> +       },
> +};
> +
> +static struct clk_regmap meson8b_vdec_1 = {
> +       .data = &(struct clk_regmap_mux_data){
> +               .offset = HHI_VDEC3_CLK_CNTL,
> +               .mask = 0x1,
> +               .shift = 15,
> +               .flags = CLK_MUX_ROUND_CLOSEST,
> +       },
> +       .hw.init = &(struct clk_init_data){
> +               .name = "vdec_1",
> +               .ops = &clk_regmap_mux_ops,
> +               .parent_names = (const char *[]){ "vdec_1_1", "vdec_1_2" },
> +               .num_parents = 2,
> +               .flags = CLK_SET_RATE_PARENT,
> +       },
> +};
> +
> +static struct clk_regmap meson8b_vdec_hcodec_sel = {
> +       .data = &(struct clk_regmap_mux_data){
> +               .offset = HHI_VDEC_CLK_CNTL,
> +               .mask = 0x3,
> +               .shift = 25,
> +               .flags = CLK_MUX_ROUND_CLOSEST,
> +       },
> +       .hw.init = &(struct clk_init_data){
> +               .name = "vdec_hcodec_sel",
> +               .ops = &clk_regmap_mux_ops,
> +               .parent_names = meson8b_vdec_parent_names,
> +               .num_parents = ARRAY_SIZE(meson8b_vdec_parent_names),
> +               .flags = CLK_SET_RATE_PARENT,
> +       },
> +};
> +
> +static struct clk_regmap meson8b_vdec_hcodec_div = {
> +       .data = &(struct clk_regmap_div_data){
> +               .offset = HHI_VDEC_CLK_CNTL,
> +               .shift = 16,
> +               .width = 7,
> +               .flags = CLK_DIVIDER_ROUND_CLOSEST,
> +       },
> +       .hw.init = &(struct clk_init_data){
> +               .name = "vdec_hcodec_div",
> +               .ops = &clk_regmap_divider_ops,
> +               .parent_names = (const char *[]){ "vdec_hcodec_sel" },
> +               .num_parents = 1,
> +               .flags = CLK_SET_RATE_PARENT,
> +       },
> +};
> +
> +static struct clk_regmap meson8b_vdec_hcodec = {
> +       .data = &(struct clk_regmap_gate_data){
> +               .offset = HHI_VDEC_CLK_CNTL,
> +               .bit_idx = 24,
> +       },
> +       .hw.init = &(struct clk_init_data) {
> +               .name = "vdec_hcodec",
> +               .ops = &clk_regmap_gate_ops,
> +               .parent_names = (const char *[]){ "vdec_hcodec_div" },
> +               .num_parents = 1,
> +               .flags = CLK_SET_RATE_PARENT,
> +       },
> +};
> +
> +static struct clk_regmap meson8b_vdec_2_sel = {
> +       .data = &(struct clk_regmap_mux_data){
> +               .offset = HHI_VDEC2_CLK_CNTL,
> +               .mask = 0x3,
> +               .shift = 9,
> +               .flags = CLK_MUX_ROUND_CLOSEST,
> +       },
> +       .hw.init = &(struct clk_init_data){
> +               .name = "vdec_2_sel",
> +               .ops = &clk_regmap_mux_ops,
> +               .parent_names = meson8b_vdec_parent_names,
> +               .num_parents = ARRAY_SIZE(meson8b_vdec_parent_names),
> +               .flags = CLK_SET_RATE_PARENT,
> +       },
> +};
> +
> +static struct clk_regmap meson8b_vdec_2_div = {
> +       .data = &(struct clk_regmap_div_data){
> +               .offset = HHI_VDEC2_CLK_CNTL,
> +               .shift = 0,
> +               .width = 7,
> +               .flags = CLK_DIVIDER_ROUND_CLOSEST,
> +       },
> +       .hw.init = &(struct clk_init_data){
> +               .name = "vdec_2_div",
> +               .ops = &clk_regmap_divider_ops,
> +               .parent_names = (const char *[]){ "vdec_2_sel" },
> +               .num_parents = 1,
> +               .flags = CLK_SET_RATE_PARENT,
> +       },
> +};
> +
> +static struct clk_regmap meson8b_vdec_2 = {
> +       .data = &(struct clk_regmap_gate_data){
> +               .offset = HHI_VDEC2_CLK_CNTL,
> +               .bit_idx = 8,
> +       },
> +       .hw.init = &(struct clk_init_data) {
> +               .name = "vdec_2",
> +               .ops = &clk_regmap_gate_ops,
> +               .parent_names = (const char *[]){ "vdec_2_div" },
> +               .num_parents = 1,
> +               .flags = CLK_SET_RATE_PARENT,
> +       },
> +};
> +
> +static struct clk_regmap meson8b_vdec_hevc_sel = {
> +       .data = &(struct clk_regmap_mux_data){
> +               .offset = HHI_VDEC2_CLK_CNTL,
> +               .mask = 0x3,
> +               .shift = 25,
> +               .flags = CLK_MUX_ROUND_CLOSEST,
> +       },
> +       .hw.init = &(struct clk_init_data){
> +               .name = "vdec_hevc_sel",
> +               .ops = &clk_regmap_mux_ops,
> +               .parent_names = meson8b_vdec_parent_names,
> +               .num_parents = ARRAY_SIZE(meson8b_vdec_parent_names),
> +               .flags = CLK_SET_RATE_PARENT,
> +       },
> +};
> +
> +static struct clk_regmap meson8b_vdec_hevc_div = {
> +       .data = &(struct clk_regmap_div_data){
> +               .offset = HHI_VDEC2_CLK_CNTL,
> +               .shift = 16,
> +               .width = 7,
> +               .flags = CLK_DIVIDER_ROUND_CLOSEST,
> +       },
> +       .hw.init = &(struct clk_init_data){
> +               .name = "vdec_hevc_div",
> +               .ops = &clk_regmap_divider_ops,
> +               .parent_names = (const char *[]){ "vdec_hevc_sel" },
> +               .num_parents = 1,
> +               .flags = CLK_SET_RATE_PARENT,
> +       },
> +};
> +
> +static struct clk_regmap meson8b_vdec_hevc_en = {
> +       .data = &(struct clk_regmap_gate_data){
> +               .offset = HHI_VDEC2_CLK_CNTL,
> +               .bit_idx = 24,
> +       },
> +       .hw.init = &(struct clk_init_data) {
> +               .name = "vdec_hevc_en",
> +               .ops = &clk_regmap_gate_ops,
> +               .parent_names = (const char *[]){ "vdec_hevc_div" },
> +               .num_parents = 1,
> +               .flags = CLK_SET_RATE_PARENT,
> +       },
> +};
> +
> +static struct clk_regmap meson8b_vdec_hevc = {
> +       .data = &(struct clk_regmap_mux_data){
> +               .offset = HHI_VDEC2_CLK_CNTL,
> +               .mask = 0x1,
> +               .shift = 31,
> +               .flags = CLK_MUX_ROUND_CLOSEST,
> +       },
> +       .hw.init = &(struct clk_init_data){
> +               .name = "vdec_hevc",
> +               .ops = &clk_regmap_mux_ops,
> +               /* TODO: The second parent is currently unknown */
> +               .parent_names = (const char *[]){ "vdec_hevc_en" },
> +               .num_parents = 1,
> +               .flags = CLK_SET_RATE_PARENT,
> +       },
> +};
> +
>  /* Everything Else (EE) domain gates */
>
>  static MESON_GATE(meson8b_ddr, HHI_GCLK_MPEG0, 0);
> @@ -2168,6 +2419,19 @@ static struct clk_hw_onecell_data meson8_hw_onecell_data = {
>                 [CLKID_VPU_0_SEL]           = &meson8b_vpu_0_sel.hw,
>                 [CLKID_VPU_0_DIV]           = &meson8b_vpu_0_div.hw,
>                 [CLKID_VPU]                 = &meson8b_vpu_0.hw,
> +               [CLKID_VDEC_1_SEL]          = &meson8b_vdec_1_sel.hw,
> +               [CLKID_VDEC_1_1_DIV]        = &meson8b_vdec_1_1_div.hw,
> +               [CLKID_VDEC_1]              = &meson8b_vdec_1_1.hw,
> +               [CLKID_VDEC_HCODEC_SEL]     = &meson8b_vdec_hcodec_sel.hw,
> +               [CLKID_VDEC_HCODEC_DIV]     = &meson8b_vdec_hcodec_div.hw,
> +               [CLKID_VDEC_HCODEC]         = &meson8b_vdec_hcodec.hw,
> +               [CLKID_VDEC_2_SEL]          = &meson8b_vdec_2_sel.hw,
> +               [CLKID_VDEC_2_DIV]          = &meson8b_vdec_2_div.hw,
> +               [CLKID_VDEC_2]              = &meson8b_vdec_2.hw,
> +               [CLKID_VDEC_HEVC_SEL]       = &meson8b_vdec_hevc_sel.hw,
> +               [CLKID_VDEC_HEVC_DIV]       = &meson8b_vdec_hevc_div.hw,
> +               [CLKID_VDEC_HEVC_EN]        = &meson8b_vdec_hevc_en.hw,
> +               [CLKID_VDEC_HEVC]           = &meson8b_vdec_hevc.hw,
>                 [CLK_NR_CLKS]               = NULL,
>         },
>         .num = CLK_NR_CLKS,
> @@ -2361,6 +2625,22 @@ static struct clk_hw_onecell_data meson8b_hw_onecell_data = {
>                 [CLKID_VPU_1_DIV]           = &meson8b_vpu_1_div.hw,
>                 [CLKID_VPU_1]               = &meson8b_vpu_1.hw,
>                 [CLKID_VPU]                 = &meson8b_vpu.hw,
> +               [CLKID_VDEC_1_SEL]          = &meson8b_vdec_1_sel.hw,
> +               [CLKID_VDEC_1_1_DIV]        = &meson8b_vdec_1_1_div.hw,
> +               [CLKID_VDEC_1_1]            = &meson8b_vdec_1_1.hw,
> +               [CLKID_VDEC_1_2_DIV]        = &meson8b_vdec_1_2_div.hw,
> +               [CLKID_VDEC_1_2]            = &meson8b_vdec_1_2.hw,
> +               [CLKID_VDEC_1]              = &meson8b_vdec_1.hw,
> +               [CLKID_VDEC_HCODEC_SEL]     = &meson8b_vdec_hcodec_sel.hw,
> +               [CLKID_VDEC_HCODEC_DIV]     = &meson8b_vdec_hcodec_div.hw,
> +               [CLKID_VDEC_HCODEC]         = &meson8b_vdec_hcodec.hw,
> +               [CLKID_VDEC_2_SEL]          = &meson8b_vdec_2_sel.hw,
> +               [CLKID_VDEC_2_DIV]          = &meson8b_vdec_2_div.hw,
> +               [CLKID_VDEC_2]              = &meson8b_vdec_2.hw,
> +               [CLKID_VDEC_HEVC_SEL]       = &meson8b_vdec_hevc_sel.hw,
> +               [CLKID_VDEC_HEVC_DIV]       = &meson8b_vdec_hevc_div.hw,
> +               [CLKID_VDEC_HEVC_EN]        = &meson8b_vdec_hevc_en.hw,
> +               [CLKID_VDEC_HEVC]           = &meson8b_vdec_hevc.hw,
>                 [CLK_NR_CLKS]               = NULL,
>         },
>         .num = CLK_NR_CLKS,
> @@ -2556,6 +2836,22 @@ static struct clk_hw_onecell_data meson8m2_hw_onecell_data = {
>                 [CLKID_VPU_1_DIV]           = &meson8b_vpu_1_div.hw,
>                 [CLKID_VPU_1]               = &meson8b_vpu_1.hw,
>                 [CLKID_VPU]                 = &meson8b_vpu.hw,
> +               [CLKID_VDEC_1_SEL]          = &meson8b_vdec_1_sel.hw,
> +               [CLKID_VDEC_1_1_DIV]        = &meson8b_vdec_1_1_div.hw,
> +               [CLKID_VDEC_1_1]            = &meson8b_vdec_1_1.hw,
> +               [CLKID_VDEC_1_2_DIV]        = &meson8b_vdec_1_2_div.hw,
> +               [CLKID_VDEC_1_2]            = &meson8b_vdec_1_2.hw,
> +               [CLKID_VDEC_1]              = &meson8b_vdec_1.hw,
> +               [CLKID_VDEC_HCODEC_SEL]     = &meson8b_vdec_hcodec_sel.hw,
> +               [CLKID_VDEC_HCODEC_DIV]     = &meson8b_vdec_hcodec_div.hw,
> +               [CLKID_VDEC_HCODEC]         = &meson8b_vdec_hcodec.hw,
> +               [CLKID_VDEC_2_SEL]          = &meson8b_vdec_2_sel.hw,
> +               [CLKID_VDEC_2_DIV]          = &meson8b_vdec_2_div.hw,
> +               [CLKID_VDEC_2]              = &meson8b_vdec_2.hw,
> +               [CLKID_VDEC_HEVC_SEL]       = &meson8b_vdec_hevc_sel.hw,
> +               [CLKID_VDEC_HEVC_DIV]       = &meson8b_vdec_hevc_div.hw,
> +               [CLKID_VDEC_HEVC_EN]        = &meson8b_vdec_hevc_en.hw,
> +               [CLKID_VDEC_HEVC]           = &meson8b_vdec_hevc.hw,
>                 [CLK_NR_CLKS]               = NULL,
>         },
>         .num = CLK_NR_CLKS,
> @@ -2729,6 +3025,22 @@ static struct clk_regmap *const meson8b_clk_regmaps[] = {
>         &meson8b_vpu_1_div,
>         &meson8b_vpu_1,
>         &meson8b_vpu,
> +       &meson8b_vdec_1_sel,
> +       &meson8b_vdec_1_1_div,
> +       &meson8b_vdec_1_1,
> +       &meson8b_vdec_1_2_div,
> +       &meson8b_vdec_1_2,
> +       &meson8b_vdec_1,
> +       &meson8b_vdec_hcodec_sel,
> +       &meson8b_vdec_hcodec_div,
> +       &meson8b_vdec_hcodec,
> +       &meson8b_vdec_2_sel,
> +       &meson8b_vdec_2_div,
> +       &meson8b_vdec_2,
> +       &meson8b_vdec_hevc_sel,
> +       &meson8b_vdec_hevc_div,
> +       &meson8b_vdec_hevc_en,
> +       &meson8b_vdec_hevc,
>  };
>
>  static const struct meson8b_clk_reset_line {
> diff --git a/drivers/clk/meson/meson8b.h b/drivers/clk/meson/meson8b.h
> index e775f91ccce9..ed37196187e6 100644
> --- a/drivers/clk/meson/meson8b.h
> +++ b/drivers/clk/meson/meson8b.h
> @@ -37,6 +37,9 @@
>  #define HHI_MALI_CLK_CNTL              0x1b0 /* 0x6c offset in data sheet */
>  #define HHI_VPU_CLK_CNTL               0x1bc /* 0x6f offset in data sheet */
>  #define HHI_HDMI_CLK_CNTL              0x1cc /* 0x73 offset in data sheet */
> +#define HHI_VDEC_CLK_CNTL              0x1e0 /* 0x78 offset in data sheet */
> +#define HHI_VDEC2_CLK_CNTL             0x1e4 /* 0x79 offset in data sheet */
> +#define HHI_VDEC3_CLK_CNTL             0x1e8 /* 0x7a offset in data sheet */
>  #define HHI_NAND_CLK_CNTL              0x25c /* 0x97 offset in data sheet */
>  #define HHI_MPLL_CNTL                  0x280 /* 0xa0 offset in data sheet */
>  #define HHI_SYS_PLL_CNTL               0x300 /* 0xc0 offset in data sheet */
> @@ -156,8 +159,20 @@
>  #define CLKID_VPU_1_SEL                186
>  #define CLKID_VPU_1_DIV                187
>  #define CLKID_VPU_1            189
> +#define CLKID_VDEC_1_SEL       191
> +#define CLKID_VDEC_1_1_DIV     192
> +#define CLKID_VDEC_1_1         193
> +#define CLKID_VDEC_1_2_DIV     194
> +#define CLKID_VDEC_1_2         195

In order to make use of the glitch-free mux by the driver, shouldn't
CLKID_VDEC_1_1 and CLKID_VDEC_1_2 be exported in the bindings ?

> +#define CLKID_VDEC_HCODEC_SEL  197
> +#define CLKID_VDEC_HCODEC_DIV  198
> +#define CLKID_VDEC_2_SEL       200
> +#define CLKID_VDEC_2_DIV       201
> +#define CLKID_VDEC_HEVC_SEL    203
> +#define CLKID_VDEC_HEVC_DIV    204
> +#define CLKID_VDEC_HEVC_EN     205
>
> -#define CLK_NR_CLKS            191
> +#define CLK_NR_CLKS            207
>
>  /*
>   * include the CLKID and RESETID that have
> --
> 2.21.0
>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
