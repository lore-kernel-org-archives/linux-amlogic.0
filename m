Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FF31C05027
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Feb 2023 17:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+gCYHnTdQMS81nV1GhHgXmKSgYgFzS/oelJDsoVer54=; b=gyqQyMQFzFLih5
	0/jX+GXNcerkb9tFnnv/lop7dJkCs1d+eKQsNNH3vZIt7SWQ8lLt6JWD0HK5k0cKSRuDvpc1GRZyp
	6pgSc6vZgsbjw+G4UzuKhsvxs0omq8+smCR0IDJizMIyKxgz9Q3GcEv2kcESsv3lrtqIkDggRM/Rh
	pJUwchHqSeq0ME8UUJDDnFqwXovIMHY3M/h4NH5acG/bpPR0zJQpG8hZf8g1Ni4pcONa8G9b7qLhd
	5y/cfyYZ2ppM4N0H+rXKk5JFB9LY+tgsW+oZTz3nTRlAaLKwQizJ33yh3Spzg/qx5O67Iiu0G4dC8
	T0VzUnvWZm2bNiJt7UWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQWs7-006fiq-5v; Fri, 10 Feb 2023 17:07:39 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQWrw-006feH-1o; Fri, 10 Feb 2023 17:07:29 +0000
Received: by mail-wm1-x336.google.com with SMTP id bg26so4339350wmb.0;
        Fri, 10 Feb 2023 09:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xN769MyAqG+UwI1gs9zsgn//wHYrKGP6dIPoLYX1lbg=;
        b=ezlIwstR938P/WBu6L9tWuOgIKYTF++xSj7WmJEq7Cr2Ax6nPTtamhDVttKjR2UR57
         ZmYV7hdCM5Psuvu2kL/DFo7wl4JDTGY4i6ViW8CIbXZaTjqzKkKkUfa9Mh/TYn46eruN
         INrTvEKhK2Qzr9WsS3bEl1dFiuopDnF61lk7kFV3thvWxJ+v/P0poyPc9zfckpc/HnCB
         waQE2BeYrhnI10QZaNE2vqBBp2VFRLEg4IhMauIyLWTbdI3v3C1RngkNsHsXN5QBniej
         TpYxZXOB4SrUIVjYU1UYLwIMDOO4SirSOblmtBaN1dVfk4a3i+4r47wDBtb0hAK4Zajg
         o1UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xN769MyAqG+UwI1gs9zsgn//wHYrKGP6dIPoLYX1lbg=;
        b=WOqwuoCbc/xR19qCpgKylCd1ul40QXKS6TtDdAi6cIGZakimZihIKDvdBVsZfCHlL/
         5MDXcYqeqcEluhz4SrrpeVPM4vHIKRGrNpJYcu9IH0YoyVibY/FQpn5zI7J5LzzQLa0F
         h5PP4BhhQeYwnlzW15QuaqolhBZCBzC7zOkDQRIUit00j/dGx6PFLF1VCsTbD3oGRpSW
         G3KEP8U5EGOsDA8zboDRI0vO8IoO0fU271W5pUA2X+EX91Eu+92VYVmREN0t3u4WG0+e
         k0I9EGZxBV88FOas1thEDrrg194YnjLRtJo1i+0j9rZcT0dGmnSL+MPEcJ+FOMkfFI54
         Y0ww==
X-Gm-Message-State: AO0yUKUorfzDOXZUWlxqZu/2d0jqG/ZZidvhn5b1vOwMBCrflgSvBxT6
	u3Gr1LzVtuK7GU3QlaBPKMA=
X-Google-Smtp-Source: AK7set/nC7TK4tPu/NvrJILGJR+kXrudhwCL+65OWuVeFN63PFM2TOZJGa9uWcdc++5EFRn76GQzLQ==
X-Received: by 2002:a05:600c:43c4:b0:3dc:5302:ad9 with SMTP id f4-20020a05600c43c400b003dc53020ad9mr17283356wmn.27.1676048846445;
        Fri, 10 Feb 2023 09:07:26 -0800 (PST)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id x7-20020a05600c188700b003cffd3c3d6csm5351531wmp.12.2023.02.10.09.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 09:07:25 -0800 (PST)
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
Subject: [PATCH v2 0/3] arm64: dts: meson: gxbb-kii-pro: device-tree updates
Date: Fri, 10 Feb 2023 17:07:18 +0000
Message-Id: <20230210170721.1285914-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_090728_111777_8FF1F089 
X-CRM114-Status: UNSURE (   7.95  )
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

Changes since v1:

- Add reviews from Neil
- Drop unneded 'okay' from audio patch

Christian Hewitt (3):
  arm64: dts: meson: gxbb-kii-pro: sort and tidy the dts
  arm64: dts: meson: gxbb-kii-pro: complete the bluetooth node
  arm64: dts: meson: gxbb-kii-pro: add initial audio support

 .../boot/dts/amlogic/meson-gxbb-kii-pro.dts   | 83 ++++++++++++++++---
 1 file changed, 72 insertions(+), 11 deletions(-)

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
