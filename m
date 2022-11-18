Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B9F6C433FE
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Nov 2022 16:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cssQvVbmIobri7Kl8umtjrLgPpUmnypVHU3XCmm9F0U=; b=krm9wNC41w7B8S
	aY3LuuzgRI0uvp/eETWjcXp4RpXoYnFVR1W3PROHiirkAWROBWVs5DDop5SXrKj/NIy9cebO+AsuS
	hpKzqUSqkzeGJgU9n7m16fIa5EeHbmySU4PgHvDvWEtFrT0//WWx/FpZh18SvxIgbhYJXT/S+2iSt
	rfIiGsRPXh5kynJQSKQchOqonYPew0gW0IL47f+bcHhTl2j8szSJVnFYcs90dP/QsByduyqYZpy+o
	SCiyZrDq34W3B8NHYdxtxgVibs95uQ7MXm8TA8x2VWijvqi2c+/vv+6/60GdFm1toU2rn1xH363TY
	/DsVF+1euhyD1aQlm0lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow4RM-005QWj-P1; Fri, 18 Nov 2022 16:42:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow4RL-005QVn-0y; Fri, 18 Nov 2022 16:42:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 91B5962647;
	Fri, 18 Nov 2022 16:42:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5DA7C433C1;
	Fri, 18 Nov 2022 16:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668789726;
	bh=Mrc50lPM60BwQ65uEo8Q4lFKJKU3glA1OU9cGpr63hg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u9EjFCIHJuV9Q11pMGbSaVSlRSE0nwi0EHnlojSS/c2Hd4qzcy7reu4OkgjnD5hmD
	 Q0+Rwu1RK5QgUVNzlvPoGwlWHaTIgOnU3RvTHSWjFiGmQCwpxIPtjazTgpwBRCeO3O
	 9aMBgFaCWOLAksdoo9DjgVBnci2DOpnyjZIXvzdvpX4m01IO1utmreHGwENMk+kuls
	 1cIrGxVCV3Vd4pDGzsrEnvfyvc2sqw2SsIKJbY1UPD7y4s4fJMoTfGYcHg10Xxp6ZF
	 yCI9CK6B3AUx96qDo3MuJ9xMjgPPQueo+iJW4t+NN8jZgvffo0ow1Fqj+TeoOKD/kc
	 S/343k0kGVdsw==
Date: Fri, 18 Nov 2022 16:41:59 +0000
From: Will Deacon <will@kernel.org>
To: Jiucheng Xu <jiucheng.xu@amlogic.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jianxin Pan <jianxin.pan@amlogic.com>,
	Kelvin Zhang <kelvin.zhang@amlogic.com>,
	Chris Healy <healych@amzon.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v11 1/3] perf/amlogic: Add support for Amlogic meson G12
 SoC DDR PMU driver
Message-ID: <20221118164157.GA4802@willie-the-truck>
References: <20221117083419.2084264-1-jiucheng.xu@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221117083419.2084264-1-jiucheng.xu@amlogic.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_084207_129631_FFEFF3ED 
X-CRM114-Status: GOOD (  13.47  )
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

On Thu, Nov 17, 2022 at 04:34:15PM +0800, Jiucheng Xu wrote:
> Add support for Amlogic Meson G12 Series SOC - DDR bandwidth PMU driver
> framework and interfaces. The PMU can not only monitor the total DDR
> bandwidth, but also individual IP module bandwidth.
> 
> Signed-off-by: Jiucheng Xu <jiucheng.xu@amlogic.com>
> Tested-by: Chris Healy <healych@amzon.com>

amzon.com?

> +static umode_t meson_ddr_perf_format_attr_visible(struct kobject *kobj,
> +						  struct attribute *attr,
> +						  int n)
> +{
> +	struct pmu *pmu = dev_get_drvdata(kobj_to_dev(kobj));
> +	struct ddr_pmu *ddr_pmu = to_ddr_pmu(pmu);
> +	const u64 *capability = ddr_pmu->info.hw_info->capability;
> +	struct device_attribute *dev_attr;
> +	int id;
> +	char value[20]; // config1:xxx, 20 is enough
> +
> +	dev_attr = container_of(attr, struct device_attribute, attr);
> +	dev_attr->show(NULL, NULL, value);
> +
> +	if (sscanf(value, "config1:%d", &id) == 1)
> +		return capability[0] & (1 << id) ? attr->mode : 0;
> +
> +	if (sscanf(value, "config2:%d", &id) == 1)
> +		return capability[1] & (1 << id) ? attr->mode : 0;

Should these be '(1ULL << id)' to avoid shifting beyond the side of the
32-bit type?

Will

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
