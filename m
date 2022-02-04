Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98607C433EF
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Feb 2022 08:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O5JmqCJR+utb5YkNr5J55SVFXDz+Rer9hlLbpwZa2CA=; b=i+/IkEcr/UlkLx
	tYIHAc/yUvl3ydgtkBw32i3XBS8+r6av3KwBd9iKW9HMXrPuiL4AKwVhE9cuOecQMkfeJBM9f3ZHB
	J63wUHHPEGoyT45pwdiHPr9GLRkcRa6P0ivQFp8NAsUW7tz+LGDkBzE+pHMla+0qQt6c3DukvkQFg
	Ce3RmOr4+pxT1BNw2MEcVxGGQAK93rHVDzmWJlFJKT9RVZkm2u4zj0Xf8648VKdkI0KCKGUXN1TqD
	ie+nDitZwdTGhclC78fWawRfQaTeEQthlHN9QoNx13AHdvOyV3UeCPfbk9dTETDo7xBPjof8pUdkT
	YJ0otPxzL+/E/VfZVo1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFttb-003lkf-Cv; Fri, 04 Feb 2022 08:24:43 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFtsO-003l7a-QY
 for linux-amlogic@lists.infradead.org; Fri, 04 Feb 2022 08:23:30 +0000
Received: by mail-wr1-x436.google.com with SMTP id e8so9918463wrc.0
 for <linux-amlogic@lists.infradead.org>; Fri, 04 Feb 2022 00:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5sGeK/3zIULY8mcUjDAoeUp8Am4Py5KjMfukZVtUtCg=;
 b=pP00aNBpNz0gqLq912D3FrsDyohDLxSUiXYbYFE4lZ1cSAZ4shhM1VcOQmN15WBoea
 hhUz1GNzPPr+aK3uLKPtnQLvemCoLLMlFtDR1CzXxYp8IPW+mDINij/MTfOE/kz1cEpa
 FUfTY26snSJmrmrJAlxc22I0SAisBfj/yKLbsI6ptSHp5yJseYpUqCQzCQhuhFEv/dds
 3ynQR/O+ss5vAVN8MCdCAmgGnsgYIRy6sJ/wyLU1AlwjTsgyI925bkQ/oDMBrJ11WVMF
 x8Pz/EguTvvNo8EX150qG+q7hoqjftvpFRrXa0nQWiindCAO4m98CJz0wKBk4XL6iEKM
 oHfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5sGeK/3zIULY8mcUjDAoeUp8Am4Py5KjMfukZVtUtCg=;
 b=gItRlnbcyMySAv/Nv2ukQ+f+0Ny7DpwNdWLWaydeVIgUVEgpc/3pihFlo48MTJAy/x
 ocZANku7dGgylhEqMpSv+fdRNNWLsQJTL35ATiXbQ6ew8ChITUrERdb3zqQouBl5Mk0D
 haMrE+ieBempvyqnSBJ4WceoFy1UMKPOw9utQfPXe73d/brdJn3ON99BP4OtONh7QfCY
 2Nlh9SesBxCfZDKBS3zsLIK76euPjQEZmQgiQPcofBrveLP7H3BfGbPVu6m/Aa5coYaX
 o5nOc2GYO/gqU6YW6SG+MjI2vWdwn6q3uf1ZqE5msBlp3qQI1yOhxG+zpSDzKv7W8h2q
 vRNQ==
X-Gm-Message-State: AOAM530Bwr24kUgwmZCep9re5jEkIaI3SVX3Xc02zSyvBkqlxihNJfsQ
 sdfkOufJ0Wy63WzekNXUWTruhA==
X-Google-Smtp-Source: ABdhPJzDgLZ/qsNCJ+CQOK6adccIlj7kJfzAaz2V1xc/90+Lr/5d8ENCieD5JUc72n7vL/wte3R1Cw==
X-Received: by 2002:adf:f905:: with SMTP id b5mr1472430wrr.173.1643963007029; 
 Fri, 04 Feb 2022 00:23:27 -0800 (PST)
Received: from localhost.localdomain ([2001:861:44c0:66c0:3fbe:ff10:110:739])
 by smtp.gmail.com with ESMTPSA id
 s22sm8914078wmj.38.2022.02.04.00.23.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Feb 2022 00:23:26 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>, Dongjin Kim <tobetter@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
Cc: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH] arm64: dts: meson-sm1-bananapi-m5: fix wrong GPIO domain
 for GPIOE_2
Date: Fri,  4 Feb 2022 09:23:18 +0100
Message-Id: <164396299209.31118.14326950420716778840.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220127151656.GA2419733@paju>
References: <20220127151656.GA2419733@paju>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220204_002328_910939_E3232019 
X-CRM114-Status: UNSURE (   8.45  )
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

Hi,

On Fri, 28 Jan 2022 00:16:56 +0900, Dongjin Kim wrote:
> GPIOE_2 is in AO domain and "<&gpio GPIOE_2 ...>" changes the state of
> TF_PWR_EN of 'FC8731' on BPI-M5
> 
> Fixes: 976e920183e4 ("arm64: dts: meson-sm1: add Banana PI BPI-M5 board dts")
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v5.17/fixes)

[1/1] arm64: dts: meson-sm1-bananapi-m5: fix wrong GPIO domain for GPIOE_2
      https://git.kernel.org/amlogic/c/a5be3e5d46f373fe1d2ee835c7ede31769c241cd

-- 
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
