Return-Path: <SRS0=Z0aL=OH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9E06C433EF
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Sep 2021 07:28:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CA2060F48
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Sep 2021 07:28:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9CA2060F48
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ki/2tU7tRy/6JMbyFOYlW21Fk4PaQLGZISoN5f2GKLQ=; b=Y0FND1ppRECKrS
	RiUDkICrzTt5ceBbADHSCpXV0BaPPc09xv/K44UP4LTZDYHXzVNJ46/OKa7VbiEeJFinKCipgvOkw
	IcvMONITXTc9Iax+KzmWL1dUyjCcJTYxIUU/Kw9+dPPlJWEl/G6RyQhjPJYv3VvPy35bTdANK8KsR
	ZJF7iKI1hZDTzJq/09kteLuI+vMR2LvdvEENe6HS4mnpuu7MdeRr6SwgO/LOpoYl0Kz54uIcuPVeQ
	LzvTBlaYrOOaMh+1X9H0EgYXkYFTYnjhuMBlI0DfO4Qcwaep+Sv7WJa7t8/KoPBF53LqwV1CR/rR7
	ToqcgbzrWrUm1++7ZRHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mR8I8-00DPg7-Kt; Fri, 17 Sep 2021 07:28:12 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mR8Hu-00DPcy-OG
 for linux-amlogic@lists.infradead.org; Fri, 17 Sep 2021 07:28:01 +0000
Received: by mail-wr1-x430.google.com with SMTP id w17so5396117wrv.10
 for <linux-amlogic@lists.infradead.org>; Fri, 17 Sep 2021 00:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yxTXBHJqU7RR9a49yqQjWpbG2NbNPVK/5PjCc/Yjeb8=;
 b=Qbk2KEturmAbJqgDKUYYrlSgYiyY3lGDetYhmrEK+NGbKMuJIuxfGqmYBW4w/YT/88
 ZtDCrIjDIIWXG3RoM7CBo0OB49876VpHXTTA6Ty12wDY/OhuHyLHU1lI8uvIpVLKJ06Y
 BjATW35xbrTCwHQ3ZKSyoLB/9DwY/5R0vIYYRFGw+LTTQNl3VWmP0uTxUsX6xxt2Zqp2
 DFflrYRBGLQ4GPP+ldEB+Hv5TAs9Uj7jvLMJ3zBvvO3g0eZiba48c/oMaK2h9OE5eixx
 awZhmfRJC6Mi16EWsNltIFhfsd4eOcfP1KMiB+WJ/WR5mPloUeDDcA03lDDhveExjnH2
 ZKjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yxTXBHJqU7RR9a49yqQjWpbG2NbNPVK/5PjCc/Yjeb8=;
 b=Qhi7YkhNNfFehDV992LqABtej8Yth6KELvi8uMxmzSauvNh7SAeCbkhS2FG+HcDx0n
 kC6qJt3KqDhZst9vF/Apdr58+Q9f82Girgrd5qO47eWeYrpMM8Y1iRA2bIZYlHlaFodd
 J2YOnYR6pEDPxxAnWYRxBUmsOJu1UCRf9UC41LIG1a2vyMkfAmMejAUfHPBc4VeeLhrb
 IaVC+Tb025m8wS9VQKLrTnPzSRtcJW64+qYydieeYP6fqwQ+PJV/03oR1mbgp+3q5t12
 jg869T/JXd2oQxcUtm6f+7id2VV/vf+ahWGL6z/sYmQ7yNEHXOHG/zU2F3dUWtg4VFOt
 BxTQ==
X-Gm-Message-State: AOAM533ROivCLzQgWsTfdiLDUp+eQFKU0MOq274O+7vCS2AazRZZhtEB
 hy6kwUU/plmBFCEh2dvouK6kZg==
X-Google-Smtp-Source: ABdhPJxkIQE8ZUfNFBVHAIoWL72FYkFUxDDXpV2GYzAp6lpUk9xvBeKN6+Jp9yTAX7/9u+HFkXAqqA==
X-Received: by 2002:adf:fd12:: with SMTP id e18mr10449923wrr.275.1631863675219; 
 Fri, 17 Sep 2021 00:27:55 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:7c8c:5a9b:1b6e:1623])
 by smtp.gmail.com with ESMTPSA id o2sm6500714wrh.13.2021.09.17.00.27.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 00:27:54 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: Vyacheslav Bocharov <adeep@lexina.in>, Kevin Hilman <khilman@baylibre.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 0/4] arm64: meson: add support for JetHub D1/H1
Date: Fri, 17 Sep 2021 09:27:52 +0200
Message-Id: <163186366690.1044811.10268335087144036716.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210915085715.1134940-1-adeep@lexina.in>
References: <20210915085715.1134940-1-adeep@lexina.in>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210917_002758_832036_99C77BB3 
X-CRM114-Status: UNSURE (   9.63  )
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

On Wed, 15 Sep 2021 11:57:11 +0300, Vyacheslav Bocharov wrote:
> Add support for new home automation devices.
> 
> JetHome Jethub D1 (http://jethome.ru/jethub-d1) is a home automation controller with the following features:
> - DIN Rail Mounting
> - Amlogic A113X (ARM Cortex-A53) quad-core up to 1.5GHz
> - no video out
> - 512Mb/1GB LPDDR4
> - 8/16GB eMMC flash
> - 1 x USB 2.0
> - 1 x 10/100Mbps ethernet
> - WiFi / Bluetooth AMPAK AP6255 (Broadcom BCM43455) IEEE 802.11a/b/g/n/ac, Bluetooth 4.2.
> - TI CC2538 + CC2592 Zigbee Wireless Module with up to 20dBm output power and Zigbee 3.0 support.
> - 2 x gpio LEDS
> - GPIO user Button
> - 1 x 1-Wire
> - 2 x RS-485
> - 4 x dry contact digital GPIO inputs
> - 3 x relay GPIO outputs
> - DC source with a voltage of 9 to 56 V / Passive POE
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v5.16/dt64)

[1/4] dt-bindings: arm: amlogic: add bindings for Jethub D1/H1
      https://git.kernel.org/amlogic/c/c649e25c0fcd53e0f1e83f710fefbda9d2809c32
[2/4] dt-bindings: vendor-prefixes: add jethome prefix
      https://git.kernel.org/amlogic/c/a1732cca0ed3d1ac2a256d16302c93443d636146
[3/4] arm64: dts: meson-gxl: add support for JetHub H1
      https://git.kernel.org/amlogic/c/abfaae24ecf3e7f00508b60fa05e2b6789b8f607
[4/4] arm64: dts: meson-axg: add support for JetHub D1
      https://git.kernel.org/amlogic/c/8e279fb2903990cc6296ec56b3b80b2f854b6c79

-- 
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
