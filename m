Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4287DC38142
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Jan 2023 14:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dU+V3bFukXjJgSAuNCdjzPYIoRlweNX8As4we1S5b/M=; b=cOOSWs2WXt+j6w
	/ZjI1JwYtfZS5SqLy7tmWHBmtS67P0GSTwSAfhvGZsCS9Br11cIrlpfkP1J6zY0HxDW0S5ykP/3IK
	lrUxpbxQ0WUGPgyK6Pg3jj72iGCXAVkzEo2D28xrxVvyQUDy03dtYitUmne5vIMr/PK5Vzq5ZgCIk
	dtc+krKa3XFYic0JFrhnLTzxjRnqKIAkDDkFMdMbIQMqt2ma2stuHqzHNs/6PsB4HHR1v3rzvz8cx
	6OFSAmVJ3ga8UDq6zsB9I4IRtb/pQhN7yXW5BjJ87i0BZU2eb9ts1ajgp1v/qjrm+lqbgV6KouSBS
	XX0/1bdgKxCapr5XO8ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLPdL-00FGFO-7c; Fri, 27 Jan 2023 14:23:15 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLPch-00FFvb-JN; Fri, 27 Jan 2023 14:22:36 +0000
Received: by mail-wr1-x42e.google.com with SMTP id r2so5107133wrv.7;
        Fri, 27 Jan 2023 06:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vP+rhIH9mNOkOjcXJ9CVHf6dwRVakHxg9jm1BkBlrsk=;
        b=Ax+WWrbJ9jIuxe1ElYzKFHmskU0zGhoJboqcMGFcRAgF7IuHudLGDukdYgE3cW8PVm
         1+D5guEUUA6sqWmlJ8UDSwDLbo1ViQQ91OttDP7nhOedE5aH9YHYfOGFro9GILKerVqU
         g3ox0nL8gMz9t6PqzYW95i0ZyioLFZe/AZndRUuZJP8qfvXLE34DcWrioc+31MutOWLQ
         KNk4uroTiOovFuLTYvGKCnVsDIYDavd+LhJFvOob/DphJRIO0Ly4l3gh8dhEpWthuFYD
         cEoXCTmPtsn4WG1Lv7FcJXKgATEnmJetMikiHKUNw7h/oQjahKJTS5KLWKukqKNpyfV7
         unTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vP+rhIH9mNOkOjcXJ9CVHf6dwRVakHxg9jm1BkBlrsk=;
        b=K6OmHTN3HFgXRajFhfRFtJp4x1cYaVam77u2EEdM2e4P1Gaii3FPGDaBEsXguEmYYz
         1X5N0uzKFx4tXZX8TnT4YxOI8TcBHOQQeLDRDKr3ON3sWXPXrGGI125Ly9P5RvGha6ms
         eObONesnkJ2UL/fkrEt1CWpFur3hdBh132SbSQulHYIBRQw5bp0k0EqTwL1DT84zUYn2
         AQqaEUYPGFzD4FwENw2PhUYr88XGW7TtZX75Hn2hx7UT29ILnQHXQ1POqX7G5+R6WlL9
         LML+qgsNfxjq8yvHj7QU9yUK8VWOM6CfnlTBKseNlyV7QMSlXnkLichCxltuLEjJQwp8
         RZ4Q==
X-Gm-Message-State: AFqh2kr9UH0dCzb1VZDFiPjanPcW/PklLplKKEntupSASj4fUqf++GBZ
	r9VXz4pbnbDmDaPGFmUV4B26NGuprLT3FQ==
X-Google-Smtp-Source: AMrXdXsef18V9RoF1zoMane1QGci9nSqkakcINjFi5UsiBoFE4hvVo3/UpKvBXXVkitmcqc90kUlrA==
X-Received: by 2002:a05:6000:1e04:b0:2bd:e8c2:c9bc with SMTP id bj4-20020a0560001e0400b002bde8c2c9bcmr34979943wrb.42.1674829351706;
        Fri, 27 Jan 2023 06:22:31 -0800 (PST)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id c11-20020adfa30b000000b002bfb5ebf8cfsm4301039wrb.21.2023.01.27.06.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 06:22:31 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/5] arm64: dts: meson: bananapi-m5: remove redundant status from sound node
Date: Fri, 27 Jan 2023 14:22:18 +0000
Message-Id: <20230127142221.3718184-3-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230127142221.3718184-1-christianshewitt@gmail.com>
References: <20230127142221.3718184-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_062235_660360_EEF2301E 
X-CRM114-Status: UNSURE (   8.76  )
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

The sound device is enabled by default so remove the redundant status.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts
index 3c1267a7ffef..86f0afe6491e 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts
@@ -233,7 +233,6 @@ sound {
 		assigned-clock-rates = <294912000>,
 				       <270950400>,
 				       <393216000>;
-		status = "okay";
 
 		dai-link-0 {
 			sound-dai = <&frddr_a>;
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
