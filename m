Return-Path: <SRS0=v0PX=OO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEFE4C04EB8
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Dec 2018 01:08:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F6E020834
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Dec 2018 01:08:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="b3yagYQP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="m6zEc6xD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F6E020834
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P0rMnpFbXWkse0a08//crd2RBCxF1AtPmTo35Mj++0Y=; b=b3yagYQPguH463
	oQ4zb3920EV/wCDwT/mYcy8JTuc6rmKzq6OtzUKJ/QSsmJ2UHOb5UYv1T2GPpbEM0FM53vjCQOLjw
	UmcTXz25quiBnlh2yrjClRPVX2nUef/JmADji3QZPb9GeKZh8fjyqqliCrGJ0MetpZP2woR63e/33
	YVOIE2Q8A/c7g0Ts2tbtofI3ys2PHnJkwQlDz5ts8ec7CXGfhAe9ZoYbn0Qwcf4FVNsD0BiKHn/FF
	WkTyLrjfAdjmJ63NKlv8b0XrFJoKct7Q9p3abllLvjgV5/pi1wKLCwnuAtFsdt34bgbYKLLoClr0E
	ecjuEC/hPU+A/gfXj3uw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gULfd-0008RT-N7; Wed, 05 Dec 2018 01:08:09 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gULfb-0008QN-3N
 for linux-amlogic@lists.infradead.org; Wed, 05 Dec 2018 01:08:08 +0000
Received: by mail-pg1-x541.google.com with SMTP id z11so8204491pgu.0
 for <linux-amlogic@lists.infradead.org>; Tue, 04 Dec 2018 17:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=Cy5kmxnxBc9jiMESB2Fi/ZbfKvsekEyB466CDdINpzs=;
 b=m6zEc6xDAb+9i/kiw6NABISTpveKYVdflw52GKStlQ9KwRboXk7/H0VzFIEqY898No
 RSk9bxBK2iyXu2Re4VVaztSSHHWxoR8Yap7Z/PXRBU179Xl8R3PBjcpNEvWitw8V9aFo
 fQWD+nm2+54Dx7UOl3Cw3ZinnaI+74J9GZXkHh+vM2xmCsAGTjUPcLy0xANd6P6AxWOZ
 CuwvVakMXOZyh5YJvUrjK9IffzBke2W8m9i07gjjORa30eUxjFJ8KKup97sf/ZxMcT3U
 yamyF/TTK/YuVXBVZv9Bj0+TCo+Ul6cnoPkYWpNnQ9/kF4w3obWqXlnzG4c/gPvPkLlW
 zL8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=Cy5kmxnxBc9jiMESB2Fi/ZbfKvsekEyB466CDdINpzs=;
 b=ceYTZhhM2rEPt/+bbuNuQdL7ABfB8snXo0qXwigBLJESSlfotvRO5tgew28GS3bmAX
 M5aGmjQ7xWfQyu3n3YOy7b/LElmxk4fC3UWLfFE/a5Bvk0tz7+CXCBc2qfZjbQAVxNRJ
 H4Cy46NMjLRzVaRRwoBjLEoq23zRmq7IV7+DOX03ecXq/ZUySvN4IX4Lmz0iUcRrHIhK
 OnGcD/u0q8c3p9N9S//o2MKqjzP6bK7gJgIg0n+g+p7ctE12M5c7nfUOsTQkskB/Z2Jo
 dRaa26TEyXFxZjRgMq1sdo/MjaYYLD96ucrSuij98zxZs5pGyepUUYke8Z7D5spV1qw3
 nKFg==
X-Gm-Message-State: AA+aEWaU4e7YE0ClM70MRDx+VI5b1WWTofaJ/EOGaIP2a3Ixys698TTj
 cc6fhyeD4QtEqOTWSdbuF4lyuw==
X-Google-Smtp-Source: AFSGD/UAEjE+Bisxh3FLwoRVHZiako0AtYLHWSb69uWpTvsPNf0zZmnKA0i6aTuY9t8Hd4D2kN71lA==
X-Received: by 2002:a63:1444:: with SMTP id 4mr18846301pgu.430.1543972076240; 
 Tue, 04 Dec 2018 17:07:56 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.googlemail.com with ESMTPSA id z8sm17915419pgg.62.2018.12.04.17.07.55
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 04 Dec 2018 17:07:55 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Carlo Caione <carlo@caione.org>
Subject: Re: [PATCH v3 0/3] dts: meson: add clock controllers input clocks
In-Reply-To: <20181203171640.12110-1-jbrunet@baylibre.com>
References: <20181203171640.12110-1-jbrunet@baylibre.com>
Date: Tue, 04 Dec 2018 17:07:54 -0800
Message-ID: <7hmupkbx1x.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181204_170807_145892_0EC9DBFB 
X-CRM114-Status: UNSURE (   8.05  )
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
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> This patchset is the first step that needs to be done so the
> amlogic clock controllers properly claim their input clocks
> through DT instead of relying on fixed names.
>
> I'll be waiting for this hit mainline before sending the related
> driver changes.

Queued for v4.21 (branch: v4.21/dt64) with Stephen's tags.

nit: $SUBJECT on this cover letter is missing arm64 prefix (v2 had it)
and, some lazy maintainenrs like me are starting to rely on the new new
patchwork-bot which will auto-superseed series when a new version is
posted, but that relies on matching subjects.

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
