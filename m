Return-Path: <SRS0=11Ec=AH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CE63C433DF
	for <linux-amlogic@archiver.kernel.org>; Fri, 26 Jun 2020 20:31:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03A5C207E8
	for <linux-amlogic@archiver.kernel.org>; Fri, 26 Jun 2020 20:31:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ShvDKMYD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="mgOrXJYk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 03A5C207E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SZN2m14LJNqVxJ5RnRAZusEyb7kGjKSzxRPgDXJVk0M=; b=ShvDKMYDjLKIJWtuCDRZw8agp
	VpjWFssYm+mPcpFkbcU2gDZFRRkC6UiyuBQv1X3RCv7+SwdbTjLgMWWEQBAwb/8wXKqTCkTH1R0FM
	1Jux9TGoEqCoTJpyoJoStbocX8gcjYtGuSoJyDJk7RyXH8n0ZAOuERevSHhuJXMU7VyG6opGDzq+1
	RRmXbIWZxA3zGmq2WoyrJFQ1Anc51x4fzMhNjFjK7iVXRDmyir+98nxd85j5OONmYetEtzsI9emkI
	OUDrm9l2hFNoKPlSsqV5DgXYnmIjF6sBO1eZbpna8N5mEUuCogRn6y7PQXFTQ6o4IfU+qetgI/oqw
	Un+1oft1A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jov0e-0008Fm-KW; Fri, 26 Jun 2020 20:31:40 +0000
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jov0c-0008FS-5v; Fri, 26 Jun 2020 20:31:38 +0000
Received: by mail-ej1-x644.google.com with SMTP id mb16so10585801ejb.4;
 Fri, 26 Jun 2020 13:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GHskhK5zJYDmbrTDrhLsCeFDGpbooMe1GlCaRqXte2c=;
 b=mgOrXJYknIP41R6HpllvCjRTYl8geQlQG1XCOfdcqDUyoH/ViuScQo+rOpl3apvTyp
 Iy3tGV1Pl+z9gn5wLmJsR5Z8/2wmsBISF63UU82+G1qxkzfg8iEMw8kmKAJ9h0Bn8+wc
 US5Pw3A/gtlN8np8Sdzt32rJSE00QCljY53f8XGDl9qhvlKAmGrXpydxBjQZNM+Aw25d
 fOD3BzBDwqnlCuESSETovlzXhlHC1+nP5L012hGQGlgMKBD02NYj630P9Tz9sfpmirnF
 yvENJS9pqNMO0Dw1qxM+0yjudtRqfb0UIIxheifVXW0o300Th4g0/Wx3qf4HUVLc2hz4
 hISw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GHskhK5zJYDmbrTDrhLsCeFDGpbooMe1GlCaRqXte2c=;
 b=BbGppMLJPdwA2wypTDWSFhcQZGgmN0vhO5HXbnxsVmFB8emC73K06eN+JZ+NADrWy/
 mQ7uwve6dHSKiPGnkpgZNzyDwWN1rRdhVZ1F9ZyugNSdxYOOcU1BExeBevZOHL0VyA5n
 T3aFGv/ZKWHXieqgXb8v8PbdtsBZjCWFwfpJlcZstbjGqalRn+vbv6eM3yqQzpNIcRic
 3V4awy+Kt0jt1Q/dZ9A6m6JrZGlqRHqsVh3MdA1Pim4+vAOSbzpow8GPEtlcOMpFM4Ml
 P6L3inFOuiOC2zMQXFNqV+CNvu0vt+ceoWC8mAP2RI54ZFhgX9tajlkklHVaQ11EJy/A
 1Prg==
X-Gm-Message-State: AOAM532fNr21EJsx7keIBLszrOCNUGzXBCRyEgJi1cyLnLJ5uBX+2Trs
 o2dVhXbpw028LoPjV1hcrDV3eUn9RF1AMbs+pcM=
X-Google-Smtp-Source: ABdhPJx5ZIx7dwJXxETKotyYevsiB5MFzMoyXAVoKNNps4L45zbMI4CMKkdQs99fhN4iRy0pnR2HoLfzr1r89Wss2GQ=
X-Received: by 2002:a17:906:35cd:: with SMTP id
 p13mr4178063ejb.172.1593203492761; 
 Fri, 26 Jun 2020 13:31:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200626080626.4080-1-krzk@kernel.org>
In-Reply-To: <20200626080626.4080-1-krzk@kernel.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 26 Jun 2020 22:31:22 +0200
Message-ID: <CAFBinCCKm44c2k2w2R1MG2f7OFytpk0DOShuxNKDbFoiPreTTg@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: meson: Align L2 cache-controller nodename with
 dtschema
To: Krzysztof Kozlowski <krzk@kernel.org>
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
Cc: devicetree@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Krzysztof,

thank you for this patch!

On Fri, Jun 26, 2020 at 1:59 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Fix dtschema validator warnings like:
>      l2-cache-controller@c4200000: $nodename:0:
>          'l2-cache-controller@c4200000' does not match '^(cache-controller|cpu)(@[0-9a-f,]+)*$'
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
