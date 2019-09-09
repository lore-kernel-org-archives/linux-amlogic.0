Return-Path: <SRS0=Cl/A=XE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFA40C4740A
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Sep 2019 17:51:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9447220578
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Sep 2019 17:51:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZqXEMgQf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Zrm/Rwec"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9447220578
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MmOImk2G7NxDaSTZdbaiBrImdnjlL8eI61RxLbc/BXQ=; b=ZqXEMgQfxrT+tk
	9636Hhld9+NoHClPL9+kQNu5nmKjUJL71gUBU91HSHAExr8dpCU1j/ST4k4FTeVWfKLZbhL933BYe
	jS8Xt6WET8ryQfxqqRm23+5qPRNDkRXAGhQqGbxhS6ajd6JunmEOnwxxPbGg3t/LncqiWaN4H95OG
	A6pyB09hWcXYFwDAAHp9moJ0+6+1vY4IkNSwjNF5Pp/7Hw0eFgCrXk6fjwg17zVHyY2Q04yl5V4NC
	RhXoOrYKhIJHIQFA0VKC8bP7oi8owXvOCe7w9tNEXbT2rUr4MxKbtASVuH7iVLWRsvGFgGiqazPUI
	wvZPPuVSNG8MMAV1fW+g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i7NoY-000140-As; Mon, 09 Sep 2019 17:50:58 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i7NoM-0000uL-Gd
 for linux-amlogic@lists.infradead.org; Mon, 09 Sep 2019 17:50:48 +0000
Received: by mail-wr1-x441.google.com with SMTP id d17so2193229wrq.13
 for <linux-amlogic@lists.infradead.org>; Mon, 09 Sep 2019 10:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=DdPMRC7fgZpsKbVZ/B0zUuc2EzOH4bRfHzaKWExErGE=;
 b=Zrm/RwecGRKIQ+VTy+JsDQ+fpIMX6Z3bVGkjeNioi7u1ctxGFchxRKk0w2X3J8paCs
 nO+kpGwsngaIKWSBd+bLwD+msH1zmU5RfuH76T8G1k2JotXIfmE7t3pGKByUuMaJViOf
 nySZ8j4oh9BLIR7zo+e+YkssIldksT3h1/8MAOFfVqwz7sUlisuBuSxM76bcV1Oi9Jma
 adJP31ArUY/g32u+exgdl+SIWt/z38aT36wAx2uNt9ztXs0gJj9CHsL94b0pplSQsL8r
 SsgQWhfcTm14jeBAtJNeJfJD3iO/kgZphoRk7PgkfxvCosxnTyIX7EEulsPuNjZp0X3/
 F7UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding;
 bh=DdPMRC7fgZpsKbVZ/B0zUuc2EzOH4bRfHzaKWExErGE=;
 b=mxTQLK9iMvXCVzGJsAQ5Y3ejSfrcmXkdgl5+XTBWT4ayAHlZs4iGTOM/RnJZgIg/k6
 3oJwmRCPUweaaugYsCpsMvQLSSFiAEQw35XgDjhNHJClItPQSTnPiHPhJ5pg/ZH5+WmF
 V2RrbdbGTqyXmMUSfMC4CMAvb3WdvkQRl86if4vWle5zM+BOISXQHKUpmiAIS/krTje2
 Qpc037Pqzyq2V7pdWG6r7pL2cqbMGftfm9WvYP4WJqxAz8V+o83MFJNnarStu1fF5QTD
 KyLabnrcInGArDmJW/gDFeODLzYFOQT0EiL1Midj7Uuc9r2ofFaLCv3EB4Bw3dalfkNq
 Ic/A==
X-Gm-Message-State: APjAAAViBFhyCIRPVWAW37OsH6lyseI3tbYJhuWMcPtlLGaGgIaLzqUg
 tJUFVuWusv9NWXtBhONafAjmMQ==
X-Google-Smtp-Source: APXvYqz5gCV5Ze/WC6zuHxMY6FG6sSTIDCIY33H80sMA4yZE+z6o/LNwDUTnh/CS7ryfujgHwlTHag==
X-Received: by 2002:a5d:48c2:: with SMTP id p2mr7815743wrs.348.1568051444421; 
 Mon, 09 Sep 2019 10:50:44 -0700 (PDT)
Received: from [192.168.1.77] (176-150-251-154.abo.bbox.fr. [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id
 p8sm12079863wrq.22.2019.09.09.10.50.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 09 Sep 2019 10:50:43 -0700 (PDT)
Subject: Re: [PATCH 6/6] arm64: dts: khadas-vim3: add commented support for
 PCIe
To: Marc Zyngier <maz@kernel.org>
References: <1567950178-4466-1-git-send-email-narmstrong@baylibre.com>
 <1567950178-4466-7-git-send-email-narmstrong@baylibre.com>
 <864l1ls9wy.wl-maz@kernel.org>
From: Neil Armstrong <narmstrong@baylibre.com>
Message-ID: <2c25e8b5-191f-96c9-8989-23959a7b1c4e@baylibre.com>
Date: Mon, 9 Sep 2019 19:50:42 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:45.0)
 Gecko/20100101 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <864l1ls9wy.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190909_105046_574988_C45C7D3F 
X-CRM114-Status: GOOD (  18.55  )
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
Cc: lorenzo.pieralisi@arm.com, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, kishon@ti.com, repk@triplefau.lt,
 linux-pci@vger.kernel.org, bhelgaas@google.com,
 linux-amlogic@lists.infradead.org, yue.wang@Amlogic.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Marc,

Le 09/09/2019 =E0 18:37, Marc Zyngier a =E9crit :
> On Sun, 08 Sep 2019 14:42:58 +0100,
> Neil Armstrong <narmstrong@baylibre.com> wrote:
>>
>> The VIM3 on-board  MCU can mux the PCIe/USB3.0 shared differential
>> lines using a FUSB340TMX USB 3.1 SuperSpeed Data Switch between
>> an USB3.0 Type A connector and a M.2 Key M slot.
>> The PHY driving these differential lines is shared between
>> the USB3.0 controller and the PCIe Controller, thus only
>> a single controller can use it.
>>
>> The needed DT configuration when the MCU is configured to mux
>> the PCIe/USB3.0 differential lines to the M.2 Key M slot is
>> added commented and may uncommented to disable USB3.0 from the
>> USB Complex and enable the PCIe controller.
>>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> ---
>>  .../amlogic/meson-g12b-a311d-khadas-vim3.dts  | 22 +++++++++++++++++++
>>  .../amlogic/meson-g12b-s922x-khadas-vim3.dts  | 22 +++++++++++++++++++
>>  .../boot/dts/amlogic/meson-khadas-vim3.dtsi   |  4 ++++
>>  .../dts/amlogic/meson-sm1-khadas-vim3l.dts    | 22 +++++++++++++++++++
>>  4 files changed, 70 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dt=
s b/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dts
>> index 3a6a1e0c1e32..0577b1435cbb 100644
>> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dts
>> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-a311d-khadas-vim3.dts
>> @@ -14,3 +14,25 @@
>>  / {
>>  	compatible =3D "khadas,vim3", "amlogic,a311d", "amlogic,g12b";
>>  };
>> +
>> +/*
>> + * The VIM3 on-board  MCU can mux the PCIe/USB3.0 shared differential
>> + * lines using a FUSB340TMX USB 3.1 SuperSpeed Data Switch between
>> + * an USB3.0 Type A connector and a M.2 Key M slot.
>> + * The PHY driving these differential lines is shared between
>> + * the USB3.0 controller and the PCIe Controller, thus only
>> + * a single controller can use it.
>> + * If the MCU is configured to mux the PCIe/USB3.0 differential lines
>> + * to the M.2 Key M slot, uncomment the following block to disable
>> + * USB3.0 from the USB Complex and enable the PCIe controller.
>> + */
>> +/*
>> +&pcie {
>> +	status =3D "okay";
>> +};
>> +
>> +&usb {
>> +	phys =3D <&usb2_phy0>, <&usb2_phy1>;
>> +	phy-names =3D "usb2-phy0", "usb2-phy1";
>> +};
>> + */
> =

> Although you can't do much more than this here, I'd expect firmware on
> the machine to provide the DT that matches its configuration. Is it
> the way it actually works? Or is the user actually expected to edit
> this file?

It's the plan when initial VIM3 support will be merged in u-boot mainline,
and the MCU driver will be added aswell :
https://patchwork.ozlabs.org/cover/1156618/
A custom board support altering the DT will be added when this patchset
is merged upstream.

But since these are separate projects, leaving this as commented is ugly,
but necessary.

Thanks,
Neil

> =

> Thanks,
> =

> 	M.
> =


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
