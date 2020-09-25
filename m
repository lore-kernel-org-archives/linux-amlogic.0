Return-Path: <SRS0=7OpP=DC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BCDBC4363D
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Sep 2020 11:27:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7C6F20715
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Sep 2020 11:27:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="S1jugEmD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="G+4Kg6/g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7C6F20715
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bfce81WkhOxrJE5Cbgd7lBcKdQxeR+WFz5Ty0QGHl+Y=; b=S1jugEmDNQq9H9fPrtzloNHu+
	wIintL5SZODTSz8aZxAjqAiDnXhdNon3ndZbVfoXgrBCEzkJN5cOmLkql5wYmOQkdt764tSsXqXrd
	eAyGSbi5A4J7Gp3NfyPnJhFU4/B5WZYZuemH6HQ/gKM9LUfFR7Iu8R4hIc5lT37kUP5xgRQD3Kbxe
	ozkYN4xBxs0XmQdVFZkH0TDhGn3gQbizaDj/q9Ewo5UC8S5pYyIS2YmAAlISWTHQ/l5SYL9w6aEyc
	nSTVKpcDhm7Tdp7n7NJVYxPYXrHpoZkHZVvPFGxCV73ejt+p+4Qd97ZNWbBbClLllQNbbcY3oIrF3
	KuMtTL1AA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLlsO-0003PT-TT; Fri, 25 Sep 2020 11:26:56 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLlsJ-0003N3-FY; Fri, 25 Sep 2020 11:26:52 +0000
Received: by mail-ed1-x542.google.com with SMTP id g4so2147845edk.0;
 Fri, 25 Sep 2020 04:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DaEiyCpA/iAmijBp9fbgLwzE+O9eX5S4Ozv2YkoK2I4=;
 b=G+4Kg6/gocoXGUoLsO/VRT8s6sDQArZ8eA/JQlK9y13t5BZUOX5WdfGGWRd+6Awqmt
 3rYqIhwANZV12yPloBy/JhPicz8+YIOBYYfVsyJdSwaguXQfP4hOi8MVKHTxNNeucCwe
 5hcIq3PyomzIM8INzRFlEuxhBoQ0b81daRNnhSbZeJGiJXVIpBtN3tp56z94lbfv0il3
 0EO9xrwNZz1hN7JmKMUXpNICCmLHJJbi40DEyLUY1V9/Gi07S4igN7PaQeKejwZ+acLh
 Xm2lmgZ0iSi29+H8GfAm8bmvP8usmJPU6od8JVk/5szVyqrpqOIIM6C6D40UXoCRvuwH
 kA6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DaEiyCpA/iAmijBp9fbgLwzE+O9eX5S4Ozv2YkoK2I4=;
 b=fzdRCVot+kVfMbSCA3LZIwMAkKP/XrN9rn1fNkiROJKzFsz9B4KYIm3YhRNav8qQi7
 aqdLHafeQWkO3YTw8isqMvCU0viK5CBx1OTcF24GzmOI4oYUtp6vtYek33eHzJ4znvH8
 XeIPNeHliOZWKeVRAWQlnnxD/DXcVZjqpOj57Uag/OLT8w6klG4EqWS/rNC6d9sD5mm9
 ODkjKDkkb5Axp4gpjASNFwDFeNXf6Ino3yhWDK05ksEHiCE8XIjGHIa70J/ZVHhkURtv
 Gn3aVnLGjV6uvBMdDD5W1UoEhlY5wiF7SeZ2vTR36gaeXmDFuLOdhJte0kQOOwEByb6M
 wb6g==
X-Gm-Message-State: AOAM531Wc0OoQde22WXaQrW6A2rKEd+ptC8gtQ7pUBMfpikdKhFhbD8f
 KD2P6eofX6c73JTckHpbgQikYi5Z30f+HuJDjp0=
X-Google-Smtp-Source: ABdhPJxeAVbNfrPCu7zrhHMzDI4gm/MF1+4roWc++ikceWwHZjgE64uviY991arvc/Qz0YE266hXHEIqTqEb1kajqLI=
X-Received: by 2002:a05:6402:1495:: with SMTP id
 e21mr767338edv.146.1601033210101; 
 Fri, 25 Sep 2020 04:26:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200925033017.1790973-1-art@khadas.com>
 <20200925033017.1790973-6-art@khadas.com>
 <CAFBinCAJ6svwiv9OM6EHz7468D9h+jW_ULiGrorgLetcODsAKQ@mail.gmail.com>
 <CAKaHn9+CWLJYN1Tt46VxBGNBEbVVJZWeL6ZJSf9w-5DmoxrvgQ@mail.gmail.com>
 <CAFBinCD0_QgKKcH+Kb2QbMWnx_csoXMEhSFYzmDscdTVB2TUJw@mail.gmail.com>
 <CAKaHn9K6O8u6Br84S63V0PDFBhiRbMdd4-bvC5FxFe6izj_Dvg@mail.gmail.com>
In-Reply-To: <CAKaHn9K6O8u6Br84S63V0PDFBhiRbMdd4-bvC5FxFe6izj_Dvg@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 25 Sep 2020 13:26:39 +0200
Message-ID: <CAFBinCAb91M5Zyn8yM1Ww4KKPANM2uqvJB11=QGjMJ2fdU836w@mail.gmail.com>
Subject: Re: [PATCH 5/8] arm64: dts: meson: remove reset-gpios from ethernet
 node for VIM2 meson-gxm-khadas-vim2
To: Art Nikpal <email2tema@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_072651_562490_5D574C8B 
X-CRM114-Status: GOOD (  18.04  )
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
Cc: devicetree@vger.kernel.org, gouwa@khadas.com,
 Neil Armstrong <narmstrong@baylibre.com>, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, nick@khadas.com,
 linux-amlogic@lists.infradead.org, art@khadas.com,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Artem,

(adding back all Cc recipients - please use "reply all" so they don't get lost)

On Fri, Sep 25, 2020 at 10:18 AM Art Nikpal <email2tema@gmail.com> wrote:
>
> this means that "something" is either set up incorrectly in the Linux
> kernel or that u-boot does some magic (and the same magic is then
> missing in the Linux kernel)
>
> maybe ;-)
>
> > I'll dig out my Khadas VIM2 to test this. what should I look out for
> (are there any error messages, dhcp not getting an IP address anymore,
> etc.)?
>
> just start your VIM2 board with ethernet
>
> 1) check connection its must works fine for example try ping your default gw
> 2) do `ifconfig eth0 down`
> 3) do `ifconfig eth0 up`
> 4) check your connection again it will be broken and u cant restore it im sure ;-) only reboot
# ping -4 -c2 google.com && ifconfig eth0 down && ifconfig eth0 up &&
sleep 5s && ping -4 -c2 google.com
PING google.com (172.217.22.78) 56(84) bytes of data.
64 bytes from fra15s17-in-f14.1e100.net (172.217.22.78): icmp_seq=1
ttl=114 time=22.4 ms
64 bytes from fra15s17-in-f78.1e100.net (172.217.22.78): icmp_seq=2
ttl=114 time=22.5 ms

--- google.com ping statistics ---
2 [  127.097495] meson8b-dwmac c9410000.ethernet eth0: Link is Down
packets transmitted, 2 received, 0% packet loss, time 1002ms
rtt min/avg/max/mdev = 22.375/22.415/22.455/0.040 ms
[  127.170167] meson8b-dwmac c9410000.ethernet eth0: PHY
[0.2009087f:00] driver [RTL8211F Gigabit Ethernet] (irq=38)
[  127.276459] meson8b-dwmac c9410000.ethernet eth0: No Safety
Features support found
[  127.278508] meson8b-dwmac c9410000.ethernet eth0: PTP not supported by HW
[  127.285230] meson8b-dwmac c9410000.ethernet eth0: configuring for
phy/rgmii link mode
[  130.425311] meson8b-dwmac c9410000.ethernet eth0: Link is Up -
1Gbps/Full - flow control rx/tx
PING google.com (172.217.22.78) 56(84) bytes of data.
64 bytes from fra15s17-in-f14.1e100.net (172.217.22.78): icmp_seq=1
ttl=114 time=22.4 ms
64 bytes from fra15s17-in-f78.1e100.net (172.217.22.78): icmp_seq=2
ttl=114 time=22.6 ms

--- google.com ping statistics ---
2 packets transmitted, 2 received, 0% packet loss, time 1002ms
rtt min/avg/max/mdev = 22.439/22.512/22.585/0.073 ms

note: the sleep 5s is needed to allow the link to come back up and to
get an IP address via DHCP
also if the output is not easy to read in your email client then I
have also uploaded it here: [0]

can you please show me the output of the debug logs in
rtl8211f_config_init() from drivers/net/phy/realtek.c (for example by
replacing dev_dbg with dev_err)?


Best regards,
Martin


[0] https://curlpaste.com/web/eaqun7

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
