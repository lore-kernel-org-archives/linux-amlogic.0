Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D0CC61DA4
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 Feb 2023 21:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=amxATA4/CU9791h71MYoQ8VRNkhUNevz2LnUNYzQUHY=; b=0sXDwwxhJcyjbu
	e7tvleefezkbRZVTCT5zNZ5K5irdme4DWDfyApKUOPYFJ7ytqMCM2qhVKzSWlg9QTZATAI+c9r/ly
	g3hZtdUg8L5z8KgXNkq1CYdpZqZiIoUoDBY5sw05ylVJ5pLFuaPlQBHCrCeDkHcdtjsEB3EiIqw3+
	w2tMUjtljEmVmLa4ImwJ2Ls/Gpy86vd+CnHVsPR/58WwVBPglkHWp70dsWv/Ii5mcjfqUxuVAsxEB
	qoJsNAL8gewz1nsGhKRfbCjuL4nZjU+H5WEO8Zf6j3vHnP6DYVAyLWVCueOp4J3GxFV1bfefG7iP1
	4SvIMtXSRRrT+UfLSnYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUwIB-00E6af-WA; Wed, 22 Feb 2023 21:04:48 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUwI8-00E6WC-Jk; Wed, 22 Feb 2023 21:04:46 +0000
Received: by mail-ed1-x535.google.com with SMTP id ck15so37023158edb.0;
        Wed, 22 Feb 2023 13:04:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bbt3aJeEOkgWRPa3MfKpp7LuHfzCeFjCJvJNJi9PM8Q=;
        b=QpTl01PM3tuyIi8wIIDCzQPYzGp1nAZs0O0EnPXT/GiPYtbwLditEfKYj9I0HsqJcl
         edm5/RfJugSH+PjhnpHHCVpx1idH/Bw9ekKGG07QLwYpzGzEFjNPGxgBhwW2Cpl/+/wo
         fkPu6sUamnyY1HZsgcs0aE4AILYO1e7Vr6KIbNbPqdL9hNkAGMUu5JhuWrYR69prldVx
         UPfvGbyx/Dh3Ha6IngzXd/wIm5ABBhV9snWFshC3WKSE7f9gqBPAUIIjcL9avrSLyBvC
         H5ghH1xAtaONTJCsGIurtakAjTg7oP/fNQBYV5bI9aIFSGOVUlqu4hcIU63OPhtZdEhu
         dHGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bbt3aJeEOkgWRPa3MfKpp7LuHfzCeFjCJvJNJi9PM8Q=;
        b=DQuh4QYL03sONty7S3UbghTGN+1flQ0prlZqs7mXsmKI6pCOGUcpz2PWnFH3DM39+0
         TncQK6SD0fPYjpKVFPiemcvPocuSYCeYJFo1coV0ut721KEb6Q9CCULCcdRmz2kjoXud
         5/ul5aA1jL/PxH+2YtMxueZPMPs2WdHgGxOV28Kp4zfj2P2+uyKQkbCsm/JLv4YQAQMr
         djTPoX4ygysoSpWT/nlNe3F6tZEDoM5LbhIoMq6ToLhXB2vszS2pRosv7womNpg/ngl/
         8TPW1UPNb0GxgW5iz1Yg4+AkWCgqA8d2zOqDAu4I1COt31mlgfqSQvogxFXoQLOQljOZ
         T6Ng==
X-Gm-Message-State: AO0yUKUQMnkTd9S9SqWl+vBEwqL+yZJLwktYP7uEP7nq/J9XXdsdZYGg
	adAcfh232M403sIWc4sPrJ7YK2Wx4JIX0Q==
X-Google-Smtp-Source: AK7set9KkALgBRDZV1vi9ZyBe4G0fUEyBTMSKdxvwQ0WW8i5WiG/vA6Zu7t5NqcQWHOSyhAAg54Ozg==
X-Received: by 2002:aa7:c552:0:b0:4a0:e305:a0de with SMTP id s18-20020aa7c552000000b004a0e305a0demr10644977edr.19.1677099880648;
        Wed, 22 Feb 2023 13:04:40 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a01-0c22-76c9-eb00-0000-0000-0000-0e63.c22.pool.telefonica.de. [2a01:c22:76c9:eb00::e63])
        by smtp.googlemail.com with ESMTPSA id m17-20020a50c191000000b004af6a840f21sm209208edf.15.2023.02.22.13.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 13:04:40 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v1 RFC 1/3] dt-bindings: serial: amlogic,meson-uart: Add compatible string for G12A
Date: Wed, 22 Feb 2023 22:04:23 +0100
Message-Id: <20230222210425.626474-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230222210425.626474-1-martin.blumenstingl@googlemail.com>
References: <20230222210425.626474-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_130444_711475_D4DE8D30 
X-CRM114-Status: GOOD (  13.67  )
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
Cc: neil.armstrong@linaro.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, jirislaby@kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Amlogic G12A SoCs gained a new "divide XTAL by 2" bit. Everything else
(we know about) is identical to the UART IP on GX (GXBB/GXL/GXM) SoCs.
Add a new compatible string for this SoC so this new bit can be managed
accordingly.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
Why am I sending this as RFC? The last change in this series means
that the resulting .dtbs are not compatible with old kernels anymore.
My understanding is that this is fine and only the opposite case (using
old .dtbs on new kernels) has to be supported (which is still the case
with this series). I'd like to get some confirmation for this.


 .../devicetree/bindings/serial/amlogic,meson-uart.yaml          | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
index 7822705ad16c..3d9d51389171 100644
--- a/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/amlogic,meson-uart.yaml
@@ -29,6 +29,7 @@ properties:
               - amlogic,meson8-uart
               - amlogic,meson8b-uart
               - amlogic,meson-gx-uart
+              - amlogic,meson-g12a-uart
               - amlogic,meson-s4-uart
           - const: amlogic,meson-ao-uart
       - description: Everything-Else power domain UART controller
@@ -37,6 +38,7 @@ properties:
           - amlogic,meson8-uart
           - amlogic,meson8b-uart
           - amlogic,meson-gx-uart
+          - amlogic,meson-g12a-uart
           - amlogic,meson-s4-uart
 
   reg:
-- 
2.39.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
