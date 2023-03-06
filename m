Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 717A1C678D4
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Mar 2023 12:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MPgvMwunJmpdYxdXJeqVyH5Qs9OZAk45rdd0hs6mG/Q=; b=xVo1FoAGNaQE6D
	iaFPgw2Al1TS0hbiOjNyagg7DlkWbJ+3crbyGxHOxXtNRaIDT+yBeUkNBQImkAlzlIjWL1oNjNBrZ
	/gFb7VEz5W54hMZnJdCBqEBfzWw7aWGX2ohOpuk2jt+es6n4Ixeagvsv5/yBp1nsjIangDf3OzFx8
	zHZYvf7t4rlf8cb9rORQSDsLsU8zlpFLe+6HGkJu5QREXLtaQ5NuEaXOoTXCBEQVRSckpaMzbDpjv
	peJIY0GKdxwT5IXjO3ysKbsYQ+QifK/VVDKUNGU0stT6uheW0VLaj1nYxAXUEzSBKBq+sj2SbJLgT
	RhR0L1UKEXJ0gfMJo/YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ9jE-00CdV1-Bo; Mon, 06 Mar 2023 12:14:08 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ9j3-00CdRY-Ts; Mon, 06 Mar 2023 12:13:59 +0000
Received: by mail-wm1-x32d.google.com with SMTP id c18so5492073wmr.3;
        Mon, 06 Mar 2023 04:13:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678104836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZT9y+F3nAx8M1+hkZjVAuy8akn4IL3WwNtD6c7JLnj8=;
        b=SOssMskgVOFHRRzz+EZDrSBhxRu46Q/D0JnfzQQY/JmmuNWbIBYI6amj6hG0jL6EGD
         uwmLw9HYjQAH8biJqv4XaMfB35k0i8uz+wd0LzTpeDL+aXchHssuBv0QhyRnl7kCVBuR
         ZHY9oPKG5ZQs5/UHAbPvpvN2wlOZYZxA9k/7qr/JdV92vD/nUAEc0hb+u983/b9X8nTI
         n07BYY+DWweJ3MerFY9w7zevne2hIGdnFr3OULfJzk4DG+TWSzK9mgNpXvOhMNsdtS82
         hL8WnROhHlPDTu2KSLTNFyxL38gvcolMbi7fXL+DzN4vFIqN9QdmYLIYYGSGT8G/aHNv
         nFdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678104836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZT9y+F3nAx8M1+hkZjVAuy8akn4IL3WwNtD6c7JLnj8=;
        b=tcxmFZgPfH1I70NaHvC6II9OwWjMrhu6WYmck0XQZK8Eu0YAHGYBwFHVtjG8Oc2F1N
         S2rCzzx+4LzsNUdI4gtNqftaByBrGkUYWwG0GizcBIzIHM0H2Hs7eObzr94sn60hJWRj
         5Gb6Spjcuq+KKp+g4I0IHEcNL9iUI7PQE/EPcYCk0ev2LFXDtPGLAwI7eUB2xHehM9hw
         /bgEb+DpXD0QUhw2q3awI4yofr8/WOPQBBQx3Y8HwuTSSpU4bGOHz7Hdwaz2T0ANGV+3
         aqALtczw1mD2T42zqTBnIzwQENb5OUg+ze8KmT3GSmpX/m+O4jTNR6a/VHXKBJqHgKsv
         CxYQ==
X-Gm-Message-State: AO0yUKUzLzeZl5Gr6R7gRN6qKxTBHZ0F3ek69PbTJcyPsdISR8Hnbzyh
	Tfne+tQ/+sp7s9XlWz1OP/c=
X-Google-Smtp-Source: AK7set9dFzn2lm4BCjjz5GEIMiJre2zEgf/nPRpL7Z+sxuK83NltFVE2upco+0CsgkMyJdZjXRA/Jw==
X-Received: by 2002:a05:600c:4509:b0:3eb:29fe:7343 with SMTP id t9-20020a05600c450900b003eb29fe7343mr8812408wmo.33.1678104835886;
        Mon, 06 Mar 2023 04:13:55 -0800 (PST)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id n10-20020a5d660a000000b002c70ce264bfsm9814798wru.76.2023.03.06.04.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 04:13:55 -0800 (PST)
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
Subject: [PATCH v3 0/3] arm64: dts: meson: gxbb-kii-pro: device-tree updates
Date: Mon,  6 Mar 2023 12:13:48 +0000
Message-Id: <20230306121351.1606360-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_041358_001935_A8A32C45 
X-CRM114-Status: UNSURE (   7.98  )
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

First we sort nodes in the current dts and remove some blank lines. Then we
add the remaining bits needed for Bluetooth to work. And finally we add the
AIU audio card to have HDMI and S/PDIF audio output.

Changes since v2:
- Rebase on linux-amlogic/for-next

Changes since v1:
- Add reviews from Neil
- Drop unneded 'okay' from audio patch

Christian Hewitt (3):
  arm64: dts: meson: gxbb-kii-pro: sort and tidy the dts
  arm64: dts: meson: gxbb-kii-pro: complete the bluetooth node
  arm64: dts: meson: gxbb-kii-pro: add initial audio support

 .../boot/dts/amlogic/meson-gxbb-kii-pro.dts   | 82 ++++++++++++++++---
 1 file changed, 71 insertions(+), 11 deletions(-)

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
