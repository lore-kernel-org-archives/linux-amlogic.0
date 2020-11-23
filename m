Return-Path: <SRS0=nSpp=E5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1955C388F9
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Nov 2020 14:15:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 686A920757
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Nov 2020 14:15:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hcUxWpIM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="fxeh1kpp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 686A920757
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zmV3LjRTxdPA2jGZ64jQx48kivGa7wl0ab/bbJLAgjY=; b=hcUxWpIM4Yja1X/ZqrBm5aKif
	mj/S8a6eaU5Z2G8BZ3GykTi9FwGjuYMzw23AVUQXvvKuimMGyw5HOuyQH3XGOEhfimpMoMnd9lp66
	sWEXTDPk1N7QCCpoH0p2yY7DEyrv8axirsIowUIs7q4NjWHZveLb0JVUAVPNmTX7NmAYH4Fd1OGc+
	38wvojDm1HhHM99Qnpr/ehbwZ4ZbIxFVuslYFzxPlijJ3dbroUoRQAg54Y3JqZILo9YszrZ+AjcVD
	qwEG6xurt1CM4IQwLH292FJ7H9cKrOkOga2wV8ZTzq5FjgvWQwp36R62Z2x6xTmuWybfaMQIR4qI1
	hid1KR51Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khCdE-0004My-2q; Mon, 23 Nov 2020 14:15:52 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khCdA-0004ML-Qz; Mon, 23 Nov 2020 14:15:50 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9B42120781;
 Mon, 23 Nov 2020 14:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606140947;
 bh=8rpJx5QRw4RH0PddIzzUPjibWCFpM1TlEugxUnbUh3w=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fxeh1kppeBrBLSEKbdR/gqH+4lKVGDv9ByAYQwPqryRdXqiSV6BHomjTzrQpxxn7F
 0X2v5od5ENGszhqM5pBaAc+lqDMo/IhzvuZsa59VoTL0NVoaercBVLEUcU/T/7OW7o
 N3p4LRTmbI10qkzi0bKBHpF2wmj25VwpNbRWStqE=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94)
 (envelope-from <maz@kernel.org>)
 id 1khCd7-00CyGd-69; Mon, 23 Nov 2020 14:15:45 +0000
MIME-Version: 1.0
Date: Mon, 23 Nov 2020 14:15:45 +0000
From: Marc Zyngier <maz@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 1/2] drm/meson: dw-hdmi: Disable clocks on driver teardown
In-Reply-To: <1jwnyc41c6.fsf@starbuckisacylon.baylibre.com>
References: <20201120094205.525228-1-maz@kernel.org>
 <20201120094205.525228-2-maz@kernel.org>
 <1jwnyc41c6.fsf@starbuckisacylon.baylibre.com>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <763f505eececa3b02bd794aec5e36d22@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: jbrunet@baylibre.com, narmstrong@baylibre.com,
 khilman@baylibre.com, martin.blumenstingl@googlemail.com,
 guillaume.tucker@collabora.com, kernel-team@android.com,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201123_091549_154657_BE1DBB68 
X-CRM114-Status: GOOD (  22.57  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Guillaume Tucker <guillaume.tucker@collabora.com>,
 linux-amlogic@lists.infradead.org, kernel-team@android.com,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 2020-11-23 14:03, Jerome Brunet wrote:
> On Fri 20 Nov 2020 at 10:42, Marc Zyngier <maz@kernel.org> wrote:
> 
>> The HDMI driver request clocks early, but never disable them, leaving
>> the clocks on even when the driver is removed.
>> 
>> Fix it by slightly refactoring the clock code, and register a devm
>> action that will eventually disable/unprepare the enabled clocks.
>> 
>> Signed-off-by: Marc Zyngier <maz@kernel.org>
>> ---
>>  drivers/gpu/drm/meson/meson_dw_hdmi.c | 43 
>> ++++++++++++++++++---------
>>  1 file changed, 29 insertions(+), 14 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c 
>> b/drivers/gpu/drm/meson/meson_dw_hdmi.c
>> index 7f8eea494147..29623b309cb1 100644
>> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
>> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
>> @@ -145,8 +145,6 @@ struct meson_dw_hdmi {
>>  	struct reset_control *hdmitx_apb;
>>  	struct reset_control *hdmitx_ctrl;
>>  	struct reset_control *hdmitx_phy;
>> -	struct clk *hdmi_pclk;
>> -	struct clk *venci_clk;
>>  	struct regulator *hdmi_supply;
>>  	u32 irq_stat;
>>  	struct dw_hdmi *hdmi;
>> @@ -946,6 +944,29 @@ static void meson_disable_regulator(void *data)
>>  	regulator_disable(data);
>>  }
>> 
>> +static void meson_disable_clk(void *data)
>> +{
>> +	clk_disable_unprepare(data);
>> +}
>> +
>> +static int meson_enable_clk(struct device *dev, char *name)
>> +{
>> +	struct clk *clk;
>> +	int ret;
>> +
>> +	clk = devm_clk_get(dev, name);
>> +	if (IS_ERR(clk)) {
>> +		dev_err(dev, "Unable to get %s pclk\n", name);
>> +		return PTR_ERR(clk);
>> +	}
>> +
>> +	ret = clk_prepare_enable(clk);
>> +	if (!ret)
>> +		ret = devm_add_action_or_reset(dev, meson_disable_clk,
>> clk);
> 
> Thanks for fixing this Marc.
> 
> FYI, while it is fine to declare a function to disable the clocks, a 
> quick
> cast may avoid it
> 
> devm_add_action_or_reset(dev, (void(*)(void *))clk_disable_unprepare, 
> clk);

While this works for now, a change to the clk_disable_unprepare()
prototype (such as adding a second argument) would now go completely
unnoticed (after all, you've cast the function, it *must* be correct,
right?), and someone would spend a few hours trying to track down memory
corruption or some other interesting results.

Yes, casting C functions can be hilarious.

I can see a few uses of this hack in the tree, and I have my pop-corn
ready.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
