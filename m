Return-Path: <SRS0=YAuX=24=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB4C1C3F68F
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jan 2020 23:21:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 776D42087F
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jan 2020 23:21:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Qh57Wqoi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="ef4VoKVq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 776D42087F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=A6OZxF5ehwlZD+bcGv+ArlP6lRpAH/UdSpLF+rCvafY=; b=Qh57Wqoizl9uYQ
	aNTWtzIxXXwz+K4+6EyOc13Dc7s4oHt+bXuNygSEkTSLMhE65Jh0VyAE3RintX8EFsZfe0WslYAWM
	n21qBCWzNCyHaRXCVmtSQKZfXTrqbCwanl3tgUzIOPw1UOCvUvXC3LfmGEnHeAcpdzJW5C7Q3k4n8
	+hcD9igkZ7e1NZIivs7MKFOYrimk61VZAeq6R9RDRYw6csWpJ8SaxZmfzXrRPlUi/zN4j3xMd/WEg
	z1LZiG5sRElx8ABg1gsy+xizaTBVww3/1Y14e6tQ5G76kJRsLMAxSD6vEtddQRnNP96j+FdNL6Wsk
	EDpDemsVMHgzImgqa3vg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ioy9n-0000xs-10; Tue, 07 Jan 2020 23:21:03 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ioy9j-0000vd-Tp
 for linux-amlogic@lists.infradead.org; Tue, 07 Jan 2020 23:21:01 +0000
Received: by mail-wr1-x444.google.com with SMTP id q10so1391140wrm.11
 for <linux-amlogic@lists.infradead.org>; Tue, 07 Jan 2020 15:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n8Xx2TMo98HOlnNXLfC+Sqmt0X1ycOlUNLncTAwPcpw=;
 b=ef4VoKVqe4g5ezm4iwoyskM7fNVE5Pe8ZwAriX4UoHXrg2UenS01yC3mdQNhCDlOFi
 zMx+THsG9CmCaNAh0KTvTGRQuxcIVdbfM/jMDy3hDLru3fXQF7n0SUZzSTbuy1p4ukPD
 zD6XYUTu9BErJHwbe8waeqaTPy5qvqEOl95iEfhnWn1Y68mM7OTNr+Zmj/Xf7Gp0ubnc
 Bo76HZDwI8IBpQjT9XVBxgEnfXQGS3M1qjgY5ifNX1KNEVOCECG47GvDbDaZItHdlLNH
 /6CmVCU868YRshLAfM8IZZzpljxZnrGt5u6aaVyxyxRACP2q/P5BtyhDzdYx4iKEJnYv
 vgVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n8Xx2TMo98HOlnNXLfC+Sqmt0X1ycOlUNLncTAwPcpw=;
 b=SCorR250loBPQtzCm+7MRtFYA410ks1puxu/LHMbNqfJ7Ym7ZABUC4wOjH6XwltPvP
 ukwMhxrRSoG3j1oNbm0aW6CrdcsFETRsr559nXo/DCs+IvFwr4FnoLjqrxUGatHbOHiS
 SmjuGoHxIzFuSsXJ5F4Njirgw45mraMZ+w/amgJyX+nMp0mvKmUKjZr7szse0/3D0WhU
 PDTvzTr31c6LyiKJ3F9MMpJCMAmTPOFc7ayAobQk4yur9I+2jVbdmy6ABm/0dyEOqFWb
 AEbwb1tV2xn5PtJ8vDQT5W1DcN29nvF8ADavLMskD9AwOzUn0DsJnpVIHQspTiXEzkvN
 8qzg==
X-Gm-Message-State: APjAAAW2qzZkwkM+ijW8d7l0hlGM7tiJgU2J0V1KAFRVRQguyJCOct93
 bNERa0nmsGXosqcFvZICRaM=
X-Google-Smtp-Source: APXvYqy6aZ57xs+O3szbAeVwXJr7Jzj0ibfQay91BV98G3in0RgnjJOoPl8vF91zzF2H+4FTVXGR8A==
X-Received: by 2002:adf:dfc2:: with SMTP id q2mr1313257wrn.251.1578439256295; 
 Tue, 07 Jan 2020 15:20:56 -0800 (PST)
Received: from localhost.localdomain
 (p200300F1373A1900428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:373a:1900:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id n3sm1669577wrs.8.2020.01.07.15.20.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 15:20:55 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: rui.zhang@intel.com, daniel.lezcano@linaro.org,
 amit.kucheria@verdurent.com, linux-pm@vger.kernel.org
Subject: [PATCH 0/2] make generic-adc-thermal less noisy
Date: Wed,  8 Jan 2020 00:20:42 +0100
Message-Id: <20200107232044.889075-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200107_152059_956454_00D824E2 
X-CRM114-Status: UNSURE (   9.31  )
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
Cc: edubezval@gmail.com, linux-amlogic@lists.infradead.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, jeff.dagenais@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

I want to use generic-adc-thermal on the 32-bit Amlogic SoCs in the
future. These have a thermal sensors which can be read through the
SAR ADC (for which we have an IIO driver) on those SoCs.

While testing I found the generic-adc-thermal driver to be a bit
noisy when operating in well supported environment:
- the SoC temperature sensor on the 32-bit Amlogic SoCs is typically
  loaded late because of it's dependencies (it needs data from the
  eFuse and a syscon to calibrate). Yet I still got a message stating
  there's no lookup table for the generic-adc-thermal defined (which
  is expected and perfectly valid on these Amlogic SoCs, as the IIO
  channel returns the temperature).
- the IIO channel is correctly defined with type IIO_TEMP, yet the
  generic-adc-thermal driver still prints a message which first lead
  me to believe that I passed an incorrect IIO channel (one that
  returns a voltage).


Martin Blumenstingl (2):
  thermal: generic-adc: silence "no lookup table" on deferred probe
  thermal: generic-adc: silence info message for IIO_TEMP channels

 drivers/thermal/thermal-generic-adc.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

-- 
2.24.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
