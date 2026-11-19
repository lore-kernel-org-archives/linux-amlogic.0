Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4411606A332
	for <linux-amlogic@archiver.kernel.org>; Thu, 19 Nov 2026 16:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FAgiyYSq;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=aliel.fr header.i=@aliel.fr header.a=rsa-sha256 header.s=courrier-s1 header.b=vAWBsD/e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=W6ntY8210GojVGTL+ZA+m1/Ulo4ulfl8xApT393jDgs=; b=FAgiyYSqoUMvOBmZZIGGXJwWWq
	HfGJRLvATFbraf1q5FwoogutT7UOJoUnmF89nR+x+OkcYetoSL0MUfyd5CJMuDVdJ4T3QH7jam/YA
	X2dFi4Ay54PS/HJrCJnb5fstXxVVQFj6JOIAqzmGvc3Ot7uvbsaYi07okJZJZk+uPG6fF4fhcz900
	W7YsFKExTrjKSx8iKh1EJA7YmNMlAOjzBSXoQ/TdkLoJx0+LnzrKcpxNEKpYjHoA3hXODtoILrh98
	mUfgd1GAnIFtSr3Iji2t+J8BYkVtZLt5NZT3BpBesoP8qLXUPJ/y1Vr+AfepE7xpgiP/Mzw9/AFHW
	N/Us94zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU51K-0000000CdwJ-2i78;
	Thu, 19 Nov 2026 16:29:58 +0000
Received: from courrier.aliel.fr ([2a01:4f9:c011:1c83::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU51I-0000000Cdtt-0Flf;
	Thu, 19 Nov 2026 16:29:57 +0000
Message-ID: <8652ae36-7506-4fc2-b8ff-0b05a61dec63@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1795105792;
	bh=McqmrGGoBsWtFO9rSLDSWUOXL2yC9fScta0oWrJ5HFE=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=vAWBsD/ePEqL301DdsswEq/IJ55Q9aS6ABXHAzDCh/3C+pvw0XpvcS29dDjLwcplb
	 hd+k7v1hm1gr9jRkQZ++5bJzAtYbEpgtsEhf/4A2PhL0xMr3fnz9iT7fogwUm0eIvh
	 cD2c1SFpljoYu0Acms8xnIjDxltOhLszWv3MK2j8=
Date: Thu, 19 Nov 2026 17:29:51 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH 04/10] phy: amlogic: Add Meson HDMI TX PHY driver
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-phy@lists.infradead.org, dri-devel@lists.freedesktop.org,
 robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
 vkoul@kernel.org, olteanv@gmail.com
References: <20261117-meson-drm-create-hdmitx-phy-v1-0-9e0ac931381c@aliel.fr>
 <20261117-meson-drm-create-hdmitx-phy-v1-4-9e0ac931381c@aliel.fr>
 <sashiko-outbox-219538@kernel.org>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-219538@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_082956_617594_2809A2B7 
X-CRM114-Status: GOOD (  17.77  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/17/26 20:58, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] phy: amlogic: broken rate and submode check in
>   meson_hdmi_phy_validate()
> --
> 
> commit 0bf49ea77c864cdcf7af96e59e1ffba5194d9636
> Author: Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> phy: amlogic: Add Meson HDMI TX PHY driver
> 
> This commit adds a generic PHY driver for the HDMI TX PHY on Amlogic GXBB,
> GXL, GXM, and G12A SoCs, along with a legacy helper for device trees
> lacking a "phys" property.
> 
>> diff --git a/drivers/phy/amlogic/phy-meson-hdmi-tx.c b/drivers/phy/amlogic/phy-meson-hdmi-tx.c
>> new file mode 100644
>> index 0000000000000..69833a080dc35
>> --- /dev/null
>> +++ b/drivers/phy/amlogic/phy-meson-hdmi-tx.c
> [ ... ]
>> +/* GXBB */
>> +static const struct meson_hdmi_phy_rate gxbb_rates[] = {
>> +	/* 5.94Gbps, 3.7125Gbps */
>> +	{ 371250000, 0x33353245, 0x2100115b },
>> +	/* 2.97Gbps */
>> +	{ 297000000, 0x33634283, 0xb000115b },
>> +	/* 1.485Gbps, and below */
>> +	{ 0,         0x33632122, 0x2000115b },
>> +};
> [ ... ]
>> +static const struct meson_hdmi_phy_rate *
>> +meson_hdmi_phy_find_rate(const struct meson_hdmi_phy_data *data, u64 rate)
>> +{
>> +	unsigned int i;
>> +
>> +	for (i = 0; i < data->num_rates; i++)
>> +		if (rate >= data->rates[i].min_rate)
>> +			return &data->rates[i];
>> +
>> +	return NULL;
>> +}
> [ ... ]
>> +static int meson_hdmi_phy_validate(struct phy *phy, enum phy_mode mode,
>> +				   int submode, union phy_configure_opts *opts)
>> +{
>> +	struct meson_hdmi_phy *priv = phy_get_drvdata(phy);
>> +
>> +	if (mode != PHY_MODE_HDMI)
>> +		return -EINVAL;
>> +
>> +	if (opts->hdmi.bpc != 8)
>> +		return -EINVAL;
>> +
>> +	if (!meson_hdmi_phy_find_rate(priv->data, opts->hdmi.tmds_char_rate))
>> +		return -EINVAL;
>> +
>> +	return 0;
>> +}
> 
> [Severity: Medium]
> Can meson_hdmi_phy_find_rate() ever return NULL here?
> 
> Every per-SoC rate table ends with an entry where min_rate is 0, and rate
> is an unsigned u64, so rate >= data->rates[i].min_rate is always true on
> the final entry.  That makes the NULL return and the callers' NULL checks
> in meson_hdmi_phy_validate() and meson_hdmi_phy_configure() dead code, and
> meson_hdmi_phy_validate() accepts any tmds_char_rate value (including 0 Hz
> or rates above the 594 MHz hardware limit).
> 
> In addition, meson_hdmi_phy_validate() does not check that submode is
> PHY_HDMI_MODE_TMDS before reading opts->hdmi.tmds_char_rate, which shares
> an anonymous union with opts->hdmi.frl when submode is PHY_HDMI_MODE_FRL.
> 

I will add min_rate 25175000 in table end and a check on max_rate 600MHz
in v2.

-- 
Best regards,
Ronald

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
