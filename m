Return-Path: <SRS0=vGGV=G4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 583BEC433E0
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Jan 2021 17:51:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59B7822D04
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Jan 2021 17:51:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59B7822D04
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TFwsW9pqVYFt9Wjo7V1Z4m4ffBJFcbylZAbQADPWwYc=; b=hnqZ45qX10UyDALAUKo1CBiA9
	aI3mTd3/WeR8sd0w7b7ESZw0Jq+oCcwaak8w2lB5SfwteZqnkhZkqzl9drF+nmUNIn9mhmF9bFKkK
	mDYlN699VWIkbxRW8HVyCTij8+x9xr8//SZPrs0+81kONXYCekUYEIKP1/xhKdLXs2OZfsbTKRaXo
	J2iEJtxdFn5gu5jQvrm2uAI6I/bMOCUcGRbbL5smn4NqRxKcfD7yi502j8Bd8HrBt6w5HWXp4FukQ
	RemfcJ5KYrxDKzQFnVEkPjfygXf3r2DLIlDf/Va1gN7bRZr5SWvGc8LMb6Sx8FtKr7IIFvDALhquw
	53hr34UlA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l461h-0002Fx-N3; Mon, 25 Jan 2021 17:51:45 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l461b-0002Ez-Tb
 for linux-amlogic@lists.infradead.org; Mon, 25 Jan 2021 17:51:41 +0000
Received: by mail-wr1-x433.google.com with SMTP id a1so13871552wrq.6
 for <linux-amlogic@lists.infradead.org>; Mon, 25 Jan 2021 09:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=0snvcNaYNGpV/k+7WdqZD7n4s15hYF8lRKnrHcT9zcs=;
 b=BtcA8Bf0tWpg53PhU7aSoui0E3BpWfWCGjqofDJ+lP3yBnl5dwdung0WUSxXzvTvA6
 WTu0tUvkwAXT3Cq0iMGsPbfl59hMfy9/EW2erNyZaTvlylVVwGwXwBqddWaBT3BIrZSZ
 szt2OKUvwyMX7g2nAaDniEzmcScpvK2uXK2FUX/B8kO35o/a5Bx7cLy+XFV68farduPZ
 RXmB0aaZMFxEo1a+abC3GeeawXzwnaq7G2FLyEvxRjdRPrR8idbR1k+RyOJQe84ZOVJH
 Eu6mnLruo8fA0Wi+cgYcDCt2WXKASkVR4Nkm0uuXK0BOtazXaqSUOfOkCWKMVpzE2dNl
 +dLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=0snvcNaYNGpV/k+7WdqZD7n4s15hYF8lRKnrHcT9zcs=;
 b=Lj5p2086iLfb++spY9okyrKaozG2yUE5YuU+Izmy0R0M9ahV1zLdU83rxXlBX67UB2
 zq0oxpjUjzMWFH+RywubkdDh24Pf35WflxHG7zbpbvRIaEeF4Iu0QdnL/cG00muIs0TY
 z2l38exjQhfpj827J9Lm8cC17AKaoli8O6kZcqKldEON/efkLcIWZpVspIYKEmOggGqi
 Adu4qzQEq2wY8WaWGnGUepkZu6Qv9b6P/W3Ze0Pidv8ScAkuETGucurazUgYQ0CQWcA6
 z0b5zVmM9rQU5K8I3BLChgCx/ZHRQFRa9fw5BAXf8ji21YD1hCoyhCNnLrrtN8cPYHEB
 UaeA==
X-Gm-Message-State: AOAM532j8sp80pL/RVjlEIhiYcmxhJKJ2jBahfydXmOIF/2XzKFJ95an
 0xuYEyjvqskyGlOYv3RXj8w1ZQ==
X-Google-Smtp-Source: ABdhPJzfEafFozbxGGxAYvRjvaBNZaQlhERyvwak6AebaeXwdOrGAa45QDqKfniSaEX6MY+MkoOeMg==
X-Received: by 2002:a5d:6a01:: with SMTP id m1mr2243274wru.318.1611597096632; 
 Mon, 25 Jan 2021 09:51:36 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id r124sm62707wmr.16.2021.01.25.09.51.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 09:51:35 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-remoteproc@vger.kernel.org, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v2 0/5] Amlogic Meson Always-On ARC remote-processor
 support
In-Reply-To: <20210102205904.2691120-1-martin.blumenstingl@googlemail.com>
References: <20210102205904.2691120-1-martin.blumenstingl@googlemail.com>
Date: Mon, 25 Jan 2021 09:51:33 -0800
Message-ID: <7hmtwwx5ui.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210125_125140_004618_3BF698EF 
X-CRM114-Status: GOOD (  23.14  )
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
Cc: ohad@wizery.com, devicetree@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> Amlogic Meson6/8/8b/8m2 come with an ARC core in the Always-On (AO)
> power-domain. This is typically used for waking up the ARM CPU after
> powering it down for system suspend.
>
> The exact ARC core used on Meson6 and earlier is not known. I believe
> it is an ARC625, but I am not sure about this. Meson8/8b/8m2 uses an
> ARC EM4 core.
> They all have in common that they use a section of the SoCs SRAM for
> running code on the ARC core.
>
> Unfortunately there's no information about the remote-processor control
> registers in the public Meson8b (S805) datasheet. All information is
> either taken from Amlogic's 3.10 kernel and 2011-03 u-boot or found by
> testing (for example the clock input is not mentioned anywhere in the
> reference code, but disabling it stops the AO ARC core from working).
>
> This series consists of five patches:
>  1: dt-bindings for the SRAM section
>  2: dt-bindings for the SECBUS2 syscon region which contains a few
>     bits for controlling this remote processor
>  3: dt-bindings for the AO ARC remote processor
>  4: the driver for booting code on the AO ARC remote processor
>  5: (only included for documentation purposes) dts changes (these will
>     be re-sent separately)
>
> Patches #3 and #4 should go through the remoteproc tree. Patches #1
> and #2 may go through Rob's (devicetree) tree, Kevin's linux-amlogic
> tree or through the remoteproc tree. Personally I have no preference
> here.
>
> To test this series I ported the Amlogic serial driver and added the
> board files for the Amlogic AO ARC EM4 to the Zephyr RTOS. The code can
> be found here: [0] (the resulting zephyr.elf can then be loaded as
> remote-processor firmware from Linux).
>
>
> Changes since v1 at [1]:
> - fixed yamllint warnings (after installing the package these now also
>   show up on my build machine) in patches #2 and #3. Thanks for the
>   hint Rob
> - dropped the explicit "select" statement from the dt-bindings in patch
>   #2 as suggested by Rob (thanks)
>
>
> [0] https://github.com/xdarklight/zephyr-rtos/commits/amlogic_ao_em4-20201229
> [1] https://patchwork.kernel.org/project/linux-amlogic/list/?series=407349
>
>
> Martin Blumenstingl (5):
>   dt-bindings: sram: Add compatible strings for the Meson AO ARC SRAM
>   dt-bindings: Amlogic: add the documentation for the SECBUS2 registers
>   dt-bindings: remoteproc: Add the documentation for Meson AO ARC rproc
>   remoteproc: meson-mx-ao-arc: Add a driver for the AO ARC remote
>     procesor
>   ARM: dts: meson: add the AO ARC remote processor

Patches 1-2, 5 queued for v5.12 via the amlogic tree.

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
