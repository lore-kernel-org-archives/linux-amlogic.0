Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD9A5CA9ED0
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Oct 2026 09:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rr5lLAiUworR/sf76nR/WEPA4B/6dRFqmc15NUrK5Hg=; b=3sx20BJJrhy9LZwWCe3qnFIGo8
	VkyccdsYM8FyrLtxl+OY5Hq4M1mnO4b3ZoocgggE7cHDXjkl6OzUnL3TVp20om+WgIsH6kjr7IXjs
	jUGfngRTXPgDrwoUAzSMR7YZRm3oI/ovmupM4/cFADacyrrSNPUQ5n0Jlq/IUZoT4vY5RKiuiMMly
	Y2Kk3PCSN9SPI2icIJ8tJoguHbPbj/3LMV2unoRJaDRMcpq6D6IcBV3/cFYDgut6C2tgK0hdle0Kk
	06oV0uvzaglhtwjW25DObN1LUjF6tz8cZrqb7rtHvBuBz+suEBewU+bIJlcIidT/+2QeajxxLEqHO
	wfzUa9dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGCIM-0000000A3Q4-3jdK;
	Mon, 12 Oct 2026 09:26:11 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGCIF-0000000A3NR-123Q
	for linux-amlogic@lists.infradead.org;
	Mon, 12 Oct 2026 09:26:05 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4a0e1b0681bso11713375e9.3
        for <linux-amlogic@lists.infradead.org>; Mon, 12 Oct 2026 02:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791797161; x=1792401961; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gk95jI3lhRqF+q2Y0sX+t13akZvJa78d7yUGx/ACAu4=;
        b=poSaJ+q8Zx1cUWm0ATNJysjTKz4wbvigoTZmex39+4KzBd0oMfNlE0tzg+m022wvCt
         PSd85djbaVOrWVrUt37xfGBWbCBV728JHrghq46xlwYmMr3vcuQPk24QxKbM+VRvUz6C
         5v3RuWoJEKDjNfFhD8XoZZKu2QZ42S7CFmg2Y+2xEJ6k/EA14nQQ3uJclfq7tcd64PtA
         Adqb8wAFEnNADE3oASiNNGs0je7VScuHNLlbl++gxydNzet4tmYfr9pIUNKD29QrP0xT
         R4l2HyNC/OYcyzCPqM6OdQuNkp9DlsDnCCoMTVg5eA/yupfJ2fNGKPuy4sbnDxbADYX9
         Sazg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791797161; x=1792401961;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gk95jI3lhRqF+q2Y0sX+t13akZvJa78d7yUGx/ACAu4=;
        b=1zQSU96k2rL9OGQnpodMnwfSOXlNV+orXB0eYWOELxu4buRg9X4VP/u1HJMMIEPnUI
         lWF1OFC+vOue8Wpr2eV/BaY1Ke6KhcCBJsFeBdNBJRxIPjGP9mKmOuYAXZ9aqIVT6acG
         zMK+hxQRWI9/a9SYNHRUyTHab8UUoXE+gdtQiBA9XP8jx3gxTfME3/UlHtpwOAyEmf2C
         VPKq8V9jyLPtlzmUIa1+4DPLcz3ZbC2gDDTbtpkCtMfwal3cIShEC83i9kfPGwkRRqpO
         PWc1zbZAsVQKWCh2C4sj1d3CQNP++Rz+Qn2tTAhbKzaUflOcvZq5mFprisdZOhLtLpyc
         86gw==
X-Forwarded-Encrypted: i=1; AKwUvBxSe2wrx0w5bhklUAgO1Mtedh45gvkgInpFbJulUyRJSNUQSVfQDwet/WBhLk7HACUuSzyMjJ5wbRpSfp+L@lists.infradead.org
X-Gm-Message-State: AFq9FYL02FJwTKbv9Ewwl8mWLFs1cAaVGXZGyiB9UPzTOZl7AQkG20uY
	ontuXPuJexSezqRj1EPS7qWiZ1pTSwdfvzAIFrIW363nEeX6+7zknTFIw0pVJFdnXXQ=
X-Gm-Gg: AYBFou37ZbOb2cWFpw0NOGS4HsqYYKuMFD4Ye0jUtW34f4580UyZiBrH3wF1emyYDSj
	ZVbzjwq57sOhh3NS9sa2XjeocWkW0VkPVeV0IlcEXUfzK1Bc+Vu0QhQ98Old3Hy0VLJ3wO/fBSE
	SxWk5dVRKQgrhE9DNMQNaEF5TGxg/fLfGXJSAp1yEAeIHpm2cZXGPITZ6z7DJIhPLg/VuxLUnbx
	cQxKs+J6F+B7FLAIFNwV0XFbi3m8ZJuFLPqCLTkNLgl6zsy7yb79rjhGEC/8V5oDcypHdyigV83
	BTbIqs/CcBc5vLj7yV5nPmmI024QzwSsoN7oqFsv/+kA71f6m6S1LbG9s5fHzDwVtrUinbn+CI1
	4OOcfgcsyXn1TIoci6tUcBjWDXyOY7Kwzgd1PRNVzdpyDQ9q6U0NjAGzk71Uu9puuV25uKyCD7B
	zfD6vAvfTheXPoKFcSba7KqE0ga8bMb3lhTsqqYAjbCSVm69KaogIVxd3YbFBlhxrBcIzRoHVvR
	U4ImOGOi58BikfK1L2PCEkvnMVOZQ8k8shUdw7Od3mq0i9nujM=
X-Received: by 2002:a05:600c:8b28:b0:49f:bd3c:bc1b with SMTP id 5b1f17b1804b1-4a18e499da4mr171146595e9.22.1791797160966;
        Mon, 12 Oct 2026 02:26:00 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:417e:f4c4:5b8:8c48? ([2a01:e0a:106d:1080:417e:f4c4:5b8:8c48])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9ac6a91sm16729294f8f.41.2026.10.12.02.26.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 02:26:00 -0700 (PDT)
Message-ID: <1a940a0c-0a90-4b8d-831f-300c2cf02ae0@linaro.org>
Date: Mon, 12 Oct 2026 11:25:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 1/2] arm64: dts: meson-gxbb-odroidc2: read the Ethernet
 MAC address from eFuse
To: filipp.dunsky@gmail.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261011-odroidc2-dts-v2-0-a3a4a752f2ab@gmail.com>
 <20261011-odroidc2-dts-v2-1-a3a4a752f2ab@gmail.com>
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
In-Reply-To: <20261011-odroidc2-dts-v2-1-a3a4a752f2ab@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_022603_346950_1327BE7A 
X-CRM114-Status: GOOD (  18.57  )
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

On 10/11/26 20:31, Fil Dunsky via B4 Relay wrote:
> From: Fil Dunsky <filipp.dunsky@gmail.com>
> 
> The vendor programs a unique factory MAC address into the SoC eFuse at
> offset 0x34, where meson-gx.dtsi already describes the eth_mac nvmem
> cell.  Reference the cell from the Ethernet controller so the kernel
> picks up the factory address itself instead of depending on the
> bootloader to populate local-mac-address, or falling back to a random
> one when it does not.
> 
> The cell is 16 bytes long in meson-gx.dtsi, while
> of_get_mac_address_nvmem() only accepts a cell of exactly ETH_ALEN
> bytes, so narrow it to the 6 bytes of the address for this board.
> 
> Tested on an ODROID-C2 with the bootloader's MAC fixup out of the way
> (ethernet0 alias removed from the DTB): with the 16-byte cell the
> driver falls back to a random address, with the 6-byte cell eth0 comes
> up with the factory address from the eFuse.
> 
> Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
> ---
>   arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
> index 5943bc810..3b74528ef 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
> @@ -223,6 +223,10 @@ &cec_AO {
>   	hdmi-phandle = <&hdmi_tx>;
>   };
>   
> +&eth_mac {
> +	reg = <0x34 0x6>;
> +};
> +
>   &ethmac {
>   	status = "okay";
>   	pinctrl-0 = <&eth_rgmii_pins>;
> @@ -230,6 +234,9 @@ &ethmac {
>   	phy-handle = <&eth_phy0>;
>   	phy-mode = "rgmii";
>   
> +	nvmem-cells = <&eth_mac>;
> +	nvmem-cell-names = "mac-address";
> +
>   	amlogic,tx-delay-ns = <2>;
>   
>   	mdio {
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
