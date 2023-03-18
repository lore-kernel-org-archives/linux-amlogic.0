Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39B0FC74A5B
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Mar 2023 20:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+sVkDtZstxqVLW5YRQwGgdOA2cohUVk2X8H7rX2SrzE=; b=TjjzyD2BZaWefv
	ulreu/hN+zyhApQlI45b+imJDxyHasA6HEIe7mTi6F/20F2OdDtnnmltJIF/AmK5LSdosWTskh+rv
	dK+wjS+rysWVkVnHIwxZa5KbLMopiQQynFAMsj5veA2slb/IaRj3YcC09rkZYto/saVknThIHb9RD
	TmgTr3T1Les532C9RDT8tcG79yJ/MUtzTK9MEFhkDqwn8iasugPLgsK34qY0Ayr+C+lqJPKdapPCc
	FIVzeCvX7xpJuANJikaFkHY9IeVFMfDsnT+rxS5OmFpMO/53vLVhGbD6z9HjX6tpujQYM9Ksb9Nlh
	UOjgxCLIQmc/i5UlGDRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pddBw-005LoB-1J;
	Sat, 18 Mar 2023 20:30:16 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pddBt-005LmU-1o;
	Sat, 18 Mar 2023 20:30:14 +0000
Received: by mail-ed1-x534.google.com with SMTP id h8so32854286ede.8;
        Sat, 18 Mar 2023 13:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679171407;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IoJ8JNTe6wgzO9Cu9r3XRL6EXOxlsCLor10dstEGt+M=;
        b=g40b3H0zZRAvEDmN5gsozoaCZe0pVY4ujMUgn3wY3DyQEOiSq+vLjbllc5GdtmBTFA
         MZsS3K3shYab31Arp5ZYn4DA0annOnjFXni8CTSdVf/nU1oWb1z0x9LfF3o2JxHC6Qpv
         1IfpzXMSyNIp12BQGEu61tKLwNqbdfmlcdTDOCHzlqVpND6baRMTsNHodiskrOE9bM07
         kBwR/HMK8/nVTe16Cz0oETvhhVygtHAXploBmLpGE86bn+I/wC+x5F2tEx8zi5tlxg0k
         WRSW7+shSNFtFLxp4em2qpha18akYK3yjKSmF/51wX9BCYYzG/iv60oNnE3k8/w4e9kT
         IrHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679171407;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IoJ8JNTe6wgzO9Cu9r3XRL6EXOxlsCLor10dstEGt+M=;
        b=Fp6vmGFDE40RzEq7K76dIT9uBmwJGn1gxB0ejt4dFmpGmGWvb96rUMDMlJq2JQJzPP
         qz1vH6hi5ND1ubtU/bAwY5YkKlR9gHStY6VcGe/4HCGa1JhMUnaicS6fvEPIbxitC0O8
         rmC8cNgqPSRDxUIHhQlFcmvdMD8BOuormw5e3nKFjZZQ8rRfltIH2XTDxExaXvzhvEnx
         YE8x8cB6QabqVxuYcPkYsvF9PE+02G+/HS6kxjA/gy5SDHZgdECYPlSSvIiT7Hs2PlDG
         NPupyuhiRcz5u/3b5UdX4jk72mHTk0DaKDvtfPgVXhrFZQo8aymvxWZtgWk3Wq3iKVBW
         oGAw==
X-Gm-Message-State: AO0yUKUcHkiXnApkBdRUl9DoaVWoBufCaCA05/5ZKoTN9Vi0BZxFW7UU
	zAXUREmUmueeOTUNAXe9Pio=
X-Google-Smtp-Source: AK7set8mzwG6ka99OP8sVaSJIO9h9mx6jh7tIi2qCJ2AQYcsP0HbNRYMiw2o2YIYLWA+0Cv4dLCPEg==
X-Received: by 2002:a17:907:b9d0:b0:88a:2e57:9813 with SMTP id xa16-20020a170907b9d000b0088a2e579813mr4915106ejc.33.1679171407449;
        Sat, 18 Mar 2023 13:30:07 -0700 (PDT)
Received: from ?IPV6:2a01:c23:c073:a00:b51a:ddab:12c0:b88a? (dynamic-2a01-0c23-c073-0a00-b51a-ddab-12c0-b88a.c23.pool.telefonica.de. [2a01:c23:c073:a00:b51a:ddab:12c0:b88a])
        by smtp.googlemail.com with ESMTPSA id j30-20020a508a9e000000b004af5968cb3bsm2734039edj.17.2023.03.18.13.30.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Mar 2023 13:30:06 -0700 (PDT)
Message-ID: <683422c6-c1e1-90b9-59ed-75d0f264f354@gmail.com>
Date: Sat, 18 Mar 2023 21:30:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Russell King - ARM Linux <linux@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Chris Healy <cphealy@gmail.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH net-next 0/2] net: phy: reuse SMSC PHY driver functionality in
 the meson-gxl PHY driver
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230318_133013_621561_8B013C58 
X-CRM114-Status: UNSURE (   7.83  )
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

The Amlogic Meson internal PHY's have the same register layout as
certain SMSC PHY's (also for non-c22-standard registers). This seems
to be more than just coincidence. Apparently they also need the same
workaround for EDPD mode (energy detect power down). Therefore let's
reuse SMSC PHY driver functionality in the meson-gxl PHY driver.

Heiner Kallweit (2):
  net: phy: smsc: export functions for use by meson-gxl PHY driver
  net: phy: meson-gxl: reuse functionality of the SMSC PHY driver

 drivers/net/phy/Kconfig     |  1 +
 drivers/net/phy/meson-gxl.c | 77 ++++---------------------------------
 drivers/net/phy/smsc.c      | 20 ++++++----
 include/linux/smscphy.h     |  6 +++
 4 files changed, 28 insertions(+), 76 deletions(-)

-- 
2.39.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
