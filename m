Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7546C433F5
	for <linux-amlogic@archiver.kernel.org>; Sat, 15 Jan 2022 10:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4b5QLt2S1KDSzkog+fRNq0PYEeN4FYg0XaXcLJpcnZU=; b=1KMpb2S0tEFLZy
	TbjU5dTYaHze9EdOa3APP2qUfSGvKoHwKjoeFFUi+ypfFqC4QNmDjWYUQ+h3aiJwAclO0kG16bjSd
	vTPN/93HYy4kMh/TkMctiOpORJAwjnQRq8wGkk/nYLpQk4n+lw+oGkz7R8qgE4ORbf5TSv1i9HYJ4
	SLsI/uy3QIDLMRq5+qisJBFjOfo+eTLHN4fi4T7HZas6LipxxdNO3OtO7Y8Gwyh8ePFjKWdCIjcWI
	vXAaRMh7LVBTLLoHox/jRlyN/pqjR8asrIoqLx5aCSH55ZBwvq/vRAQ07OFDvnyiqUfUl+yI7MWhB
	dDUQbhQ0UuOv7OYBHeOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8ft3-00AsU8-84; Sat, 15 Jan 2022 10:02:17 +0000
Received: from mout-p-202.mailbox.org ([2001:67c:2050::465:202])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8fsy-00AsTS-Fd
 for linux-amlogic@lists.infradead.org; Sat, 15 Jan 2022 10:02:14 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4JbYcL4zfnzQkj9;
 Sat, 15 Jan 2022 11:02:10 +0100 (CET)
X-Virus-Scanned: amavisd-new at heinlein-support.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1642240929;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5mV8JB5Mv7mEJpvXolPt6WJu8Thn285DJtkcJA/v4eE=;
 b=dPW5dsQd4H4YJsfnJTRoMTk4Qf036eLFC3oBfNGLV5odndoPRauRpZMCWzFpgpL2AmihV9
 yzUYt1YdEsUV523rvimtXoXj/TRmq/jmBa63evXU14WexRMGmYpLjmseTIXk7Va+Nq7rB+
 9ZZu3aqenCeV2q5t/of4YH/4l2X/ciAciTV45fSBbhXh3nZnLqxQCvBg0nYKZuRL6vIFS8
 S1Fg3iK+IZwtCsctNskHKzNRBrSm1tzkYMaxF182JIn6NQMMZSEMaPUOXjCn9vhgOys0pk
 6qmMllWTRYtxv4805g9Rez/qgDqB34c29irMQUlrlrRVnb+RQanYRVuvoF+9Ag==
From: Alexander Stein <alexander.stein@mailbox.org>
To: Stefan Agner <stefan@agner.ch>
Cc: narmstrong@baylibre.com, linux-amlogic@lists.infradead.org,
 linux-media@vger.kernel.org
Subject: Re: (EXT) HDMI CEC on ODROID-N2+
Date: Sat, 15 Jan 2022 11:02:04 +0100
Message-ID: <5560050.DvuYhMxLoT@kongar>
In-Reply-To: <d2ef8936c54567c9c2652b3c53a82f68@agner.ch>
References: <d2ef8936c54567c9c2652b3c53a82f68@agner.ch>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220115_020212_732702_DF0B76E5 
X-CRM114-Status: GOOD (  15.89  )
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

Hi Stefan,

Am Donnerstag, 13. Januar 2022, 15:36:38 CET schrieb Stefan Agner:
> Hi Neil,
> 
> I am trying to use HDMI CEC on ODROID-N2+ using Linux 5.10.91. However,
> I was unsuccessful: As far as I can tell cec-client uses the right
> device (I disabled CONFIG_DRM_DW_HDMI_CEC since my kernel is still
> missing your patch "drm/meson: dw-hdmi: disable DW-HDMI CEC
> sub-driver"). But communication won't work, and dmesg prints timeout
> messages:
> 
> [   68.831253] cec-meson_g12a_ao_cec: message ff 84 20 00 06 timed out
> [   71.134987] cec-meson_g12a_ao_cec: message ff 87 00 15 82 timed out
> [   73.438826] cec-meson_g12a_ao_cec: message f0 timed out
> [   75.742677] cec-meson_g12a_ao_cec: message f0 timed out
> [   78.046555] cec-meson_g12a_ao_cec: message f0 timed out
> [   80.350446] cec-meson_g12a_ao_cec: message f0 timed out
> [   82.654358] cec-meson_g12a_ao_cec: message 11 timed out
> [   84.958285] cec-meson_g12a_ao_cec: message 11 timed out
> [   87.262194] cec-meson_g12a_ao_cec: message 11 timed out
> [   89.566130] cec-meson_g12a_ao_cec: message 11 timed out
> 
> I did a quick test with CoreELEC which uses the 4.9 downstream kernel,
> CEC seems to work there. So it does not seem to be my hardware setup.
> 
> A quick test with the latest Linux 5.16 shows the same errors.
> 
> Do you happen to have an idea? Do you know if HDMI CEC using upstream
> kernels worked at one point on that particular platform?

I'm using Arch Linux on my ODROID-n2 (non-plus) and HDMI CEC works as 
expected.
Currently I'm running a 5.15.13-1-aarch64-ARCH kernel. AFAICS the mentioned 
patch is mainline since v5.14. I can see my TV without issues. I have to add 
that not every cable is suitable for HDMI CEC, I have one where CEC does not 
work (in general).

HTH
Alexander
------
$ cec-ctl --playback
$ cec-ctl -S
Driver Info:
        Driver Name                : meson-ao-cec-g12a
        Adapter Name               : meson_g12a_ao_cec
        Capabilities               : 0x0000011e
                Logical Addresses
                Transmit
                Passthrough
                Remote Control Support
                Connector Info
        Driver version             : 5.15.13
        Available Logical Addresses: 4
        DRM Connector Info         : card 1, connector 32
        Physical Address           : 1.0.0.0
        Logical Address Mask       : 0x0010
        CEC Version                : 2.0
        Vendor ID                  : 0x000c03 (HDMI)
        OSD Name                   : 'Playback'
        Logical Addresses          : 1 (Allow RC Passthrough)

          Logical Address          : 4 (Playback Device 1)
            Primary Device Type    : Playback
            Logical Address Type   : Playback
            All Device Types       : Playback
            RC TV Profile          : None
            Device Features        :
                None

        System Information for device 0 (TV) from device 4 (Playback Device 
1):
                CEC Version                : 1.4
                Physical Address           : 0.0.0.0
                Primary Device Type        : TV
                Vendor ID                  : 0x080046 (Sony)
                OSD Name                   : 'TV'
                Power Status               : Standby

        Topology:

            0.0.0.0: TV
                1.0.0.0: Playback Device 1




_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
