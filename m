Return-Path: <SRS0=pdBZ=4R=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BF2CC3F2CD
	for <linux-amlogic@archiver.kernel.org>; Sat, 29 Feb 2020 16:07:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A8B22469C
	for <linux-amlogic@archiver.kernel.org>; Sat, 29 Feb 2020 16:07:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c+660Em5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="xa25qD+C"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A8B22469C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9U8S/6saOmOFBz8nPXIaa/23ZqYckB+bCxyW/bY6wlY=; b=c+660Em5zwG2QH
	9+wZpqIAS3pJWDHmEx+6EpbLt7cv1hXEf4wyDni3J0Jtxz8sMpFUOBXbSKTD+fezNLkqTrjLflB6U
	T4i8wR9AgpMegxlFhHv35UhaXa+FaxJUpNwpZOaGqQh/4v2x+/1LAw9LH7lS+tc4QqCCd0pmj56ak
	1o6SwZXS7GSSadYXrUSgm0iwFMIGIWvHek0K8b568V1RgPFzQU0QqkRSN0TMbg7mgM5T8kh7FcalO
	AmmS0PW6Zx4MgOkJvLCpMPUUkZDFFDxBpoqJte7VaaDVibdbeqswNSxdz+gukaaqJ2BkWAAIE+5Il
	VSubBZlF2J7lOQeSi/zA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j84ee-0007WK-42; Sat, 29 Feb 2020 16:07:52 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j84ea-0007Vq-SH
 for linux-amlogic@lists.infradead.org; Sat, 29 Feb 2020 16:07:51 +0000
Received: by mail-wr1-x444.google.com with SMTP id r7so7082069wro.2
 for <linux-amlogic@lists.infradead.org>; Sat, 29 Feb 2020 08:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=48DSmx7US8n6WMlcgOvxvjVcQ+g4+Ibx6G+UETF629w=;
 b=xa25qD+ChpBdxQ6RLpkaOU3kV4mB4htgdPT4qxKmKIDt6/v7diTH14/6azdEsOmotU
 YlSzesmn0W2vrpAJYfNTOG5i4/9dEezxs6nbGrEqwxR00x2uQ9Rpa30xHj2PP1MvYPBq
 X2ZA6j/TuOPXQAPDoV2Cf5DvIkd7HO8a63Ug5TXJ3ThCOgBDxvXCfiDwFcuNnVYMCCII
 3/b4pubDwFnr+uFDWau33mwv6RfuAp8FHTLepmiGdysMll8c2EOzAndsn4OEIzS4R7eW
 MSMeqHgl1FFiSVwEclEMJybOcwSRrfsJRrQgz9xp06khN9IEyxbLSTCHqNt3a3IKQ9ZP
 2ThQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=48DSmx7US8n6WMlcgOvxvjVcQ+g4+Ibx6G+UETF629w=;
 b=cSO4kS47GaK/L3mlyjZFBPqkxAtjMElaaKwvDWxDHNLIOB9aCz7iNoBzllthJwXUMT
 aGr/qTDb/6PQdfe0iLMqx+spDQjwYXzTcnQoebW6y0dU6RhjWgkQa4SLnzSXCaNhDBWN
 1av5BodXQJ5/UKa2ivGq+DCi5sQCUXK5n/tSFP8eygvsm2VdYUamF49TaH/uju3JJek8
 UpvmMrf4HT2xSwWc5fRuDelrq6vYDeMYezJ1kE7shh1BSrfcg/tZe6uXo8ZDvdpyuD7U
 BnD8GdlRNAzhpsjgXQ83+ETZGvPa+gbkpew4weIcf0E/Kv9mUrX+2+IqgnqMTNliuIgr
 2G4w==
X-Gm-Message-State: APjAAAVs6aSutWxWoEQpcQd7hPn+bAuW2yi9CYV4dS/IkCL2pBnrERSP
 iG/HJ636kDpbDHx2CZEsjsseRg==
X-Google-Smtp-Source: APXvYqxUgytqyvDZW+WcxWi1g8HE+C1vnsLjI/U/K70R4QGytxpW9GY+14iyGD3A2pOx2tsCrhjOmQ==
X-Received: by 2002:a5d:4610:: with SMTP id t16mr10996895wrq.408.1582992466554; 
 Sat, 29 Feb 2020 08:07:46 -0800 (PST)
Received: from localhost (229.3.136.88.rev.sfr.net. [88.136.3.229])
 by smtp.gmail.com with ESMTPSA id q9sm10518220wrn.8.2020.02.29.08.07.45
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 29 Feb 2020 08:07:45 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Remi Pommarel <repk@triplefau.lt>
Subject: Re: [PATCH v6 0/7] PCI: amlogic: Make PCIe working reliably on AXG
 platforms
In-Reply-To: <20200224141549.GB15614@e121166-lin.cambridge.arm.com>
References: <20200123232943.10229-1-repk@triplefau.lt>
 <20200224141549.GB15614@e121166-lin.cambridge.arm.com>
Date: Sat, 29 Feb 2020 17:07:43 +0100
Message-ID: <7h8sklbcmo.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200229_080748_965787_0F0531EF 
X-CRM114-Status: GOOD (  13.21  )
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 Yue Wang <yue.wang@Amlogic.com>, Rob Herring <robh+dt@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-amlogic@lists.infradead.org,
 Kishon Vijay Abraham I <kishon@ti.com>, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Lorenzo Pieralisi <lorenzo.pieralisi@arm.com> writes:

> On Fri, Jan 24, 2020 at 12:29:36AM +0100, Remi Pommarel wrote:
>> PCIe device probing failures have been seen on AXG platforms and were
>> due to unreliable clock signal output. Setting HHI_MIPI_CNTL0[26] bit
>> in MIPI's PHY registers solved the problem. This bit controls band gap
>> reference.
>> 
>> As discussed here [1] one of these shared MIPI/PCIE analog PHY register
>> bits was implemented in the clock driver as CLKID_MIPI_ENABLE. This adds
>> a PHY driver to control this bit instead, as well as setting the band
>> gap one in order to get reliable PCIE communication.
>> 
>> While at it add another PHY driver to control PCIE only PHY registers,
>> making AXG code more similar to G12A platform thus allowing to remove
>> some specific platform handling in pci-meson driver.
>> 
>> Please note that CLKID_MIPI_ENABLE removable will be done in a different
>> serie.
>> 
>> Changes since v5:
>>  - Add additionalProperties in device tree binding documentation
>>  - Make analog PHY required
>> 
>> Changes since v4:
>>  - Rename the shared MIPI/PCIe PHY to analog
>>  - Chain the MIPI/PCIe PHY to the PCIe one
>> 
>> Changes since v3:
>>  - Go back to the shared MIPI/PCIe phy driver solution from v2
>>  - Remove syscon usage
>>  - Add all dt-bindings documentation
>> 
>> Changes since v2:
>>  - Remove shared MIPI/PCIE device driver and use syscon to access register
>>    in PCIE only driver instead
>>  - Include devicetree documentation
>> 
>> Changes sinve v1:
>>  - Move HHI_MIPI_CNTL0 bit control in its own PHY driver
>>  - Add a PHY driver for PCIE_PHY registers
>>  - Modify pci-meson.c to make use of both PHYs and remove specific
>>    handling for AXG and G12A
>> 
>> [1] https://lkml.org/lkml/2019/12/16/119
>> 
>> Remi Pommarel (7):
>>   dt-bindings: Add AXG PCIE PHY bindings
>>   dt-bindings: Add AXG shared MIPI/PCIE analog PHY bindings
>>   dt-bindings: PCI: meson: Update PCIE bindings documentation
>>   arm64: dts: meson-axg: Add PCIE PHY nodes
>>   phy: amlogic: Add Amlogic AXG MIPI/PCIE analog PHY Driver
>>   phy: amlogic: Add Amlogic AXG PCIE PHY Driver
>>   PCI: amlogic: Use AXG PCIE
>> 
>>  .../bindings/pci/amlogic,meson-pcie.txt       |  22 +-
>>  .../amlogic,meson-axg-mipi-pcie-analog.yaml   |  35 ++++
>>  .../bindings/phy/amlogic,meson-axg-pcie.yaml  |  52 +++++
>>  arch/arm64/boot/dts/amlogic/meson-axg.dtsi    |  16 ++
>>  drivers/pci/controller/dwc/pci-meson.c        | 116 ++---------
>>  drivers/phy/amlogic/Kconfig                   |  22 ++
>>  drivers/phy/amlogic/Makefile                  |  12 +-
>>  .../amlogic/phy-meson-axg-mipi-pcie-analog.c  | 188 +++++++++++++++++
>>  drivers/phy/amlogic/phy-meson-axg-pcie.c      | 192 ++++++++++++++++++
>>  9 files changed, 543 insertions(+), 112 deletions(-)
>>  create mode 100644 Documentation/devicetree/bindings/phy/amlogic,meson-axg-mipi-pcie-analog.yaml
>>  create mode 100644 Documentation/devicetree/bindings/phy/amlogic,meson-axg-pcie.yaml
>>  create mode 100644 drivers/phy/amlogic/phy-meson-axg-mipi-pcie-analog.c
>>  create mode 100644 drivers/phy/amlogic/phy-meson-axg-pcie.c
>
> Hi Remi,
>
> I am ready to pull this series in, do you want me to ? Or you prefer
> it to go via a different tree upstream ?

To avoid conflicts, I'll take the DT patch (PATCH 4/7) through my
amlogic tree, but feel free to take the rest.

Kevin


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
