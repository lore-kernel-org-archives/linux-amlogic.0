Return-Path: <SRS0=dgHW=K3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB901C47080
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Jun 2021 14:18:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86333613AE
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Jun 2021 14:18:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86333613AE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=li+4sZNpfazErq4wroBj4nFRupxitaBmPu02CDKqK24=; b=jGIFax91JRtwEs
	fowHqXzvCCLMlbkZCIdAL5+1Zkt41e9sgJUGjHrH+j66h/0igBUMTmhWXOzccySi89idci0LLzJTw
	9SwRrQYWxrWyD+RpMXw3+JgUQpM+tuEkjVzdbn62nG8MHz7pfmFVlOc09iEusDEzqORmmWIhoarUk
	uZ2W2+2o3ZYRi5GkL3lfKHqLVxEV7YBYHBfGiBzAPZoInfDZn1008+nofpvrIXLsS9RwfLdyjqwmK
	Qm3EowpldSf50R87J/O2mIZSSwaA5SO5Ay3v9hFKb2lNrXL3SAkFcNJgPPFjAiSpnzaa4iKU+sOzp
	1aktpmdjXrSFELRov0fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lo5DN-00GxW3-SA; Tue, 01 Jun 2021 14:17:53 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lo5DL-00GxVe-US
 for linux-amlogic@lists.infradead.org; Tue, 01 Jun 2021 14:17:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pYuoXpehqLzyZ3pH+QsdnfFqkhLiBGCB8wzijudRl7I=; b=Hboa5vFvlz19kz9IvLQ269gM2
 VQ5ISmnouMfMM1Fyj7MZfwXqcc0OAflXlHKeT4YzBBEQRa/j7zEAJ0gRQqI/xkQrWbQGBEt1Dt866
 488ivUswZBJKDkAT82fv1nPsRymZJok+PaKwxE2/9z9DRIcu6nFr4bqsgilZEXTG725naCMYzTHc2
 npHRsKV3i5QFKL4cJ5xqBQ65ZXGX34dlbwXf+Y3nZG68DPrXpIrrfIvuPRlcSPNRJQmoqlv8wCzgX
 Q0VWXyEclQWHD4wzGQTlUq+y/QouMLVuzHZMLVNL6saOxLA0gDpq56IrBY/SIiSPF+2gZ1PHr2FI2
 x/1HJKkvw==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:44580)
 by pandora.armlinux.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <linux@armlinux.org.uk>)
 id 1lo5DC-0004C2-Ft; Tue, 01 Jun 2021 15:17:42 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1lo5D9-0000C2-0m; Tue, 01 Jun 2021 15:17:39 +0100
Date: Tue, 1 Jun 2021 15:17:38 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Zheng Yongjun <zhengyongjun3@huawei.com>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, davem@davemloft.net,
 kuba@kernel.org, rjui@broadcom.com, sbranden@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, narmstrong@baylibre.com,
 khilman@baylibre.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 opendmb@gmail.com, f.fainelli@gmail.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com
Subject: Re: [PATCH net-next] net: mdio: Fix spelling mistakes
Message-ID: <20210601141738.GA30436@shell.armlinux.org.uk>
References: <20210601141859.4131776-1-zhengyongjun3@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210601141859.4131776-1-zhengyongjun3@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210601_071752_001740_A27BC9F9 
X-CRM114-Status: UNSURE (   7.16  )
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

On Tue, Jun 01, 2021 at 10:18:59PM +0800, Zheng Yongjun wrote:
> informations  ==> information
> typicaly  ==> typically
> derrive  ==> derive
> eventhough  ==> even though

If you're doing this, then please also change "hz" to "Hz". The unit of
frequency is the latter, not the former. Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
