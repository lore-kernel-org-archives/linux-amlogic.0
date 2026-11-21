Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC55C606A320
	for <linux-amlogic@archiver.kernel.org>; Sat, 21 Nov 2026 18:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ERhCp2hV;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=aliel.fr header.i=@aliel.fr header.a=rsa-sha256 header.s=courrier-s1 header.b=g2ei063E
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2wVs3BlXPeYrNcKgcgKMenHrH/QrKBYKouO51Ivba0U=; b=ERhCp2hVSRFV9YHTjC07zD8CUv
	LpdjnrsJfLICtj3ii/z+I7H+W9QiFte/ATfXtFmyqKle3SpoJoLOr9grVJS2Zxk3cYkQxkKq77Vh5
	bkSGmw5a/sY+PuL2VGxQtYWNXPWXNdT6QB3FFshpicp5pK0POWPT75tdzHaXabqwB6A9DqvJc8dIP
	lHWQnmRyKpqUnEjNq4noBcx3PSyBbxxv/cAo+NQbTOHCE2K/pC+g0TFSUemsqMQRucdFHcwNUVgCO
	c4yTfwiCwATGvzwdBN1jOcN/mg4T+ZiKtqD+QZqnYs2NSbBjLrhCPZ2Zv6ZlhmM8Y2IcRsLyHfjo/
	hmYGStPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUqIE-0000000049s-0rNH;
	Sat, 21 Nov 2026 18:58:34 +0000
Received: from courrier.aliel.fr ([65.21.61.41])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUqIB-0000000049K-1EgL;
	Sat, 21 Nov 2026 18:58:33 +0000
Message-ID: <e92bbf55-08f2-4cc0-ad08-cbbcde9f93ac@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1795287497;
	bh=fJNClJvE09AeKF+kIGp46dIINijEJgt3u/BcL85nr4g=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=g2ei063Ermv4QMnmqaxKqlXwFWh1s/DyCoZOALwFIUNumGUw9wEey3LbLDBjZnrEa
	 e87I+pwMEwkN1gXZTogR/+UMKirzaK3a54ggbNq2WMfYPhqvMaJ9Gh1UekMXtaaF9k
	 838bMrmXKJGwx2pjG4I6atDtPsMzWwRx3rerShHA=
Date: Sat, 21 Nov 2026 19:57:45 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH v2 06/11] pmdomain: amlogic: meson-ee-pwrc: power up
 memories for boot-enabled domains
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-phy@lists.infradead.org, dri-devel@lists.freedesktop.org,
 robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
 vkoul@kernel.org, olteanv@gmail.com
References: <20261120-meson-drm-create-hdmitx-phy-v2-0-93d622d9bb07@aliel.fr>
 <20261120-meson-drm-create-hdmitx-phy-v2-6-93d622d9bb07@aliel.fr>
 <sashiko-outbox-225878@kernel.org>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-225878@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_105831_822558_1C5B808D 
X-CRM114-Status: GOOD (  13.53  )
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

On 11/20/26 19:58, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] pmdomain: amlogic: duplicated memory power-up loop in
>   meson_ee_pwrc_on()
> --
> 
> commit a69a64ee3e13ba7f9072dbadb0f25ec3e146c336
> Author: Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> pmdomain: amlogic: meson-ee-pwrc: power up memories for boot-enabled domains
> 
> This commit introduces a helper to clear the HHI memory power-down bits
> for power domains that are found already enabled at probe time.
> 
>> diff --git a/drivers/pmdomain/amlogic/meson-ee-pwrc.c b/drivers/pmdomain/amlogic/meson-ee-pwrc.c
>> index 338f70d77bf03..404af46192562 100644
>> --- a/drivers/pmdomain/amlogic/meson-ee-pwrc.c
>> +++ b/drivers/pmdomain/amlogic/meson-ee-pwrc.c
>> @@ -428,6 +428,16 @@ static int meson_ee_pwrc_on(struct generic_pm_domain *domain)
>>  				       pwrc_domain->clks);
>>  }
>>  
>> +static void meson_ee_pwrc_mem_power_up(struct meson_ee_pwrc_domain *dom)
>> +{
>> +	int i;
>> +
>> +	for (i = 0; i < dom->desc.mem_pd_count; i++)
>> +		regmap_update_bits(dom->pwrc->regmap_hhi,
>> +				   dom->desc.mem_pd[i].reg,
>> +				   dom->desc.mem_pd[i].mask, 0);
>> +}
> 
> [Severity: Low]
> This isn't a bug, but meson_ee_pwrc_on() right above has the same loop:
> 
> drivers/pmdomain/amlogic/meson-ee-pwrc.c:meson_ee_pwrc_on() {
>     ...
> 	for (i = 0 ; i < pwrc_domain->desc.mem_pd_count ; ++i)
> 		regmap_update_bits(pwrc_domain->pwrc->regmap_hhi,
> 				   pwrc_domain->desc.mem_pd[i].reg,
> 				   pwrc_domain->desc.mem_pd[i].mask, 0);
>     ...
> }
> 
> Could meson_ee_pwrc_mem_power_up() be defined above meson_ee_pwrc_on()
> and reused there as well?
> 

Good reminder, will do it in v3.

-- 
Best regards,
Ronald

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
