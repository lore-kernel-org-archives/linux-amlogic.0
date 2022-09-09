Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C0AEECAAA1
	for <linux-amlogic@archiver.kernel.org>; Fri,  9 Sep 2022 11:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mv7r/3bMS0YuwgpU+h+JuAyGI//Mvyr1A6LFWpJ2ZFs=; b=qKZR7fmy179Scd
	Z5pbIetNK1yijCv49d25d0eZu8npbnuA2neFjGSGSbxbtSPKv45CtLsNEUfNf3YXfk+iSNka+QNLO
	xfkA8l1adgc2coJSVKPl4DYYxWFEP1EUgbibn7jWGgxLHd3SdmYFnjIIfvmFVyqWArPQpLzhDp5GJ
	3yvFJencgsfhB4Gas7YOSWK9Fg67PU6pqyijaHxXsoXFzk3EmeCLD2BdvS7JWtQY8IwXfCxkrnRpv
	bSgmJ5jpU6/3h8YCGV7w+oyAkozzZPUw146kh6KIKCSLElzcjuGhNXQv86ejIyDFQzjBYkVl7Xz/P
	9Vv5v+J3MnKoQXrCVIiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWcJD-00Flf4-Ui; Fri, 09 Sep 2022 11:36:31 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWcJB-00Flc8-4h
	for linux-amlogic@lists.infradead.org; Fri, 09 Sep 2022 11:36:30 +0000
Received: by mail-wr1-x429.google.com with SMTP id t14so2242915wrx.8
        for <linux-amlogic@lists.infradead.org>; Fri, 09 Sep 2022 04:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=r8mobWkTyzIOZd/u+mLE5rL/ZYzPtNDIwhda+4LVJMk=;
        b=FfRoEBYrZhDLWhHbT/0GTGwWh6QTJRP4by803RrvZQgWa0rRmyLp4SckrVqBiy4ia8
         jRlK2QLx20mQWdyheQzfmjYSZKdo8Rs5elNTyp/Y59q3fQjphEuinbwlh5hoURa5JHX/
         ZXzlhYlIjIrb0IRxZrydxwc6X3Eyv1o+WEnGC6vJVwhZLLcvzuKQa0Hv4lpkrnT/RiUf
         ligQGPkII9ylgDm3gQKJf4dXbUdr4b5XJSbFOIYXmDtC+jOWkFsjjqb8BQTt1gsg/2bn
         zvP+FHlg2RsCPHjMqoH5KFr3w/LPWTpiZrUjlII/0ajbr38jrNPCE4WbKmUgmAkHaLbb
         RzCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=r8mobWkTyzIOZd/u+mLE5rL/ZYzPtNDIwhda+4LVJMk=;
        b=0THFW4doOwamBlc3CyG1zkDhbFBnSyYYsFBt83V6cOS8bLjSuiFsG9meCYb8KUMPbK
         zG05bL/bokre50/pOOG1poDHo9Wut7w7Ffio7FxFhVp6Qkg1QPTRSJlbXGbApPOD/RVR
         xNyUDhlFPDjF/NICzZm5+s7IKGTfqhHxV/V2b+FsjPeJ+yxhcGiRDjcJ6X/o4Y2q6fkS
         Vxmk8fT0vZGZdJZixWMMBAk4oBCYwbPKiZg6znE78jpEYfLjkxp2A5hR0H31mX7PxOhL
         tBcpzyQ1+8PHux1U1ia7JGBFb/upgLU9TudA9e2ZblDjgSQmMwQX2FeHwikr3QVDDPUg
         EDPw==
X-Gm-Message-State: ACgBeo3ZpLVyYU8IL15c8vzbtgNdiXt5TIUdjWPvpKt5TKBHFihJv+1i
	NB/4w6g6FrmOoTCeauZTsyFIuPZu5WSYY+mi
X-Google-Smtp-Source: AA6agR68NtvTror9rRcuTLe0sQsLweBMIGhNfQGRdrrp5l9KrJzK7pkPLvcfWaHoT2JgwWB00Jy/0g==
X-Received: by 2002:a05:6000:110e:b0:228:c336:b1db with SMTP id z14-20020a056000110e00b00228c336b1dbmr8114208wrw.194.1662723385165;
        Fri, 09 Sep 2022 04:36:25 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:982:cbb0:ca05:c15c:ee41:c8ab])
        by smtp.gmail.com with ESMTPSA id b14-20020a5d634e000000b00228da396f9dsm272862wrw.84.2022.09.09.04.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 04:36:24 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: linux-amlogic@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	Stuart Menefy <stuart.menefy@mathembedded.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH] drm/meson: Fix OSD1 RGB to YCbCr coefficient
Date: Fri,  9 Sep 2022 13:36:22 +0200
Message-Id: <166272336889.954213.13842769186384631915.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220908155243.687143-1-stuart.menefy@mathembedded.com>
References: <20220908155243.687143-1-stuart.menefy@mathembedded.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220909_043629_202664_225ECF06 
X-CRM114-Status: GOOD (  12.40  )
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

Hi,

On Thu, 8 Sep 2022 16:52:43 +0100, Stuart Menefy wrote:
> VPP_WRAP_OSD1_MATRIX_COEF22.Coeff22 is documented as being bits 0-12,
> not 16-28.
> 
> Without this the output tends to have a pink hue, changing it results
> in better color accuracy.
> 
> The vendor kernel doesn't use this register. However the code which
> sets VIU2_OSD1_MATRIX_COEF22 also uses bits 0-12. There is a slightly
> different style of registers for configuring some of the other matrices,
> which do use bits 16-28 for this coefficient, but those have names
> ending in MATRIX_COEF22_30, and this is not one of those.
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-fixes)

[1/1] drm/meson: Fix OSD1 RGB to YCbCr coefficient
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=6463d3930ba5b6addcfc8f80a4543976a2fc7656

-- 
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
