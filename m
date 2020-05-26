Return-Path: <SRS0=ok2G=7I=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D88BC433E0
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 May 2020 20:30:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 119822065F
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 May 2020 20:30:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KhmH98T/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="r4XgU/IH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 119822065F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=P7fhZj5P0td1TfIg4gLKKywjShbBA4Yq5jSDAEVDwP4=; b=KhmH98T/NW72OH
	i6SGNsJw96uhBeMDC3R8+8vKCWF75kwNv1EfPB0Y0AqTUiATEud1gnUBk/gSlGBAikDClNTpPN0GX
	1wFmL1A4RO0VPvuA6wnX/n+lwFeyKFHNP933nyOaqnCehw/WGAUePRWvbxO+1HfPo0COf/qcDT3Sl
	h4piYSLQ15Euad3fNfGS7/3Tzj7uF9BhENZYQ8cpgvEwfekYd0ZS0hxcMJf/m9/oWLfX4L39ilETA
	tWfW7IKX7+0gt8PpFpSpcpAFyrFMBsepWNkEG4jNFks8cOjo5m0tG2eYBUDxiG6sgjU5yA9DAOXPN
	RQQUwAkk6YTECNpROM8Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdgDJ-0007V0-81; Tue, 26 May 2020 20:30:17 +0000
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdgDE-0006TJ-UR; Tue, 26 May 2020 20:30:14 +0000
Received: by mail-ej1-x643.google.com with SMTP id h21so25267730ejq.5;
 Tue, 26 May 2020 13:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BS3gmgrNZrm2hux2kw4Gbzw+57Hl3YkxBqJ2R++uXCI=;
 b=r4XgU/IHeIoBI5OZ3olD5EbIcyRjAdqgO/+YRdPtOaCBv4j6Gxd2LwK5NJDWEcB9K6
 vRJ9Eupq+UblOGSrPMH9XyH60cEtJegWSpZE0bcGRFfIU4sIWX/aIW7ZilHW+aahd81Q
 N7C7FGEp7o8RzXe01Lj372FSwt6O7bpBFkItV1AB/o7VN5NHQMfKDId1oKpnxNLO5Qbd
 whV5DLqWTuhIbjDiN9HkKYDqxghk3V4w+q6G2r9Oz6exuMv5njdsDraYR6EilKiL7m1G
 /lN49juqSg8mij/VsmISVxlaHeonpyhTUGc9LLFuKUplPBC+WVsGVbzXXdbZA2d+cpba
 j9FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BS3gmgrNZrm2hux2kw4Gbzw+57Hl3YkxBqJ2R++uXCI=;
 b=D8LgVDMdhMthpDBrte1+JRN5ShjtGwPD2powEFBAsaq5fg3GbmSFDoJisqXJoc4nzI
 +V22zSGgwe8G53GfuNQPB1KT/0hX/xfzdhBdjf/EDi8CCTZ5DpRn+5lqA9UpBbwTW9PN
 l03t07t8rN6FwPp5vDEBfUdCOq1b9A5BIQS07jYTsXsvUX0nxcCWEfs7hndDt8gKQiHs
 8w3UQGXgDjVtm2Mo4GlQtiJLYNNnxJEhnn9iHiZsRWskdQOCI8RYjYb9uLK4uqPZTsIZ
 U0MNEhETogjCvzngVlDExlK3DqEJ/pnJ20HaVR/qzPLxjJrA+bnwE/g5smYzEM1FRW1d
 40vA==
X-Gm-Message-State: AOAM532gpHlQYqrcbnMU7tTH2tLGS3XWFGfPrDidpjrtW+Je3T9HMSf4
 U9tULveQasQQkf4FPi7KfOM=
X-Google-Smtp-Source: ABdhPJwesYpdqbXffVEfuArKTeB8fbq82Mn88IJ+AIOM3WfF0QObdfPu/3ksWvttav2D8RnkKlaSfQ==
X-Received: by 2002:a17:906:1f09:: with SMTP id
 w9mr2655211ejj.486.1590525007118; 
 Tue, 26 May 2020 13:30:07 -0700 (PDT)
Received: from localhost.localdomain
 (p200300f137189200428d5cfffeb99db8.dip0.t-ipconnect.de.
 [2003:f1:3718:9200:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id ce16sm735517ejb.76.2020.05.26.13.30.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2020 13:30:06 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: balbi@kernel.org, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-amlogic@lists.infradead.org, narmstrong@baylibre.com
Subject: [PATCH for-5.8 0/2] dwc3: meson-g12a: two fixes for v5.8
Date: Tue, 26 May 2020 22:29:41 +0200
Message-Id: <20200526202943.715220-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200526_133013_001049_0D0AF628 
X-CRM114-Status: GOOD (  10.32  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 hanjie.lin@amlogic.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, yue.wang@amlogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

I discovered the problem addressed by the first patch while I was
investigating a Kernel CI regression: [0]
It is unrelated to that regression but should still be fixed.

The second patch adresses the actual regression. Testing was focussed
on GXL and GXM for the previous patches. Unfortunately one of them
regresses USB on G12A, G12B, SM1 and A1 SoCs.

Please queue these for v5.8 so we don't end up with broken USB on
some boards.


[0] https://lore.kernel.org/linux-usb/ffe2c64c-62ed-9b59-3754-7ede0f0203be@collabora.com/T/#u


Martin Blumenstingl (2):
  usb: dwc3: meson-g12a: fix error path when fetching the reset line
    fails
  usb: dwc3: meson-g12a: fix USB2 PHY initialization on G12A and A1 SoCs

 drivers/usb/dwc3/dwc3-meson-g12a.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

-- 
2.26.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
