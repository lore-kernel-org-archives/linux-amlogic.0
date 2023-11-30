Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 361B6C4167B
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Nov 2023 05:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KOWzun2iAf2Rik7z8cyH9HiF46l4866r6Y0IDc94nJk=; b=MKVfsPpE/l183/
	yfGmp9GxZl0MFald448l1w/1vlla/JN5xmdh5Kry02TlVIpB0og8oUxljam4urHtYerUGhM4TiYo8
	Gukx6pyG6mt6gzEkdzLv2ynRpK//XM2sH4R8C7fUXTN7eHaEXo/YAvg5lMpzj2YdOALAeoRnFgtUx
	NDlrN1lPu9d2cagfO3QF5Y/HxmnVydSGW3IcPGwvG1NEyEW8dqsCJqM0vsSQtLSm/vC/m16bHbZnR
	7PySEFhfpixdqChe1zDMjR2CTixGRAIq7uJJpH+wBXlHZ94Md2TCjwzNxZMUXJCkXwqRwIJHbLIlN
	jf3jp8VjmSoFQ2AkgrOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8ZeR-009yFq-04;
	Thu, 30 Nov 2023 05:31:51 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8ZeO-009yFW-0q
	for linux-amlogic@lists.infradead.org;
	Thu, 30 Nov 2023 05:31:49 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1cfafe3d46bso5958725ad.0
        for <linux-amlogic@lists.infradead.org>; Wed, 29 Nov 2023 21:31:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701322304; x=1701927104; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RswNLYEcHNhC1AMaD8UNTKN5q4TDPDv5k8nROGSx8Jo=;
        b=Bq9cIHZPRYXrE5mc20PMV33AmQXPed0VCFwbI1SvzJeWoJFYvOadjwPEo+X2Hzhnl6
         yRYJTKII5DViWUbo9XscUjsjisPh8EmQRroldM5AHdgCdEQtjeguBF1V7/0ZfDGXjYFM
         ZxNNfLW/VOvB7l0AnkTURZuHV7xqd8dy+KhBNAv+5Xjs4PQREAUBebv9CJsqebFMjZse
         rHHucLf4MDuGpqk8yQDfU9JqfKXgcL716dXK+oTJJtNUR53yxNnte2aZ3FrKuTMptF2Y
         AMC8eFZEFSbEVxsTGLiKCLLYsb0jrr+0mI3H0eDrti77R3hBHQVZu/6fLIuQRb+zvg96
         gcmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701322304; x=1701927104;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RswNLYEcHNhC1AMaD8UNTKN5q4TDPDv5k8nROGSx8Jo=;
        b=EdP2XiYu+USiWYIswp0VO2pWzYs7SRqRpTEbpDlBtychW8PwXnwrejJBuikIyOfSM5
         dXiHvEWpsSNfm5fDKLnU1PlsO7/4BmaGo5Z/Vv4VEM6mhBOM1v/NzObrtnt+v0BZ6xlF
         D56WqluuNSMmrjP4NKafXL3YZqIW1YX9wy++Q+xNCyJVeCoKls/ZOGQ0uB12EpXLX/+G
         inLUIqxCwdJaOVM1DqgITtWvbl2VUZze3fS1h9jarNWVD0OFtYxpTxDdJwzFuh/EMUQL
         6HuQSa363anqWRkn6rPhXlO7uYAkBFoQ+hqjfIwGA7SdSEBu41vAMsYcFnFZWNXOLGkX
         9Zmg==
X-Gm-Message-State: AOJu0Yybyyu3EUp5IyBcePtRVDzH59puErSGRQf1tdtSQDcA7+NrSPsg
	w5rrGqjTRE8n3XTlPaDOvJLWQlk6Zlo65A==
X-Google-Smtp-Source: AGHT+IG8fPYijGhevXYDh+0BGWgFkBJYgXT3BwNL5gT5MUt+yd0u1OqCokxi0vNDunZMDU6ess0fmw==
X-Received: by 2002:a17:902:ea84:b0:1cc:68c1:cab5 with SMTP id x4-20020a170902ea8400b001cc68c1cab5mr21700665plb.14.1701322303978;
        Wed, 29 Nov 2023 21:31:43 -0800 (PST)
Received: from localhost.localdomain ([49.205.245.83])
        by smtp.gmail.com with ESMTPSA id t5-20020a170902a5c500b001cfad1a60cesm336330plq.137.2023.11.29.21.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 21:31:42 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: 
Cc: Anand Moon <linux.amoon@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-amlogic@lists.infradead.org
Subject: [PATCH v5 0/2] Use onboard usb hub reset on Odroid N2
Date: Thu, 30 Nov 2023 11:01:25 +0530
Message-ID: <20231130053130.21966-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_213148_324526_8BC1BD00 
X-CRM114-Status: UNSURE (   7.90  )
X-CRM114-Notice: Please train this message.
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

Add new binding for Genesys GL3523
Fix the dt_binding_check error
Fix commit message and peer-hub description
Fix commit message and peer-hub description

Previous:
v1: https://lore.kernel.org/r/20231010032446.3194-1-linux.amoon@gmail.com
v2: https://lore.kernel.org/all/169700589265.2911018.855796610271678067.robh@kernel.org/
v3: https://lore.kernel.org/all/20231119023454.1591-2-linux.amoon@gmail.com/
v4: https://lore.kernel.org/all/20231122182351.63214-2-linux.amoon@gmail.com/

Thanks
-Anand

Anand Moon (2):
  dt-bindings: usb: Add the binding example for the Genesys Logic GL3523
    hub
  arm64: dts: amlogic: Used onboard usb hub reset on odroid n2

 .../bindings/usb/genesys,gl850g.yaml          | 65 +++++++++++++++++--
 .../dts/amlogic/meson-g12b-odroid-n2.dtsi     | 36 ++++++----
 2 files changed, 85 insertions(+), 16 deletions(-)

-- 
2.42.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
