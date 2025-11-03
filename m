Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D2E8CCF9F8
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Nov 2025 09:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o0a7XBSDJs4YiRPawJ/6d0sxfm7bt9oKLlA541TyDhM=; b=4UjfxIuPRxWDlrAD0NDeJjHdDC
	nDQ2YbNc1ZlKPNzu7vNdM1g84Ibv6M2PFCsiTgcVtfu14BOUOLcItmDKLPAZedTPpvs5UxnTN3n4T
	cOrBKVJi4Uq8xhhwhF+bbnBj1EZiKF0KrCUyCEwSRqmvk7SNFe5d0c5kN4NLJ7d2i3jxph89vWUHV
	Qako+DTzczc7yfYmyQEWwwW7W41Q2XlG4Jrj2+GS/Vdx58bmM8yh5aDTvxCODysmW0nQT8WYUiMb8
	z3bvRFP4zFcHGi9qJhJnpcGzlS39OEsyLU0z7VNSrKpJyuy40zOh7wXtoz63FuzAqqAttY7yIyPaf
	f3kY6A8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFrCj-00000009Xfl-2Aem;
	Mon, 03 Nov 2025 09:50:25 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFrCg-00000009Xen-0eQg
	for linux-amlogic@lists.infradead.org;
	Mon, 03 Nov 2025 09:50:24 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-47728f914a4so20775045e9.1
        for <linux-amlogic@lists.infradead.org>; Mon, 03 Nov 2025 01:50:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762163420; x=1762768220; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xkxRjtj8Zko1T2xij3oDoi3JjwhxKLKuoC0vibst6Dw=;
        b=kHGpdjf+H926au+PMpaJ7LgDTDukT9D7wrZitfBxeaAq4b12vvHV0WUT423Y5+sRYD
         a9IDOTd9DKSKwUif4waID7e2MHt+mNWgOr31fDZVvzFbXJcv1g74yxhRev031KQb6JwW
         CuYgpUtml/QeRKf71kORbZ82G4VmSsDe0HNbNXCS7tfK+EPDUPUIJq57f6t+X6cFNEAn
         qyHh8zpu0snoveInTeY1ByP/U4kDf27cWOuD+LRrgS8s30RdtOVTV5nFaXIxBcc1CsQM
         5ZxBMFdH1YlUpfUQMo56zhFdZQTDxTQd3cgtk4mYEQNH+bmbKqOnh504n7PShEZwdTkV
         jBNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762163420; x=1762768220;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xkxRjtj8Zko1T2xij3oDoi3JjwhxKLKuoC0vibst6Dw=;
        b=tId3gFh716jzytn6sqMMefyt8fKN+s27s4nOwtZJrJdsP2Uj7EL4MnhITKQLBk/hsh
         nrhsWnlohVrkorkqvGMiUmHVRGtR29rpsRm++zUrDFWSW6UPTmCnzDYMJq9WGmPCu89c
         e+i8+WdtJNr1O1Ieye2YB9eSs4cV8SdG173wL4uF5EzwWhsvCb4xc9hxbiee+qZGn0yX
         IgJQfgeJJm6rYMmYMqygLUV/oJQBIB3vXJGQUTQhczhQhLFOX/sn38ifdQLNaC3x3vsT
         1cu+ZE9C+a05zWtL3Sc3ZDuQQWXpNWy7k8YYsA4kxV/NB6kKcWJYi3cB/74aJgbV6foI
         x5NQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOs1kT29vReYwIKi+TttdMKBM7iJE1oZrNsxPlfipM9ZuRuXD7EGW8aeOcWMdQM0JxnXfl4VP1U1EOba7n@lists.infradead.org
X-Gm-Message-State: AOJu0Yxi14tgxIwZbNPi1CxWKD2KjcGUGdBJ/+z3GQXU7bxC34+49wQO
	7UDhYbOxLzMEXFsiaAtiQQvqXt88ww0nDLyirx63NjqEHFwvdIn6+7UOO3BGuwvfCOs=
X-Gm-Gg: ASbGncsqgJy3KsjJ/qesnxz3IRzZa5SXnfq/dR1g9djuMluYyZ0CcVHso6t/oU0OjxT
	GkiOa3AKWowvCkBWdkyLCnqovotTkDYQ3aQUD4UB66+DXUShPeIdvhYhReyu0oc/9l3U/NS8y1a
	nB3Wng5PZmBlLKohyqrxD70W+DGaomndTH0nYUfUGj6WiOcUQ1bDbWDgHZ087NU6efMciPF32SJ
	QgWlkaCdqhX8OPcqhnIzzBFk4RL4b98TMCRY0Y09i1RFH+dZ4l/iFTYlYhOT0ZNyUx2FtH5bchJ
	OjJ6zB0W2eK3YT60eFqsEX639tO7IOrs9gYXHDDCWH7UJGaHIucWjUpvoRSiHIUgoABUmJg2p3n
	tDREZI/wShxP9LC0G4dsDyWXLhamStpcJ5fAeSm+L4DcQ1rhvSl7zN/0zKGOBZWpkJNG6dVzVRQ
	yH622mdu6FwqBUpnxIkFnKwcwtfqOrR4mdZqbmtXoQCS3e
X-Google-Smtp-Source: AGHT+IHrNu7b4MLVFNafM5XudQwLx9/rw/9sFxikTt/B5JVYOos8PxRbnxL+oXtoVWVlGPVam6SEPg==
X-Received: by 2002:a05:600c:5249:b0:471:145b:dd0d with SMTP id 5b1f17b1804b1-4773087230cmr102374215e9.24.1762163420204;
        Mon, 03 Nov 2025 01:50:20 -0800 (PST)
Received: from [192.168.27.65] (home.rastines.starnux.net. [82.64.67.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4772fcd45a9sm84684815e9.3.2025.11.03.01.50.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 01:50:19 -0800 (PST)
Message-ID: <83d07b54-d584-4297-9aae-2a170c0059d4@linaro.org>
Date: Mon, 3 Nov 2025 10:50:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RESEND 0/3] PCI: meson: Fix the parsing of DBI region
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Hanjie Lin <hanjie.lin@amlogic.com>,
 Yue Wang <yue.wang@amlogic.com>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Andrew Murray <amurray@thegoodpenguin.co.uk>,
 Jingoo Han <jingoohan1@gmail.com>,
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, stable+noautosel@kernel.org,
 stable@vger.kernel.org, Linnaea Lavia <linnaea-von-lavia@live.com>
References: <20251101-pci-meson-fix-v1-0-c50dcc56ed6a@oss.qualcomm.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20251101-pci-meson-fix-v1-0-c50dcc56ed6a@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_015022_254236_6B4B662A 
X-CRM114-Status: GOOD (  17.59  )
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 11/1/25 05:29, Manivannan Sadhasivam wrote:
> Hi,
> 
> This compile tested only series aims to fix the DBI parsing issue repored in
> [1]. The issue stems from the fact that the DT and binding described 'dbi'
> region as 'elbi' from the start.
> 
> Now, both binding and DTs are fixed and the driver is reworked to work with both
> old and new DTs.
> 
> Note: The driver patch is OK to be backported till 6.2 where the common resource
> parsing code was introduced. But the DTS patch should not be backported. And I'm
> not sure about the backporting of the binding.
> 
> Please test this series on the Meson board with old and new DTs.

Let me try this serie, I'm on a business trip this week so don't expect a full test
report until next monday.

Neil

> 
> - Mani
> 
> [1] https://lore.kernel.org/linux-pci/DM4PR05MB102707B8CDF84D776C39F22F2C7F0A@DM4PR05MB10270.namprd05.prod.outlook.com/
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---
> Resending as the git sendemail config got messed up
> 
> ---
> Manivannan Sadhasivam (3):
>        dt-bindings: PCI: amlogic: Fix the register name of the DBI region
>        arm64: dts: amlogic: Fix the register name of the 'DBI' region
>        PCI: meson: Fix parsing the DBI register region
> 
>   .../devicetree/bindings/pci/amlogic,axg-pcie.yaml      |  6 +++---
>   arch/arm64/boot/dts/amlogic/meson-axg.dtsi             |  4 ++--
>   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi      |  2 +-
>   drivers/pci/controller/dwc/pci-meson.c                 | 18 +++++++++++++++---
>   drivers/pci/controller/dwc/pcie-designware.c           | 12 +++++++-----
>   5 files changed, 28 insertions(+), 14 deletions(-)
> ---
> base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
> change-id: 20251031-pci-meson-fix-c8b651bc6662
> 
> Best regards,


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
