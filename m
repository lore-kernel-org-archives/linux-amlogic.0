Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4526C4332F
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Dec 2022 10:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KZ5uuo6VTP5w8ognKoU534v3ABe9qM3rgV1ZgoXmc5g=; b=ZBNIij1wwNBYC+
	zE5jCwxqjIskLRU5TBXPR5WOlXelWx5MjS16XfrcElXT0mXvZW8z2VTk6X7f/JVuRk7wI670d+FyY
	3WsnmKHc05TCaU30+q0HuH/3mGAWg2YcbeE6LWCJ75PNvQAWgN9+kTUY2/ozEoFBMw7OIQR5SEseC
	ecVIVx6A6Fnx96kK56u1D8IxCn8FQslGmlFNWSWnlh+grpN5YORJosR16AkuU85Ks3c06xHz5UPPY
	ekUVznYL4p+Ytdr8UyPiKBpUe+acJVm/L3CQKTQWVbZyXN9X0Z2bAhY8FEkJQeXfcDQTUv4fWVkqv
	rNqv4DRwj+ixsGy0kfaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pATJB-003vIM-SM; Wed, 28 Dec 2022 10:05:13 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pATJ8-003vFb-Bz
	for linux-amlogic@lists.infradead.org; Wed, 28 Dec 2022 10:05:11 +0000
Received: by mail-pj1-x1032.google.com with SMTP id m7-20020a17090a730700b00225ebb9cd01so7736380pjk.3
        for <linux-amlogic@lists.infradead.org>; Wed, 28 Dec 2022 02:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2u7Uk1luvmnMjmFHjGbs37xOdHZWhJfRtivVYvqsKyM=;
        b=BlOZxQ5+5ju6hXADgDx2hPBqe9r38X9X8SmUUkifVf4KIr45ylB/tSiqMtWEsEbn7Y
         EhQ1f3ozW+hw3PdFi+cM9TRtoRR/hS7auXKnoNSvzVMGKj/sTmd0GydvJ2XPgdpHwk8T
         vpSzFMx9qo8J6p+g4uwaMeU0Oqf0Uc82mJEXehu/zEvQLRFmi7v3O+sEbcLpt60y601y
         r+fHvKFhmSIQ4snrIJRCQ5bRPdlaiNDhA/Q+HdHRbZAlBvflUZndIsQ043Sxxx8UpblI
         c6XFyqDqC/jaRk4F87Zbj+fCA9iSlDitrUMVhyZZ/NLD2qg5LFgP2IqQEAGEyUoS9W1t
         LFwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2u7Uk1luvmnMjmFHjGbs37xOdHZWhJfRtivVYvqsKyM=;
        b=1x/8G91eQs9flaQl7+DikMpi+R+gGPwhzmNVkiwM/FFkUxYb8Ywld/wLMp3Qc7/vVg
         2ytkKwhZIaUMZkFCXa4BB+flbGCVzTWtR8USjWoiW/KFa5C3AV7Q5kZRsXR3kf2juXEj
         H3r6275sn6gt+VxFWvgxLtJZM9E1yeTw20jNydas7NIy3Na6XWVkHbq9bBtrjoKLDLEz
         Y8mHd7QlK2dxsQl8SdcwDEnb+f0yziA9DjuyW6filbWtkK9+Agnb81dIY/WDegEpkEFX
         pRy2nJRjOQRoikzU0QlQdgjh5kG9kfbsQ4TuYg+gIMVOU7r7DbJXjwiy0iFyAFRu8nF0
         AlqA==
X-Gm-Message-State: AFqh2kpilP1cvoia6OcaYBdmaz5ZMEitbsaWLCLICPK5NqLROLv6w8p+
	LU1hC+RW44XhiwvLYTE42aM=
X-Google-Smtp-Source: AMrXdXtgp+C1gXCKHzBhlMTiGizZFzt1wSInB/oFAAIr0BnRXXMSGIzeiG4uF2FYYgUW6TOU4+wuGA==
X-Received: by 2002:a17:902:b114:b0:192:64a9:62f3 with SMTP id q20-20020a170902b11400b0019264a962f3mr17041434plr.48.1672221907772;
        Wed, 28 Dec 2022 02:05:07 -0800 (PST)
Received: from localhost.localdomain ([45.112.3.26])
        by smtp.gmail.com with ESMTPSA id t6-20020a1709027fc600b0019277df45a6sm5794915plb.53.2022.12.28.02.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 02:05:07 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Icenowy Zheng <uwu@icenowy.me>
Cc: linux-amlogic@lists.infradead.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 01/11] dt-bindings: usb: Add device id for Genesys Logic hub controller
Date: Wed, 28 Dec 2022 10:03:10 +0000
Message-Id: <20221228100321.15949-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221228100321.15949-1-linux.amoon@gmail.com>
References: <20221228100321.15949-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221228_020510_478416_57B537EF 
X-CRM114-Status: UNSURE (   9.73  )
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

Add usb hub device id for Genesys Logic, Inc. GL852G-OHG Hub USB 2.0
root hub and Genesys Logic, Inc. GL3523-QFN76 USB 3.1 root hub.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 Documentation/devicetree/bindings/usb/genesys,gl850g.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
index a9f831448cca..db009f3ef438 100644
--- a/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
+++ b/Documentation/devicetree/bindings/usb/genesys,gl850g.yaml
@@ -16,6 +16,8 @@ properties:
   compatible:
     enum:
       - usb5e3,608
+      - genesys,usb5e3,610
+      - genesys,usb5e3,620
 
   reg: true
 
-- 
2.38.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
