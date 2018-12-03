Return-Path: <SRS0=94bh=OM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67FEAC04EB9
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Dec 2018 21:54:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 362EC20850
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Dec 2018 21:54:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XSmLpRHW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="GNVs5ODp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 362EC20850
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-ID:References:
	In-Reply-To:From:To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ngJof8I10iCwMiKvdzM+WVBLODGZ7xWCN9knam+33UE=; b=XSmLpRHWASnnwr
	YwpCo+5QjvPs8y++Uj2G3uqdpLIgHP7XEfX/F0kWQ9fHMoBcalRmxd5UHWG/jeW4kBv2ZwBiYyQyL
	ROjUG+LH+Wwu+ssfenl6BrZEVY217r+OsspC/i28JmLWvQGOfGdljWoWBa9m/tLxHIyLLkzD4aLpJ
	oNCBj9Z1LVg+xZyTaZvi7SdxjAfLV0O0wKuMlAKNO9Ar1ezf357kL/p+5Ht6O37+8Ej7JuBDVGIAO
	WjUxJahGwGRFDz4DaKWw5So/e1wFXNTZ24mNL0P5O0FXZQpxRCOknvMxvjEDja7UY8ZTLjPWM7aVR
	hlzpFlrNB5Qz7nL3pK3g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gTwAi-00087w-CN; Mon, 03 Dec 2018 21:54:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gTwAe-00085a-So
 for linux-amlogic@lists.infradead.org; Mon, 03 Dec 2018 21:54:30 +0000
Received: from localhost (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4E08B20864;
 Mon,  3 Dec 2018 21:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1543874056;
 bh=2Wp/1VZ19iUdG965GD+O05IBYwAn8sHWLKyP+buAeI8=;
 h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
 b=GNVs5ODpLxJrCOoWU07LeldxQuzX0J2t+M3qTzXdnZAizgYx+d6G6BPeDlYiDeVS4
 dp28eWLQqSlWKymFYSSgfjFq61o6GKxCkwr77MbP5ufHwxDB+GJDMq/rpOQD3gYtka
 LsCZpdAWhsibgfDlaygpTEugpZLbN2IY01xlvvbE=
MIME-Version: 1.0
To: Neil Armstrong <narmstrong@baylibre.com>, mturquette@baylibre.com
From: Stephen Boyd <sboyd@kernel.org>
X-Patchwork-Hint: ignore
In-Reply-To: <8b905b7b-d72a-010f-bb2c-3cadeca603ed@baylibre.com>
References: <8b905b7b-d72a-010f-bb2c-3cadeca603ed@baylibre.com>
Message-ID: <154387405554.88331.5413259014915237358@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: Re: [GIT PULL] clk: meson: updates for v4.21
Date: Mon, 03 Dec 2018 13:54:15 -0800
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181203_135428_964437_FC61F844 
X-CRM114-Status: UNSURE (   8.88  )
X-CRM114-Notice: Please train this message.
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
Cc: "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Quoting Neil Armstrong (2018-11-23 07:23:33)
> Dear clock maintainers,
> 
> Below is a request to pull updates for Amlogic clocks.
> 
> It covers essentially Meson GX Video clocks, Meson8b CPU clocks
> and 2 bindings changes.

Pulled into clk-next now.

I got this when testing:

drivers/clk/meson/vid-pll-div.c:58:26: warning: symbol '_get_table_val' was not declared. Should it be static?
drivers/clk/meson/gxbb.c:1585:12: warning: symbol 'gxbb_vid_pll_parent_names' was not declared. Should it be static?
drivers/clk/meson/gxbb.c:1620:12: warning: symbol 'gxbb_vclk_parent_names' was not declared. Should it be static?
drivers/clk/meson/gxbb.c:1980:12: warning: symbol 'gxbb_cts_parent_names' was not declared. Should it be static?
drivers/clk/meson/gxbb.c:2036:12: warning: symbol 'gxbb_cts_hdmi_tx_parent_names' was not declared. Should it be static?

which looks like nice sparse noise to silence.

It would also be nice to make that table of mux selectors const, is that
possible?

---8<----
diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index 30fbf8f1f190..b92df222f553 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -1582,7 +1582,7 @@ static struct clk_regmap gxbb_vid_pll_div = {
 	},
 };
 
-const char *gxbb_vid_pll_parent_names[] = { "vid_pll_div", "hdmi_pll" };
+static const char * const gxbb_vid_pll_parent_names[] = { "vid_pll_div", "hdmi_pll" };
 
 static struct clk_regmap gxbb_vid_pll_sel = {
 	.data = &(struct clk_regmap_mux_data){
@@ -1617,7 +1617,7 @@ static struct clk_regmap gxbb_vid_pll = {
 	},
 };
 
-const char *gxbb_vclk_parent_names[] = {
+static const char * const gxbb_vclk_parent_names[] = {
 	"vid_pll", "fclk_div4", "fclk_div3", "fclk_div5", "vid_pll",
 	"fclk_div7", "mpll1",
 };
@@ -1977,7 +1977,7 @@ static struct clk_fixed_factor gxbb_vclk2_div12 = {
 };
 
 static u32 mux_table_cts_sel[] = { 0, 1, 2, 3, 4, 8, 9, 10, 11, 12 };
-const char *gxbb_cts_parent_names[] = {
+static const char * const gxbb_cts_parent_names[] = {
 	"vclk_div1", "vclk_div2", "vclk_div4", "vclk_div6",
 	"vclk_div12", "vclk2_div1", "vclk2_div2", "vclk2_div4",
 	"vclk2_div6", "vclk2_div12"
@@ -2033,7 +2033,7 @@ static struct clk_regmap gxbb_cts_vdac_sel = {
 
 /* TOFIX: add support for cts_tcon */
 static u32 mux_table_hdmi_tx_sel[] = { 0, 1, 2, 3, 4, 8, 9, 10, 11, 12 };
-const char *gxbb_cts_hdmi_tx_parent_names[] = {
+static const char * const gxbb_cts_hdmi_tx_parent_names[] = {
 	"vclk_div1", "vclk_div2", "vclk_div4", "vclk_div6",
 	"vclk_div12", "vclk2_div1", "vclk2_div2", "vclk2_div4",
 	"vclk2_div6", "vclk2_div12"
diff --git a/drivers/clk/meson/vid-pll-div.c b/drivers/clk/meson/vid-pll-div.c
index b3370ea7beac..88af0e282ea0 100644
--- a/drivers/clk/meson/vid-pll-div.c
+++ b/drivers/clk/meson/vid-pll-div.c
@@ -55,8 +55,8 @@ static const struct vid_pll_div vid_pll_div_table[] = {
 #define to_meson_vid_pll_div(_hw) \
 	container_of(_hw, struct meson_vid_pll_div, hw)
 
-const struct vid_pll_div *_get_table_val(unsigned int shift_val,
-					 unsigned int shift_sel)
+static const struct vid_pll_div *_get_table_val(unsigned int shift_val,
+						unsigned int shift_sel)
 {
 	int i;
 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
