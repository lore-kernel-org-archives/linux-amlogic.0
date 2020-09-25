Return-Path: <SRS0=7OpP=DC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA0BEC4727E
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Sep 2020 22:14:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CC5E2076D
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Sep 2020 22:14:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BcblOcBS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2CC5E2076D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HOK0T1po5/n0qz9pgr5fl4GqoFTyXtSqhjCBGFYdl8A=; b=BcblOcBS6YscBmLPIbCwggR7G
	xFpYYmtSE3XPrgKt9DejaCgKyrHRteXq2WoL9+/YmTLVwjj+n4lFytWaQNjX+WNTqbDEB2ue2RcQ0
	09n1nxoF0Y3Qt6/vS6cNPmH2xcGHd4z9vdsvZh+QYpin55zZ4n2qHNfDM6IryvWeLBnUpl9AJHQRx
	XbqgOjTschquSvxVR/hkVay3vjWXVRFz20zYQlg+YGhBixYLyuRnCN+YegVFdJMaXP6U1+WXBoerL
	/w/JDMWpSN9+f9lOi5iBsn+oK6ZCb9QyQsR3kYPIpC+l4mDzyMLwKwF/4An5ragUfteBRw3XyivIY
	jK/VVAGAA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLvz1-0000tD-9r; Fri, 25 Sep 2020 22:14:27 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLvyz-0000sn-B7; Fri, 25 Sep 2020 22:14:26 +0000
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
 (envelope-from <andrew@lunn.ch>)
 id 1kLvyd-00GDLd-Vn; Sat, 26 Sep 2020 00:14:03 +0200
Date: Sat, 26 Sep 2020 00:14:03 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: RGMII timing calibration (on 12nm Amlogic SoCs) - integration
 into dwmac-meson8b
Message-ID: <20200925221403.GE3856392@lunn.ch>
References: <CAFBinCATt4Hi9rigj52nMf3oygyFbnopZcsakGL=KyWnsjY3JA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFBinCATt4Hi9rigj52nMf3oygyFbnopZcsakGL=KyWnsjY3JA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_181425_390544_A1E62024 
X-CRM114-Status: GOOD (  13.31  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: alexandre.torgue@st.com, netdev@vger.kernel.org, peppe.cavallaro@st.com,
 linux@armlinux.org.uk, linux-kernel@vger.kernel.org, joabreu@synopsys.com,
 kuba@kernel.org, linux-amlogic@lists.infradead.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, Sep 25, 2020 at 11:47:18PM +0200, Martin Blumenstingl wrote:
> Hello,
> 
> Amlogic's 12nm SoC generation requires some RGMII timing calibration
> within the Ethernet controller glue registers.
> This calibration is only needed for the RGMII modes, not for the
> (internal) RMII PHY.
> With "incorrect" calibration settings Ethernet speeds up to 100Mbit/s
> will still work fine, but no data is flowing on 1Gbit/s connections
> (similar to when RX or TX delay settings are incorrect).

Hi Martin

Is this trying to detect the correct RGMII interface mode:
        PHY_INTERFACE_MODE_RGMII,
        PHY_INTERFACE_MODE_RGMII_ID,
        PHY_INTERFACE_MODE_RGMII_RXID,
        PHY_INTERFACE_MODE_RGMII_TXID,

In general, we recommend the MAC does not insert any delay, we leave
it up to the PHY. In DT, you then set the correct phy-mode value,
which gets passed to the PHY when the MAC calls the connect function.

Is there any documentation as to what the calibration values mean?  I
would just hard code it to whatever means 0uS delay, and be done. The
only time the MAC needs to add delays is when the PHY is not capable
of doing it, and generally, they all are.

      Andrew

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
