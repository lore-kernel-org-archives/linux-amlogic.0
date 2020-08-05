Return-Path: <SRS0=gead=BP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1029AC433E0
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Aug 2020 07:53:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4BCA21744
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Aug 2020 07:53:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s+tM5fxY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=endlessm-com.20150623.gappssmtp.com header.i=@endlessm-com.20150623.gappssmtp.com header.b="Qssun9pJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C4BCA21744
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=endlessm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:MIME-Version:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=o0ddDOdBcbf6foyBKu6zTn6Nz0D8rs6Lr/lRlZUSDS4=; b=s+tM5fxYJNg/J/qw/zhqZnq9Tc
	aOVws49j996v/3chd20SktUtG+iCvPYl9Ou3DGneADp84mLKohp4p34IRU2R654j2wN0HaETvFQin
	ywD7h3kJMaRCueSVxQMmHDcGtEUMdti7NJI0XJd5ObEPmRL32tUM3HAMAt00LOAdYnNVXeAVrATzm
	xDB6XWvq3VEYFdwUSKdpk7WuzXcCzX72VjrVxC8apEM5JRaJSXP0+NvB7aLDOpOVCUq3llk4nYMRZ
	51T4+rtgbbZnk7CJBBIzaTR0HI54nm+LvaRNrZYTiOVtbSeSUo+sdK5rLYUR+FWbA3RDMC2cVzpKA
	ubhAcHrA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3EEx-0003sL-10; Wed, 05 Aug 2020 07:53:35 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3EEt-0003qH-JU
 for linux-amlogic@lists.infradead.org; Wed, 05 Aug 2020 07:53:33 +0000
Received: by mail-qt1-x82e.google.com with SMTP id t23so29883558qto.3
 for <linux-amlogic@lists.infradead.org>; Wed, 05 Aug 2020 00:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessm-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=Xsx2970sDaGK2n7Ry25zgIToYD1mmkdlUdiP7Ol/Mhc=;
 b=Qssun9pJVy8qeD7sCHnnl/w7VKHGZ14AHFphFDRE9P6TG8VBGpVHKEQABiOlmlbpkw
 sjclv8dQISMvq8lLBW4G3MMLFTmtHol95dNVRhGakZ9QlgaJYUSh0k1T5/VGi5S7ItxE
 4zOaRwB2XnA7OpQwD2gVJWjPd1TYgOZjBVEq/z9TfOoo2iiWiku8bSHfws4p0fltTPsr
 SOyQksRfn3LAO+BKJpvX+5estkRvQJ/XiAakf9TLtp12JiwfQF98sp14xD2MlUO2C7Kw
 e4lhTWkNzNa/Bsa4EH6U+VSj6zeqVaDOMBBVJkme6n6t4mAu8JxFiWXlVD5ekSUQL58Y
 b/Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=Xsx2970sDaGK2n7Ry25zgIToYD1mmkdlUdiP7Ol/Mhc=;
 b=jAQQnOgd54UhuviBFoHKWKzRZKy0SHTO/B6XxrUSRj6HaUM58Zs9t5hulEO9tmhB65
 eRT7AjvYHCyBX3cer/j4sFPgHzQXSdciltcGh82ni/sClr7pK8RjbUaANnoSk5+icAMa
 XnbDD7kAc9OyczZk8Etfv4SEnWvI0kC7fMPyD77xT/AzSFVDmiusdU7kckh4tDXX2n+C
 HNRvqjg2wRma0dj8VhNmxwiiZR5wXyRMFP/g0Cb1X+R/1vlBjVEdTe4Y9IbeQSfZ3wbL
 JAuK5RaHaQV5QPmyeA0+8FG/Z5LzhgXQd0/PiqjALLlXFHH7dYDJEYt3Gk9mfDgtOTIr
 ja0w==
X-Gm-Message-State: AOAM533GC/N4tdRSkThQWs5S3BsUgb+hchhK0DYYDOjx/6eCjwzUBzJp
 PInMfC9u0s+764RIPpwGGP0U9+x/ITApwO1C8lCR+ODZHKfirw==
X-Google-Smtp-Source: ABdhPJxLPKhC0msaJi1pvHz7Pv9VTO8eVdHthHqz4RKMT1YWkGfTe67Fm3Vi27N66+1wZepehC7fznkI8a7uy3bhfQM=
X-Received: by 2002:ac8:6b92:: with SMTP id z18mr1917014qts.96.1596614006077; 
 Wed, 05 Aug 2020 00:53:26 -0700 (PDT)
MIME-Version: 1.0
From: Jian-Hong Pan <jian-hong@endlessm.com>
Date: Wed, 5 Aug 2020 15:52:16 +0800
Message-ID: <CAPpJ_efVhfH-aq2NcDmK61vn7+mM_wy+nisuMg9AZhHEr=hu7A@mail.gmail.com>
Subject: [QUESTION] drm/meson: Hardware cursor plane for Amlogic/meson
To: linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200805_035331_881540_032545B4 
X-CRM114-Status: UNSURE (   7.70  )
X-CRM114-Notice: Please train this message.
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
Cc: Linux Upstreaming Team <linux@endlessm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

We have a khadas VIM2 board equipped with Amlogic S912 chip. We found
it shows multiple cursors at the same screen which is more like
afterimages. This bug is filed as the ticket [1] and exists until X
uses software cursor with the commit ("modesetting: Disable
pageflipping when using a swcursor") [2]. Meson drm does not support
hardware cursors and current versions of X will disable pageflipping
when using software cursor, which is a big performance hit.

We also learned there is the hardware cursor plane supported by
Amlogic chips from the slide "Mainline Linux on AmLogic SoCs" [3]. Is
it possible to have the hardware cursor available over the drm
interface?

[1] https://gitlab.freedesktop.org/mesa/mesa/-/issues/3143
[2] https://gitlab.freedesktop.org/xorg/xserver/-/commit/0aaac8d783e78c040a70a55ba8d67809abd7e625
[3] https://people.freedesktop.org/~narmstrong/lca2018-amlogic/#/section

Thanks,
Jian-Hong Pan

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
