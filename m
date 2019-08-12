Return-Path: <SRS0=Dn2N=WI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E3C5C433FF
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Aug 2019 12:35:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E2CC214C6
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Aug 2019 12:35:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ogdEx+cb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ltoZPdDD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E2CC214C6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=frj4ugZYUnUCOwcGtITXY0AWyECv4+jXYY/aR5shzjw=; b=ogdEx+cb4C4DdV
	mW/3/zad2kMXG0QTXLwP2Sxooqk/CWq0tVGP0goIYX7BEB5eXL9JyBbCbggGxrSeQiunbQ4TH6HeZ
	2cV80qP/5c8zMRRxDosg2A08L9MYTBYi6jNKFWkU9eVVNuWsAE17jS/7vHF/O4FleeWEtfuQNu5Tc
	lKrj7tlUcx3fL8aqCrYOtyExN8AFkhC4157luI3qaqTbdOzt+cg6SzkdDi91BnPyVSdpQjh8so5L1
	C46DSW5riuU37cLJGISbplxqQPE8Gmh2RJazt2n5rQoEKwDaVJO5I9coWCEx22Vh77gwZVDhuDTQV
	I1vLfOXCDMpiOngelQQA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hx9YA-00052A-KV; Mon, 12 Aug 2019 12:35:46 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hx9Y6-00050h-DT
 for linux-amlogic@lists.infradead.org; Mon, 12 Aug 2019 12:35:44 +0000
Received: by mail-wr1-x442.google.com with SMTP id r3so10676941wrt.3
 for <linux-amlogic@lists.infradead.org>; Mon, 12 Aug 2019 05:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=bI/XNvST8XNcDi45EkijYU3OEXqnGirukbOk+hlTQLA=;
 b=ltoZPdDDIHtFi84wMSTH18qO2lGDQMLD8q+GOlpjwYklx43w44pX9RLkk/UEZFpp5n
 bC3GzphMPhB6+tvx7gw90L/wzbAvYXiJYpTKgP7bknRq8nKamLiU29/teVYUoULSOnXe
 xB07Udy9o+Ewk9kywDosNx9NasLrbCnySassqAWfxNE6NFMRO4BQiv20TcDX5FBVg+PZ
 brYqdp7nHkUCz/6c1yVQyh0SMQ0UtN2WJEO78ZnxD+4ybl6lF7VHgxG0G4mdmmjyC/GP
 7Ry/2trw/UXrHkHdoGEa+h6YHou2Lmn7FgyUbmvc62VUHNe4NltIs8wpjufZpOKRvo8v
 zbvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=bI/XNvST8XNcDi45EkijYU3OEXqnGirukbOk+hlTQLA=;
 b=abn6m+f/jNKRfwfPXPD8S+VB3J4pt9wy9V2tBGkuuDuLWuF3Oc/ET8fT30Hg8iLKEa
 hBwVPuMReNMTmisEKWpCHsxzzJZyhP9th+TjC2+4kdZ0OBjQyVf8n9KMpo+ltFoztzW0
 v9Ya6oDOz5FR0llY3wil4NTGuAfYE7eTcP7cXUGfFgw53Kdio9hEAF0Sk15o2Nyihllk
 5YtFEswSfhzw8DN/NgHsLa2rO75HvWQu4qbhhqum3KoIVaxzW3eycjNsL6U+Z6QGMDpE
 kmop2PKC6rGv91VVnBbCqgVBfdmIIF1G370ZyAeiW0/G/yM74wneNJB7HhWdTPL3+ZO8
 LsOg==
X-Gm-Message-State: APjAAAWXNuscim8BZjd7AjILsL1MBKSDmy8PdvSa/Zxw7xSaD9/D32Q5
 l/H+lcTz3j+sQen/Oo8gSumv1Q==
X-Google-Smtp-Source: APXvYqwcxXo5+Ieqa7x45x82mtMfFr5hiRSw/QjuF6zvGPfArN1YfCX/7LH4MHP/oMjJqqKPm3GOmw==
X-Received: by 2002:adf:f281:: with SMTP id k1mr40956211wro.154.1565613340871; 
 Mon, 12 Aug 2019 05:35:40 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id d17sm14914204wrm.52.2019.08.12.05.35.40
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 12 Aug 2019 05:35:40 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH v2 0/8] drm/bridge: dw-hdmi: improve i2s support
In-Reply-To: <408dffda-fb9c-5f57-4f7b-404437359a69@baylibre.com>
References: <20190812120726.1528-1-jbrunet@baylibre.com>
 <408dffda-fb9c-5f57-4f7b-404437359a69@baylibre.com>
Date: Mon, 12 Aug 2019 14:35:39 +0200
Message-ID: <1jo90uimsk.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190812_053542_455747_C346819F 
X-CRM114-Status: GOOD (  11.94  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jonas Karlman <jonas@kwiboo.se>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon 12 Aug 2019 at 14:19, Neil Armstrong <narmstrong@baylibre.com> wrote:

> Hi,
>
> On 12/08/2019 14:07, Jerome Brunet wrote:
>> The purpose of this patchset is to improve the support of the i2s
>> interface of the synopsys hdmi controller.
>> 
>> Once applied, the interface should support all the usual i2s bus formats,
>> 8 channels playback and properly setup the channel number and allocation
>> in the infoframes.
>> 
>> Also, the dw-hdmi i2s interface will now provide the eld to the generic
>> hdmi-codec so it can expose the related controls to user space.
>> 
>> This work was inspired by Jonas Karlman's work, available here [0].
>> 
>> This was tested the Amlogic meson-g12a-sei510 platform.
>> For this specific platform, which uses codec2codec links, there is a
>> runtime dependency for patch 8 on this ASoC series [1].
>> 
>> Changes since v1 [2]:
>>  * Fix copy size in .get_eld()
>> 
>> [0]: https://github.com/Kwiboo/linux-rockchip/commits/rockchip-5.2-for-libreelec-v5.2.3
>> [1]: https://lkml.kernel.org/r/20190725165949.29699-1-jbrunet@baylibre.com
>> [2]: https://lkml.kernel.org/r/20190805134102.24173-1-jbrunet@baylibre.com
>> 
>> Jerome Brunet (8):
>>   drm/bridge: dw-hdmi-i2s: support more i2s format
>>   drm/bridge: dw-hdmi: move audio channel setup out of ahb
>>   drm/bridge: dw-hdmi: set channel count in the infoframes
>>   drm/bridge: dw-hdmi-i2s: enable lpcm multi channels
>>   drm/bridge: dw-hdmi-i2s: set the channel allocation
>>   drm/bridge: dw-hdmi-i2s: reset audio fifo before applying new params
>>   drm/bridge: dw-hdmi-i2s: enable only the required i2s lanes
>>   drm/bridge: dw-hdmi-i2s: add .get_eld support
>
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
>
> Jonas, is patch 8 ok for you now ? If yes I'll apply them to
> drm-misc-next.

Please don't ! I did not pick the right change and what I just sent is
just crazy, give me a second to resend

>
> Neil
>
>> 
>>  .../drm/bridge/synopsys/dw-hdmi-ahb-audio.c   | 20 ++-----
>>  .../gpu/drm/bridge/synopsys/dw-hdmi-audio.h   |  1 +
>>  .../drm/bridge/synopsys/dw-hdmi-i2s-audio.c   | 60 +++++++++++++++++--
>>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     | 37 ++++++++++++
>>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.h     | 13 +++-
>>  include/drm/bridge/dw_hdmi.h                  |  2 +
>>  6 files changed, 108 insertions(+), 25 deletions(-)
>> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
