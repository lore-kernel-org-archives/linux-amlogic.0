Return-Path: <SRS0=YQie=ZM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAE89C432C0
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 Nov 2019 11:02:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E5F12230F
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 Nov 2019 11:02:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sJu6e7nn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kMQm2rrm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E5F12230F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M+M8fwVQTAa1HajxyOxaKhv0Ye53FIjV8srLz7bsKHg=; b=sJu6e7nn+h2Fo7
	ZltaPSs5w6K9W+iCehj/Z0CFJyOf+PUgy7YXkRfOQscjazUd7DtltzA5mBUlVAgUSGlo0xTyz0h/U
	L9mnEwui+yqb8MOYAwOCQU4D5ch5OgeXnLTgtJWXD+WLFVXOmhHXW1HHBDsA5mdKSHcQi7hMqsFWD
	ivuRTUlxiRxn+Vy2TQUXdFL+d5Uw/4a3Z6vb2nmb9pzIaZo9Aq2gBL7z0gCOtL2RJncK6m7NG1AuN
	Bw57EOjghhoxgDCrqk8M4l4O6uBFkEay3+06cujohsRyd8jecthCS/7SxkRvCIHOHN8+ZrCDTjH2l
	f7OylXOO6E7dJZwvVsUQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iXNl2-0002u7-At; Wed, 20 Nov 2019 11:02:48 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iXNkz-0002t9-RP
 for linux-amlogic@lists.infradead.org; Wed, 20 Nov 2019 11:02:47 +0000
Received: by mail-wm1-x343.google.com with SMTP id 8so7341739wmo.0
 for <linux-amlogic@lists.infradead.org>; Wed, 20 Nov 2019 03:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IOeGvqEPSRnHWJK9v9F0Le+azJhOAvlzGL7W3dTQlic=;
 b=kMQm2rrmysXsEtZRsLtWhGKLog2gHmO7AWh5zHbe32ElY8LCea3Xf+9eFLoep8aMIf
 INZ97vQ/bsBpejx60oirHSc65LYlCRsDLyGY89ljvILMC5pT5wcy59GYb3hekzBFEMTx
 PKIvj4Q3d9NwCkgdzstOJoKKn7Unj0bRG6JUGZgUPDV0Z53A6P4q3to/xiphjd7SYTvQ
 +2TVDX4mQcgCIHFShGlAJImCMB7HacS92G5x+xsMyjZF/bpPoPCnnlZaiFK2Vg8Z4gmC
 5TOTX93rHrqOKJuZ14Cd6Q0cNFy7XApx6xwJ2ypoWmKs6R3ijuvKKntQtW1dAyoalnlu
 dUUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IOeGvqEPSRnHWJK9v9F0Le+azJhOAvlzGL7W3dTQlic=;
 b=NMrwdlWOeNhgAVzixc41zq/OaZMVJKVyre0fj8oAiO99ADI7K6LU+YtotgXv52HO8n
 soqMtgP5ifNsKIVZzZqQCkIMvowdlk4TCD3U7ysKJiMNOl0QMJdnTe43+jAD7oqP5pt2
 fNSCnoW/cY04Ucy/efeQh7v5utCHIziABpwTTwqI9SY/AH6x79lYPIxINq6nbwzDWw6u
 0wHwOPCjRVX3sYEhr4bshssIECq/iEbSUvdgy6oYMOsX3udwAaxOY5vIXooc35RFTpxH
 5OZfMVlg688KE7kDBNosW7Z6MpTWCEBHjDH+t/84DI2KQ2YPfmEDZ8d9bCAJSaZFGWsI
 y+Ew==
X-Gm-Message-State: APjAAAUo9NdYR5IWyGywoezaam2slf/+497n2DrQjuQWDktf14g+366p
 cX+blqhNBgLAfYBoqbX0UcM=
X-Google-Smtp-Source: APXvYqxtwVK0T6hqJefUmPiH1r3EbF2/xB0ZSsyfcMC99NMYsHLOiUyqJFdyoviEBRZJhrQSBZXa4Q==
X-Received: by 2002:a1c:7d95:: with SMTP id y143mr2514040wmc.143.1574247762372; 
 Wed, 20 Nov 2019 03:02:42 -0800 (PST)
Received: from localhost ([37.238.189.2])
 by smtp.gmail.com with ESMTPSA id b8sm29979574wrt.39.2019.11.20.03.02.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Nov 2019 03:02:41 -0800 (PST)
From: Mohammad Rasim <mohammad.rasim96@gmail.com>
To: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Marcel Holtmann <marcel@holtmann.org>, linux-amlogic@lists.infradead.org
Subject: [PATCH v2 1/2] dt-bindings: net: Add compatible for BCM4335A0
 bluetooth
Date: Wed, 20 Nov 2019 14:02:34 +0300
Message-Id: <20191120110235.13987-2-mohammad.rasim96@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191120110235.13987-1-mohammad.rasim96@gmail.com>
References: <20191120110235.13987-1-mohammad.rasim96@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191120_030245_914030_EEC66DD3 
X-CRM114-Status: UNSURE (   8.64  )
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
Cc: Mohammad Rasim <mohammad.rasim96@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


Available in the Ampak AP6335 WiFi/Bluetooth combo

Signed-off-by: Mohammad Rasim <mohammad.rasim96@gmail.com>
---
 Documentation/devicetree/bindings/net/broadcom-bluetooth.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt b/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
index c749dc297624..f16b99571af1 100644
--- a/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
+++ b/Documentation/devicetree/bindings/net/broadcom-bluetooth.txt
@@ -15,6 +15,7 @@ Required properties:
    * "brcm,bcm43438-bt"
    * "brcm,bcm4345c5"
    * "brcm,bcm43540-bt"
+   * "brcm,bcm4335a0"
 
 Optional properties:
 
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
