Return-Path: <SRS0=7OpP=DC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94013C4727E
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Sep 2020 21:47:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2004B206D4
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Sep 2020 21:47:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kn30tyMz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="dyvxyyLU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2004B206D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:MIME-Version:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2OfrpKBBE2qrZQe0PWfh30OfMEk5Yru6UfAW/JEGtoI=; b=kn30tyMzdlEEUbjQcxBt09zFDi
	LmbZGsyi+h+WOve+7SnsvnRU7O4aZOUAl9PlShk/EJ8q43or+a4R6l3QVfgHUTO0s+mAjW7fLJVh8
	TU2pfu/iuMK5TOccM0bIbQ3z1WMz6pr1xpymYgFLzlL8mmizdGX4Go65C9f9gGaORI6cn7szVVvRS
	knHQeDR2wka+/NpbELDF/EJV13/jvDm5tCGq186ygbgsedqm+s90C8P/tj0oc5ZxRWTvoAkk+km/7
	ccuziykz3t40cwmS59aZOEZ4EUztmUnvX8neRZdQ/zwDb1zOUhVfIX9AKe8OdvagrV/hJkTSKqRHy
	5k7qevjA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLvYy-0006la-9b; Fri, 25 Sep 2020 21:47:32 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLvYw-0006kt-5r; Fri, 25 Sep 2020 21:47:31 +0000
Received: by mail-ej1-x636.google.com with SMTP id r7so567354ejs.11;
 Fri, 25 Sep 2020 14:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=LNXPPtSg3XU+Uc6GEQWdTQC/nAKU3Cd17KbO8jJq32o=;
 b=dyvxyyLUZsWO6fdd2JH0Q/fQmVb1Edha+4eI8lIYmoOjleAGTR+mVWKbNKzjLp2jN0
 2uPofKfkNE14Es3wsayFuXbBTLmYpo3rFgwgA0kwUxZXZsCi0Eiy0z7EYYeYgQMbyLLG
 jO/iotzZaMII33twByY+yP3Mm0cOXhAMQ3k2WEG8C3YD5fJ3lijdIiSm3N4gjQCj9Dxh
 +AbxQWhf+L5VaRvIcZ/DuFfyMPX4OBW8MX1fQo5hmSkgnI4CN2NL8T2+McEOl9qojdgn
 TVtPDgCFfMrmgc0eVbhcEoIQynQ3EMZ5SHiVu4i/G0M4DvoDmMARHibofmMl25OKC6xB
 O2GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=LNXPPtSg3XU+Uc6GEQWdTQC/nAKU3Cd17KbO8jJq32o=;
 b=h7Tt0nNE2mXDcdwW69eKTfRV1nNsaIpG8sRTyH7HGT36QKz2saf5MG4coo41TvXaP5
 WBxykzCSeABiqoVRjtRPFs3ul3T5ioDBjqEHD/P06g0EuJHlboJ2ZnHr0/+ABVQIGxqu
 4utLLDuP3ig8NwvQCovn9S4brzHteuhTT+w9es12rcxG54HeOYX7w0Uq97jT7bbqClP5
 pR4If5H6XAmWF1RSD+/9qnJXvuXMNQ7Y0EsIrrVwf4oMm3Dl9sWG0+YO31n+5n+rZJ3b
 dc7v4WUEGIjFEGTFvaxZwoTNRYPeVsCUYbWA2izrA6HHY7Mb1XaECFlCX7nC1lpaY9z+
 sTcw==
X-Gm-Message-State: AOAM5317ftS/Z1lZPKwhQeEcImoz789JHIF9GrqK0AkuzXQ3t4q6giHF
 8gUJBL9iul7fUE+nC3j90LPNLJ4tYVC6u732hAhYaF2Yw/g=
X-Google-Smtp-Source: ABdhPJxKiXd4lq3hiQ8qvxppTfVjCOebvf4SBggMcVu7nbw0kMS5ZaA3KaUQkemsta3ZLvn7wiLEWvbpmfypA+VmI0g=
X-Received: by 2002:a17:906:7b87:: with SMTP id
 s7mr881895ejo.328.1601070448883; 
 Fri, 25 Sep 2020 14:47:28 -0700 (PDT)
MIME-Version: 1.0
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 25 Sep 2020 23:47:18 +0200
Message-ID: <CAFBinCATt4Hi9rigj52nMf3oygyFbnopZcsakGL=KyWnsjY3JA@mail.gmail.com>
Subject: RGMII timing calibration (on 12nm Amlogic SoCs) - integration into
 dwmac-meson8b
To: netdev@vger.kernel.org, linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_174730_235522_295509EB 
X-CRM114-Status: UNSURE (   9.71  )
X-CRM114-Notice: Please train this message.
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
Cc: alexandre.torgue@st.com, linux-kernel@vger.kernel.org,
 linux@armlinux.org.uk, joabreu@synopsys.com, kuba@kernel.org,
 peppe.cavallaro@st.com, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hello,

Amlogic's 12nm SoC generation requires some RGMII timing calibration
within the Ethernet controller glue registers.
This calibration is only needed for the RGMII modes, not for the
(internal) RMII PHY.
With "incorrect" calibration settings Ethernet speeds up to 100Mbit/s
will still work fine, but no data is flowing on 1Gbit/s connections
(similar to when RX or TX delay settings are incorrect).

A high-level description of this calibration (the full code can be
seen in [0] and [1]):
- there are sixteen possible calibration values: [0..15]
- switch the Ethernet PHY to loopback mode
- for each of the sixteen possible calibration values repeat the
following steps five times:
-- write the value to the calibration register
-- construct an Ethernet loopback test frame with protocol 0x0808
("Frame Relay ARP")
-- add 256 bytes of arbitrary data
-- use the MAC address of the controller as source and destination
-- send out this data packet
-- receive this data packet
-- compare the contents and remember if the data is valid or corrupted
- disable loopback mode on the Ethernet PHY
- find the best calibration value by getting the center point of the
"longest streak"
- write this value to the calibration register

My question is: how do I integrate this into the dwmac-meson8b (stmmac
based) driver?
I already found some interesting and relevant bits:
- stmmac_selftests.c uses phy_loopback() and also constructs data
which is sent-out in loopback mode
- there's a serdes_powerup callback in struct plat_stmmacenet_data
which is called after register_netdev()
- I'm not sure if there's any other Ethernet driver doing some similar
calibration (and therefore a way to avoid some code-duplication)


Any recommendations/suggestions/ideas/hints are welcome!
Thank you and best regards,
Martin


[0] https://github.com/khadas/u-boot/blob/4752efbb90b7d048a81760c67f8c826f14baf41c/drivers/net/designware.c#L707
[1] https://github.com/khadas/linux/blob/khadas-vims-4.9.y/drivers/net/ethernet/stmicro/stmmac/dwmac-meson.c#L466

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
