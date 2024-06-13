Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A6CDC27C4F
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Jun 2024 08:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JvetKj8vsCTlP03tUXQtPo+tpBqgccaF8OcaJ3G2rms=; b=VJBftpXl+HgeIP
	2aAd4K0xTOUom8c8YwfhozIKRQ4NNMaY7FzDIPUiYGAGt9UrPGu3UkKrAbp40ssmovZxv69ohS3GR
	WsB9N2mfc33qTNq4rsxNSwATeeimyXN0H9MpBtLlf/e+5vdRBU9UxIKXjqfgivzJlUrw9AhYAyec2
	0wanVa/uM4OWU0T28w3qujNSjIsCQzZCpMDvN6LDsa+bKCe9X9PvVoQSZEBXJwbTpOVrea0LaIqx8
	tTxLSt3/e+rRm1pHWrsEGwkJGaUN0/ZDcMj/Zpd4olSh0BfqOuYIYdTustrLQKFpqPr1pCGi0HUeD
	NKOhmyn4QJVDgT5bZ+zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHfSH-0000000Fc1B-1ojo;
	Thu, 13 Jun 2024 08:05:09 +0000
Received: from mx.adeep.su ([185.250.0.168])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHfSE-0000000Fc06-1c7p;
	Thu, 13 Jun 2024 08:05:08 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5B77AFF6DC;
	Thu, 13 Jun 2024 11:04:41 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
	t=1718265900; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references:autocrypt;
	bh=0x6Lf8u26vaxcMPY+X+v/MAprWib4Z0FqDNje+Z8SZY=;
	b=ee9gToqdWu7qYI3kUArtkDHNcCLOAtf2AOGZ+oYMK9gL+dgFBGWeHMjDcibj3ppEquiOFT
	OpQKnCT2qExvZ1Imm33tSHJEYtOaWQ/f7VhlfUupxXuihFPPQTbo6tJjUax0K+L80oYkPw
	T03UZsPy4jjAefvZBJcm/gg7cy797P9Ggqs6fJ7kiDM6RNMA61uQmG54zQuoYbRzWZWwFj
	sf2Xyq0yCu6oKm+9QBnbDzu+xfah2yJrNBDGczRnb9Wj8jWey369/nfQFOeXVUuW+yAI8/
	k3r5npg01UNeMN1dWZI34dKD0g2sTd8yaEzGCgUgIdBG8B/KsFF03LM81DW9Kg==
Message-ID: <e3a8cd0f-7bf2-42e0-9b41-9665686ee4ce@lexina.in>
Date: Thu, 13 Jun 2024 11:04:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/2] arm64: meson: add support for JetHome JetHub D2
From: Viacheslav <adeep@lexina.in>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org
References: <20240607145148.2246990-1-adeep@lexina.in>
Content-Language: en-US, ru-RU
Autocrypt: addr=adeep@lexina.in; keydata=
 xsDNBF+1fsQBDADh4przgt1LU4l+B6rIWel42Mg3hgdgbZ2nlIkKnaaNLXkm5rK0EJJeStd7
 8sxsdk9n7UQFB3mkmgjc89zyAG+CDG/+KZQMWOsc5IvWlDebKlefieyvf9yvV4qcQTeudr3C
 CgUxq8qsp1fDX9jdSjz5/OMJKrxCElMxLxJTFF+FHtWvUIMr4txesE8NP7f7VnIYILEeMM8q
 gvptNUrWQr6KTv4XnRD/BvsRZJWnQ/a5MzMGQWzw7LeT4vhV4lYqJsXmxbGLUOKi+5ZpslR3
 Ffby2kdL1Xyq6Y7Gi70RhUpKP0xGJ6gDVs6SjFSb9UxgrjwNBWZcFeSJkc6pR5JbgbYMRvdA
 W5CNnA8TzdfhPgO3HEDFlsVqberSBI/tMiwHWPze7jkv7ttx/Wg9+RZybFfCkGm4XvKh7aP4
 jG3Td43mqhyHGzOd/EUxNITebqxqpEJTmRCisgpjr3M76aht4UFz11tP/QEuCrpDX0bOMPYA
 4aohmhw5FLyWUPg0JllH6kEAEQEAAc0SIDxhZGVlcEBsZXhpbmEuaW4+wsDwBBMBCgAaBAsJ
 CAcCFQoCFgECGQEFgl+1fsQCngECmwMACgkQ7jaxEAJajfrgvAwA051C6jUKS6Wp4oy2Or0i
 B1HXCDDaCS2zgWDCa+nuI+8qVDzTx0TAlurt+S3AUv8+DHjkc4XjEHtDdigabp2nGsk51w3C
 WyGD7NKUQz8/mpN7Fb2OV79etE3PTMayUrXRZh7ZuvQ7vkUemKM8rRw0PFPu3kqwZPDPapYH
 rPyJZjnNFuvFULli/xIcc8+WklaYgOKg4nmsVBT4NigiV2Y4Mb4yVBWl58mErRH5pv08NYb4
 1JFD2FZnTGhEeumQDl9p6Kd+rZETRgkMEHw+HMwdXl5ZXv5ci4NTigiH77UvfN8FetuAdl3x
 6EM+1bJkgab6TMyWdNPPmF6e5BPHtBduk9gzmU5+xUlTbur0gun662oFi1oWwbAqhBDueDyL
 xCi8qjycOJaehBcPRtksQeTZrp+fDYne7hq3ywMBdlqhdz4Sfm7urLHvA/bApgJKlWylkqkl
 sG82QPh63ZnNw2lORTGEQTO3tBMY5RLKnrvZjtZR7W06pVZXyQQXZceEmpCazsDNBF+1fsQB
 DACy2kiiKt2bTSl4u/z1en+BhP16c/RbjnDXVkbapyZRCf3OmjfpRXprje4Z0+HAHReWgnOc
 sC6vNk+SWimoE/qyXQTNnUDS7KYdFaof14UmU2rA9pf1oXHOgMRzlwinCe+6NCgkjsqOr3e5
 8XNo+cxmQy1bhHt1LDwixBFU6v65umJpZAVUd1F624wU+UeRZCjymMB80ePxF9ppnfcYc+Yp
 aM70LFwDzxCmeLGv0uMb0jfgJ8j2k2LS5nOQ4AX+WoOb98vFuqW7oYA9oCCKDG0Gp/w9QxG5
 RKjMytZIUxQA2JDq0jUN90pK0mtZJn7/Dr8GRM+W+UpeKiK7wW9iTFH+hTIRtbCC8vO8JDGz
 umW65BFtZfH2cEQDU2nbdsf/SstszPDMuyDiCHmxh8MKN/fn55osvJvjXgqpsH48tz9O7262
 P5xK4nMpsWWj7W6OhHGTQTHgMrKsiYoDx9+5NGt8n+MbLO5DUvyOSvfAiE+hRaf97R9vtoSy
 BoyahDXmCH0AEQEAAcLA3wQYAQoACQWCX7V+xAKbDAAKCRDuNrEQAlqN+ra3C/95TV1Fjy//
 t6FvNIgLy0e+5LnTegejiCaGbxklGFIWkGamX/DOm3QF+ZaKsoXUf/kmpL10dnsExiGHTeGw
 7zR8+rOkVnK6fq0ady43a7RxKP5nW0pDVclTvsAWr1CcdFrCVpH2idj7fjtAmZlMbuiEMXoo
 kaDXdhJtS60VrwS4xUlw4ZPQjMZdQdvpu4vGtZUfJr+8vJ757d9N3EGpFUrk+5QWozjktLVm
 gdQ0nlD9ji3RpwjhQWCIoi6GmdWpfdj3LzDO/DwWRLlz8iAdZG3pHSGsCmM2MJ16HbPnsSxr
 YrKwM/HVpqTSVsprnQogPL/xM0AH11uAbqNvIvm6sUkEmx2kdBzTKjY0YdSkpUgTauWn13bg
 Ay+0xfqxRvYBSsHpWpnSnsI12861OVGnYsnB8gJlJLSQjOl3Kwq36MeWbAg6Bs4PnNU4i+uO
 rz9PJ4vHmMYfmMDJLYWJI6pcLyAoZSE/bSTLaRV73/zjtlX85mtEL3fvh6G342uRCvAwqgI=
In-Reply-To: <20240607145148.2246990-1-adeep@lexina.in>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_010506_829881_88A0404B 
X-CRM114-Status: UNSURE (   7.68  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This series can be skipped, I will send a updated version.

07/06/2024 17.50, Viacheslav Bocharov wrote:
> Add support for new controller.
> JetHome Jethub D2 (j200) is a home automation controller with the following
> features:
>    - DIN Rail Mounting
>    - Amlogic S905X3 (ARM Cortex-A55) quad-core
>    - micro-HDMI video out
>    - 4GB LPDDR4
>    - 32GB eMMC flash
>    - 1 x USB 2.0
>    - 1 x 10/100/1000Mbps ethernet
>    - two module slots for radio/wire interface cards
>    - 2 x gpio LEDS
>    - 1 x 1-Wire
>    - 1 x RS-485
>    - 3 x dry contact digital GPIO inputs
>    - 2 x relay GPIO outputs
>    - DC 9-36V power source with battery UPS on board option
> 
> Viacheslav Bocharov (2):
>    dt-bindings: arm: amlogic: add binding for JetHome JetHub D2
>    arm64: dts: meson-axg: add support for JetHome JetHub D2 (j200)
> 
>   .../devicetree/bindings/arm/amlogic.yaml      |   1 +
>   arch/arm64/boot/dts/amlogic/Makefile          |   1 +
>   .../amlogic/meson-sm1-jethome-jethub-j200.dts | 614 ++++++++++++++++++
>   3 files changed, 616 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/amlogic/meson-sm1-jethome-jethub-j200.dts
> 
> 
> base-commit: 32f88d65f01bf6f45476d7edbe675e44fb9e1d58

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
