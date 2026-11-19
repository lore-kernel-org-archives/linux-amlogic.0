Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D5560A260F
	for <linux-amlogic@archiver.kernel.org>; Thu, 19 Nov 2026 10:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hyjfQmbU;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Dy0I3WJF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8L1rVdoT4dwLC/rZW6Cs7C8j07/KdYUzyexurDaNR0g=; b=hyjfQmbUVtxilPk8L/nfMjTVKA
	zKPEWoC6S+YH9etGD8Mlwqveh2yG10rKqeopqAQTtY/PsRAg6nUBJY2ssDhv0SS8PtL8ZXMDnTh62
	HcIFrJhs32uxaXWSgkddnQcHVDJ1xssR/9BvlnUTFEIA5sb52vftCfLGnkXOxwYBg/ZDK6JXZjoT9
	8tSeqOvQ7rnmH5vAr8sb0IXtcwlj+p2INQ35hL8zRsM9fBJxoWVFf9QM/0Mrgs+qAkYJxU6RDal04
	WlQCUkco1ULFa3vPApYIc9hR6Dn1JJIqVhNaZH4eBhwXksrjs8s3Z3X087jkOaFPJoaeyLOVJIeKB
	5ZVtpMVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTzaW-0000000Bac0-3EvT;
	Thu, 19 Nov 2026 10:41:56 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTzaT-0000000BaaC-33CQ
	for linux-amlogic@lists.infradead.org;
	Thu, 19 Nov 2026 10:41:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795084912;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h5gnvDpKTbCpj4T8Sh/mh+pY79fspdBewFbkHfm2FeQ=;
	b=Dy0I3WJFRfP/F6ndjejx8nSGhPn3vVSu4ji5XFkg1JSta9WtmtiUhEJF0dhhfwUlrxXeLW
	L/Xq1TA/Dqip97eZOcK3RWWZWk7/0DDlmRudy6HNaa5A72j0sN+HWHn5Gb8AX+RSzCZL2l
	dkSw2trK/B8ycw9rn/uZQHS3vqGtHCc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-MNiwjwogNliXpB55PS2upg-1; Thu, 19 Nov 2026 05:41:49 -0500
X-MC-Unique: MNiwjwogNliXpB55PS2upg-1
X-Mimecast-MFC-AGG-ID: MNiwjwogNliXpB55PS2upg_1795084908
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48e0ef019a4so1611132f8f.3
        for <linux-amlogic@lists.infradead.org>; Thu, 19 Nov 2026 02:41:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795084908; x=1795689708;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h5gnvDpKTbCpj4T8Sh/mh+pY79fspdBewFbkHfm2FeQ=;
        b=kxJvduiONPvHlLeFCtUWfbIXhla7RVPxP/I5Ndb7iMi0e268ox0B1z2qKOxUwz5x2M
         Ql3c1n+Y/LjS+d0UqpjiHAtlpJAg1lX34l3kqOrJgvRgJ2EoMn+msTwNfrZyPLYW+XeR
         z+y0ayHnjDcpxw26gqS5tAUxxD59e5rqJUuBJ/zjXHAem5E5ZmHCav+h1RDwRm6xRyXZ
         7tYVZM+B2EVIlKNVpVaz32jGBDsGQ8x5Rw4lZ9poW0mbDVKsqa/ldXXPQT/1NagAS8/S
         mOJpW9PBzMMkd6rT9IJ9REww/HLachgjX6Nj/O3ptK7vAF+oQi0iAns6+hCbOup8XkNK
         UvyQ==
X-Forwarded-Encrypted: i=1; AL+hErEmVdYyhrKlcSOk7nNkc9TICnlLmOrlyITebfH1J8Bp/ZLroBj9/qvLAcmUNRlYG94D5FA7YLGt35U1dXOF@lists.infradead.org
X-Gm-Message-State: APuU4Z/MS3pvyE65Z8ow+L3taRI8nHynuN2u2kvrZjv8QhyDlQeGyj3i
	2s1wsrnLp8FTxq8pvGA2FTtitf7hJ31b9XyzCN5UW1BKPumQBoIzHsqpWEeUfL1ywAhCSd/QzVy
	YULcFXrRRFKG8BrJHvCRfH1RkuQxEvY+t/cia2fLHb54rPlDrqw7Uwegm2NH/kHhFa8IJKUjD
X-Gm-Gg: AZFdTZf3N3cHMjU9hgFM1B6r/RQu/M/y53gQgQD+rw/+clml9M5hsmadOQF0HP2bd8s
	NbZbkND956fGdnob9wP9FieWqFNOjTe+/2nmNwB5u6hHku7gVxgza2I4Ycn8DE7s2CSks2SsrUR
	ok+61OlonovyUI5W2XeUCKF/17XbS5CX8GhSd5gqbywpTfuPOQjeU+fU+J7tTO6Iv+3jtD1elxI
	lSoZqNykSfyXzMGvL5K0fvWCajvjEsx+RCQyQ7ZQ7M7Pa3CilXb2636UHlhBsYy+cpBI7jGyvuh
	9NF150x9J/l8r6oPmWzCCbOKed2ZZegw7+aPCBcwvgHQzxBOax10G5jCSx+dYQjJFbwIAile0GL
	OVfIL0CSVPfb6CgJLO045LRwX43+ewLHxIPplmTZchtgAH52J4CjQ08ZkmMynmSZG//B6HfaU36
	gmOEFwj0aOBIHF2RJDd/fg6AnHtQVogsE6glNNYGhtBjJp
X-Received: by 2002:a05:6000:4908:b0:4a6:9f2f:414b with SMTP id ffacd0b85a97d-4a69f2f4192mr10315981f8f.32.1795084908179;
        Thu, 19 Nov 2026 02:41:48 -0800 (PST)
X-Received: by 2002:a05:6000:4908:b0:4a6:9f2f:414b with SMTP id ffacd0b85a97d-4a69f2f4192mr10315924f8f.32.1795084907691;
        Thu, 19 Nov 2026 02:41:47 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a656a28b8esm10196704f8f.50.2026.11.19.02.41.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 02:41:47 -0800 (PST)
Message-ID: <44ea3f0a-f992-4101-9cfc-bec1ebf6a3c3@redhat.com>
Date: Thu, 19 Nov 2026 11:41:45 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: mdio: mux-meson-g12a: keep the MAC data path
 when switching MDIO
To: Igor Velkov <iav@iav.lv>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261115-g12a-mux-data-path-v1-1-011dad738698@iav.lv>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261115-g12a-mux-data-path-v1-1-011dad738698@iav.lv>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IXjAS-Qyl8Mnld9d6aLCPFzlrWqczgnozVWh14Z_oqI_1795084908
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_024153_835511_75751D5A 
X-CRM114-Status: GOOD (  11.66  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/15/26 20:22, Igor Velkov wrote:
> Switching the mux to the internal MDIO bus writes SMI_SRC_MAC together
> with USE_INTERNAL and RX_CLK_EPHY to ETH_PHY_CNTL2. The last two move the
> MAC data path and RX clock to the internal PHY. On boards whose MAC uses
> an external PHY, any access to the internal PHY stops reception until an
> access to the external bus switches the mux back.
> 
> phylib suspends and resumes the unattached internal PHY across system
> sleep. stmmac sets mac_managed_pm, and with Wake-on-LAN in the MAC
> phylink_resume() does not start the external PHY, so nothing switches
> the mux back. On ODROID-HC4 (RTL8211F), after suspend-to-RAM with WoL in
> the MAC and an RTC wakeup, ETH_PHY_CNTL2 stays at 0x260 and the MAC
> receives nothing while TX works.
> 
> With the MAC on the external PHY, SMI_SRC_MAC alone is enough to read
> the internal PHY ID (0x0180/0x3301) while RX keeps running; adding
> USE_INTERNAL or RX_CLK_EPHY stops RX.
> 
> Set the data path bits only when the MAC's phy-handle names a PHY on
> the internal bus. As in dwmac-rk, which reads phy-is-integrated from
> that node, the node phy-handle names decides; here it is the mux bus
> the PHY sits on.
> 
> Fixes: 7090425104db ("net: phy: add amlogic g12a mdio mux support")
> Signed-off-by: Igor Velkov <iav@iav.lv>
Not that this 'broken since introduction' H/W setup does not qualify
anymore as 'net' material. I'm applying this to 'net-next'

/P


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
