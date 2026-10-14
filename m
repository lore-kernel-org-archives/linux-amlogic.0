Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7D13CC6B2A
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Oct 2026 09:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8RhYuadfTjdUM91BVYlmd8YmuGYFU8II7DJjFIjdshg=; b=bEu2cGa+2Bx8lD3+Sbr/qThFPU
	Hf6IvkgidDCg+CzBdRK0J1YRrtP5myiQv8Ybon+dhNysFrVx39iWXjgKz5pwis0W1+WHlIXIQMADh
	98EslvopGHvT6gEyeCE52gbGuVc8nMMpemsJMSDTDKCGOjMdwqVHYLxeui/kV3yMgF0N2DKGfkqeG
	PT7kJ7AZMqNN+tiHd+Nr9yVT0/03MHmJPAX5jKsjw8620yeezdrrcp0aLaZvICkrSOcAqCUbVTUQ6
	qM0YbZ+nHStrnLWkwtOJfp8V41FqjFXgnu0iWlBPT36Er3OQPvGUQ6R6/CFtJJbjw97/V/5NAhojp
	kJ1uJYzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGvXP-0000000F6Ch-08hH;
	Wed, 14 Oct 2026 09:44:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGvXK-0000000F69I-04IO
	for linux-amlogic@bombadil.infradead.org;
	Wed, 14 Oct 2026 09:44:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:Subject:Reply-To:From:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description;
	bh=H6xM3sm3th3dZUQDR90wqF/auFVqXIo1QuQOs4ETDrQ=; b=famMtL8gQ13TqA8MoyHRyGSDba
	LxsR+uVul+86DU+OM+hpDZIXlAhJG3j7ebppfje63ppVk3GF1Fv4K84lPxQMaqN9eBwT9AB+VgQq6
	nQxdLVHtH1gVW0Nv8R0woEU7wmo1KA+fMOhg5eYER0sdBojKT4NrSwI/8C1SqnQyn3ZXsOEhi7/gk
	iE4td9mWYHyXXEhFRPtRqTI+UCDL6e9Y9egb+TvyzxxaH2J93bnNoZqwxheNAsOHLPlKRg9bNTiK6
	uEgVEYDcAGEmRO8BXdNb172nxgNOlwup4LhAdFF2Lee1E0JEhKLIzvbwI7+edugcz41veu6cipoMX
	2XevSySA==;
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGvXE-0000000GaRF-1Qbe
	for linux-amlogic@lists.infradead.org;
	Wed, 14 Oct 2026 09:44:36 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso2182997f8f.3
        for <linux-amlogic@lists.infradead.org>; Wed, 14 Oct 2026 02:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791971071; x=1792575871; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H6xM3sm3th3dZUQDR90wqF/auFVqXIo1QuQOs4ETDrQ=;
        b=zSgIfxZDmNp/hKd/jmjSH5lhqr6ynKnRthKx9sVsZOU4VLuQaN+HvaMzQ6xkY2C/I0
         ihMUs4tdSGUG4ixz0J7jyrgk/EedORP3RQxuC8ch7m2/8HaOrnT9AXZmCiLRORKVzDnV
         bINorimhcYaM8MCPdkI7DKNblincAjyLBLfqUd2fzy3UBYyHgPrCnuT7m7DB44VxdEzX
         TmoOf3KZL3inFjvU4QXrEIpVxB5xow9VFmeAgOyoqhjWHo57Z1mQpKI9oClnmktABA48
         EmJEbEUZBl3/DKk7OVWOBYCXvOK0kMnqZkkCJjxlEFE9cIm5RBCh8uhzjWP0PYp6C28q
         QrqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791971071; x=1792575871;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H6xM3sm3th3dZUQDR90wqF/auFVqXIo1QuQOs4ETDrQ=;
        b=RPA1w5c+s5rz70Jr8O4oXy/2FjWwzpRqtbE5zOnNh7rnOGGnKhTMBKtePMck1mE7vD
         UZ6WjgOMAzeYvqMuyFsEDGymxl5/ZpwUTbXDsMY2vQElb30HZtPoEQwH+xHY5ulvtp2Y
         VzYARcGW/IxVl9gt6SYqrvCfrPx3r8WjErhB1Lk0fv7RgS6nkbzImD3UVvQDP10g4ArD
         lOh1w2PZFrvL8/sDhEgxZazZx9tkTE4/Et32YLFhWQ5zmiH+gIS7az2KhULo8vOZFuou
         sgdSVlYiK200y2Ww8gRotSyJbXPs4+g50vNESeSYRFRydLP8epMQIKRGmSjkStbfJJrJ
         KoFQ==
X-Forwarded-Encrypted: i=1; AKwUvBwl6ju6S4pkqj8PBtmbJG4mYpXwzayidYHA2YZCKTve1EhnEg8kHHg7i6PsufKkUfZTTAVdjlEfnznJYS6e@lists.infradead.org
X-Gm-Message-State: AFq9FYKztkNxGHcLv0zLQmlBA0zNcdZswtKUqZ6D57OF004DAQUcoPqa
	UNFIjlDctyab2rhZ57CHXODpeshXotk3oEpZfHkmQ+1/VxDBIPxqYmXwRcRtoGvX5Tg=
X-Gm-Gg: AYBFou2sR7Xj4xQh6sZ8a3AiyFDxu0c/3qosk1kWfggcSLsTBGVdZ+sU7sqX9TL7rtO
	dBSsYGPAlBidrG1/nzt/X6AM7v1ZicvQhxQW7o9MmrVCSJEQGWFMJehjNChmFV78jaiBSXU2Iz5
	U14N/HRlSnQvaVY7ZXSg9BTakIDpA6qAmSN4v1eo0lYMRonmJMlXqBYg8z7siW2dvLVIIt60Sg0
	dwF1ygy9m2U3Ux6e4HmOMcA8CX6b02sm+Zu21J6fKpSJly0rZ1Y33jjP5deBaFiIiW2m7eNIMzN
	o820zi0Qw0Khzuk0pgzcTGorIXXX+Mcm7jDxiO+cqyg4cdNCyofEhOaeqVs6l0SgXJ/8I3ZWqkZ
	3uwSUb1qej1km+FlgIhE+fIkSKl2fxHps7MRTNlPpfDYYi3LRgV682pL65sp73OkeuMYVCB8VmQ
	yr9E4wBAlrqkVJXC262FTu1L1Mf3Ooax2iXBPg7JqSBuVZlkDndKmoxChmCVZeYcRUGsbxdV1JE
	J1dCdZ/jo42ZZbCMKKoAJrjg8S8Um1/5tqLwE3bLTogAVH7C8genw==
X-Received: by 2002:a05:6000:22c8:b0:48c:6a50:cb9a with SMTP id ffacd0b85a97d-48dbacf56a0mr28939645f8f.51.1791971070318;
        Wed, 14 Oct 2026 02:44:30 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:ef1f:5ab3:36fa:3ccb? ([2a01:e0a:106d:1080:ef1f:5ab3:36fa:3ccb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de70079e7sm5699992f8f.11.2026.10.14.02.44.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 02:44:29 -0700 (PDT)
Message-ID: <03375a31-0ac6-47a4-b0dc-6327080e1622@linaro.org>
Date: Wed, 14 Oct 2026 11:44:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] dt-bindings: usb: snps,dwc3: Fix downstream port
 numbering
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Felipe Balbi <balbi@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai
 <billy_tsai@aspeedtech.com>, Michal Simek <michal.simek@amd.com>,
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Peter Griffin
 <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>, Alim Akhtar <alim.akhtar@samsung.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Minda Chen <minda.chen@starfivetech.com>,
 Shyam Pandey <radhey.shyam.pandey@amd.com>,
 Wei Yang <yangwei1@eswincomputing.com>,
 Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
 Hang Cao <caohang@eswincomputing.com>, Li Jun <jun.li@nxp.com>,
 Peng Fan <peng.fan@nxp.com>, Roy Luo <royluo@google.com>,
 Yang Xiwen <forbidden405@foxmail.com>,
 Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>,
 Robert Marko <robert.marko@sartura.hr>, Xu Yang <xu.yang_2@nxp.com>,
 Wesley Cheng <quic_wcheng@quicinc.com>,
 Stanley Chang <stanley_chang@realtek.com>, Ze Huang <huang.ze@linux.dev>,
 Aswath Govindraju <a-govindraju@ti.com>, Roger Quadros <rogerq@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev,
 linux-aspeed@lists.ozlabs.org, imx@lists.linux.dev,
 linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev
References: <20261014082037.1774672-1-wenst@chromium.org>
 <20261014082037.1774672-3-wenst@chromium.org>
 <7020a7a6-332e-4fd0-a659-d82eb768614c@linaro.org>
 <CAGXv+5G1kgyumbj7wGf6rPFbg3spSO0zYmEkn-hZT4qUdJbytA@mail.gmail.com>
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
In-Reply-To: <CAGXv+5G1kgyumbj7wGf6rPFbg3spSO0zYmEkn-hZT4qUdJbytA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_104432_573793_57F8D0DA 
X-CRM114-Status: GOOD (  34.08  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMTAvMTQvMjYgMTE6MjksIENoZW4tWXUgVHNhaSB3cm90ZToKPiBPbiBXZWQsIE9jdCAxNCwg
MjAyNiBhdCA1OjI44oCvUE0gTmVpbCBBcm1zdHJvbmcKPiA8bmVpbC5hcm1zdHJvbmdAbGluYXJv
Lm9yZz4gd3JvdGU6Cj4+Cj4+IE9uIDEwLzE0LzI2IDEwOjIwLCBDaGVuLVl1IFRzYWkgd3JvdGU6
Cj4+PiBUaGUgRFdDMyBjb250cm9sbGVyIGNhbiBvcGVyYXRlIGluIGhvc3QgbW9kZS4gSXQgZG9l
cyBzbyB3aXRoIGEgWEhDSQo+Pj4gY29tcGxpYW50IGhvc3QgY29udHJvbGxlci4gVGhlIFhIQ0kg
aGFzIHR3byBkb3duc3RyZWFtIHBvcnRzLCBvbmUgZm9yCj4+PiBIUyBhbmQgb25lIGZvciBTUy4g
VVNCIGRvd25zdHJlYW0gcG9ydHMgc3RhcnQgZnJvbSAxLCBub3QgMC4KPj4KPj4gSXMgdGhlcmUg
c29tZXRoaW5nIGluIGluZGV4IDAgd2Ugd2lsbCBuZWVkIHRvIGRlZmluZSBhdCBzb21lIHBvaW50
ID8KPiAKPiBPbiB0aGUgaG9zdCBzaWRlLCBuby4gRG93bnN0cmVhbSBwb3J0cyBzdGFydCBhdCAx
Lgo+IAo+IE9uIHRoZSBkZXZpY2UgbW9kZSBzaWRlLCBJIGJlbGlldmUgdGhlIG51bWJlcnMgYXJl
IGNvbXBsZXRlbHkgbWFkZSB1cC4KPiAKPj4gVXNpbmcgMCBhcyBiYXNlIGZvciBudW1iZXJpbmcg
aW4gRFQgaXNuJ3QgaW5jb21wYXRpYmxlIHdpdGggdGhlIFVTQgo+PiBzcGVjIHVzaW5nIGJhc2Ug
MSBmb3IgbnVtYmVyaW5nLAo+IAo+IEJ1dCB5b3UgZW5kIHVwIHdpdGggZGl2ZXJnaW5nIG51bWJl
cmluZyBzY2hlbWVzLCBhbmQgaXQgZGl2ZXJnZXMKPiBmcm9tIG90aGVyIFVTQiBjb250cm9sbGVy
cywgcGFydGljdWxhcmx5IFhIQ0ksIHdoaWNoIERXQzMgZW1iZWRzLgo+IAo+IEFuZCBpdCBhbHNv
IGRpZmZlcnMgZnJvbSB0aGUgbnVtYmVyaW5nIGN1cnJlbnRseSB1c2VkIGZvciBkaXJlY3RseQo+
IGNvbm5lY3RlZCBvbmJvYXJkIGRldmljZXMgKGxpa2UgaHVicyksIHdoaWNoIHVzZSBvciBleHBl
Y3QgdGhlIFVTQgo+IG51bWJlcmluZyBzY2hlbWUuCj4gCj4gU3VyZSB3ZSBjYW4gbWFrZSBEV0Mz
ICJzcGVjaWFsIiwgZHJvcCBpbmNsdXNpb24gb2YgdXNiLWhjZC55YW1sLAo+IGFuZCBkdXBsaWNh
dGUgdGhlIHNlY3Rpb24gZm9yIG9uYm9hcmQgZGV2aWNlcy4gT24gTGludXgsIHdlIGNhbgo+IGFk
ZCBzb21lIG1vcmUgY29kZSB0byB4aGNpX2ZpbmRfcmF3X3BvcnRfbnVtYmVyKCkgdG8gbWFrZSBh
bgo+IGV4Y2VwdGlvbiBmb3IgRFdDMyBjb250cm9sbGVycy4KPiAKPiBBbHNvLCB1c2Jfb2ZfZ2V0
X2Nvbm5lY3RfdHlwZSgpIGlzIGFscmVhZHkgYnJva2VuIGZvciBEV0MzIGJhc2VkCj4gY29udHJv
bGxlcnMgdGhhdCBvbmx5IGRlc2NyaWJlIHRoZSBIUyBjb25uZWN0aW9uIGJ1dCBub3QgdGhlIFNT
Cj4gY29ubmVjdGlvbi4gdXNiX29mX2dldF9jb25uZWN0X3R5cGUoKSBjdXJyZW50bHkgZG9lc24n
dCBjYWxsCj4gdXNiX2hjZF9maW5kX3Jhd19wb3J0X251bWJlcigpIHNvIGJvdGggSFMgYW5kIFNT
IGdldCBtYXBwZWQgdG8gcG9ydCAxLAo+IHdoaWNoIHdvdWxkbid0IGJlIGluIHRoZSBEVCBzaW5j
ZSBIUyBpcyBjdXJyZW50bHkgcG9ydEAwLiBCdXQgZXZlbiBpZgo+IGl0IGRpZCwgU1Mgd291bGQg
Z2V0IG1hcHBlZCB0byBwb3J0IDIgYW55d2F5Lgo+IAo+IAo+IElNSE8gaGF2aW5nIGNvbnNpc3Rl
bnQgbnVtYmVyaW5nIGFjcm9zcyBjb250cm9sbGVyIHR5cGVzIHdvdWxkIGJlCj4gYmV0dGVyLiBU
aGlzIGF2b2lkcyBtYWtpbmcgdGhlIFVTQiBjb3JlIGFuZCBodWIgY29kZSBkZWFsIHdpdGggbW9y
ZQo+IGV4Y2VwdGlvbnMsIGFuZCBhbHNvIGVhc2llciB0byB1bmRlcnN0YW5kIGFuZCB3cml0ZSBk
ZXZpY2UgdHJlZXMuCgpJIHdhcyBpbiB0aGUgaW1wcmVzc2lvbiB0aGUgcG9ydCBudW1iZXIgbm90
IG5lY2Vzc2FyaWx5IHJlZmxlY3RzCmFuIGFjdHVhbCBwaHlzaWNhbCBudW1iZXJpbmcsIGFuZCBj
YW4gYmUgYSBsb2dpY2FsIG51bWJlciB3ZSB3b3VsZAp0aGVuIG1hcCBpbiB0aGUga2VybmVsLgoK
SSBkb24ndCBzZWUgYW55IGlzc3VlIGhlcmUgaGF2aW5nIGJhc2UgMCBmb3IgdGhlIGJpbmRpbmdz
IGFuZCB0aGVuCmNvbnZlcnRpbmcgaXQgdG8gYmFzZSAxIGZvciB0aGUgWEhDSSBwb3J0IG51bWJl
cmluZy4KCkVhY2ggY29udHJvbGxlciAoSG9zdCwgRGV2aWNlLCBPVEcpIHdpbGwgaGF2ZSBpdCdz
IG93biBudW1iZXJpbmcgYW55d2F5LApzbyB1c2luZyB0aGUgWEhDSSBudW1iZXJpbmcgb25seSBz
b3VuZHMgYSBiYWQgaWRlYSBUQkguCgo+IAo+Pj4gUmVjb25jaWxlIHRoZSBkb3duc3RyZWFtIHBv
cnQgbnVtYmVyaW5nIHdpdGggdGhlIGNvbW1vbiBVU0IgaG9zdAo+Pj4gYmluZGluZywgcmVudW1i
ZXJpbmcgdGhlIGRvd25zdHJlYW0gcG9ydCBudW1iZXJzIGZyb20gMCBhbmQgMSB0bwo+Pj4gMSBh
bmQgMi4KPj4+Cj4+PiBUaGlzIGlzIG5vbi1iYWNrd2FyZHMgY29tcGF0aWJsZSwgaG93ZXZlciBp
dCB3b24ndCBicmVhayBjdXJyZW50Cj4+PiBtYWpvciBpbXBsZW1lbnRhdGlvbnM6Cj4+Pgo+Pj4g
LSBkd2MzICJnYWRnZXQgbW9kZSIgaW4gTGludXgga2VybmVsIG9ubHkgcmVxdWlyZXMgYSBjb25u
ZWN0aW9uIHRvIGJlCj4+PiAgICAgcHJlc2VudDsgaXQgZG9lc24ndCBtYXR0ZXIgd2hpY2ggcG9y
dCBpdCBpcwo+Pj4gICAgIC0gZHdjMyAiaG9zdCBtb2RlIiBPRiBncmFwaCBjb25uZWN0aW9ucyBh
cmVuJ3Qgc3VwcG9ydGVkIHlldCBbMV0KPj4+IC0gRnJlZUJTRCBkb2Vzbid0IHVzZSB0aGUgT0Yg
Z3JhcGggZm9yIGFueXRoaW5nCj4+PiAtIFUtYm9vdCBkb2Vzbid0IHVzZSB0aGUgT0YgZ3JhcGgg
Zm9yIFVTQgo+Pj4gLSBPcGVuQlNEIGRvZXNuJ3Qgc3VwcG9ydCBkd2MzLCBvbmx5IHRoZSBYSENJ
IGluIGR3YzMsIGFuZCBkb2Vzbid0IHVzZQo+Pj4gICAgIHRoZSBPRiBncmFwaCBmb3IgVVNCCj4+
PiAtIGNvcmVib290IGRvZXNuJ3QgdXNlIHRoZSBPRiBncmFwaCBmb3IgYW55dGhpbmcKPj4+IC0g
WmVwaHlyIGRvZXNuJ3Qgc3VwcG9ydCBkd2MzCj4+PiAtIFRGLUEgZG9lc24ndCB1c2UgdGhlIE9G
IGdyYXBoIGZvciBhbnl0aGluZwo+Pj4gLSBFREsyIGRvZXNuJ3Qgc3VwcG9ydCBkd2MzIGFuZCBk
b2Vzbid0IHN1cHBvcnQgT0YgZ3JhcGgKPj4+IC0gT1AtVEVFIGRvZXNuJ3Qgc3VwcG9ydCBkd2Mz
IGFuZCBkb2Vzbid0IHN1cHBvcnQgT0YgZ3JhcGgKPj4+Cj4+PiBbMV0gV0lQIHRvIHRpZSBPRiBn
cmFwaCBwb3J0IG5vZGUgdG8gVVNCIHBvcnQgZGV2aWNlCj4+Pgo+Pj4gRml4ZXM6IGEzMzExM2Y3
MzY5MyAoImR0LWJpbmRpbmdzOiB1c2I6IHNucHMsZHdjMzogZG9jdW1lbnQgSFMgJiBTUyBPRiBn
cmFwaCBwb3J0cyIpCj4+PiBTaWduZWQtb2ZmLWJ5OiBDaGVuLVl1IFRzYWkgPHdlbnN0QGNocm9t
aXVtLm9yZz4KPj4+IC0tLQo+Pj4gSXQgaXMgdW5jbGVhciB0byBtZSB3aGV0aGVyIHRoZSBIUy9T
UyBudW1iZXJpbmcgaXMgZml4ZWQgZm9yIGFsbCBkd2MzCj4+PiB2YXJpYW50cy4gSSBjaGVja2Vk
IEFsbHdpbm5lciBINjE2IGFuZCBSb2NrY2hpcCBSSzM1ODggYW5kIHRoZXkgYm90aAo+Pj4gaGF2
ZSBIUyBhcyBwb3J0IDEgYW5kIFNTIGFzIHBvcnQgMi4KPj4+Cj4+PiBUaGlzIGFsc28gZG9lc24n
dCBjb3ZlciBhIHBvdGVudGlhbCAibXVsdGktcG9ydCIgRFdDMyBpbXBsZW1lbnRhdGlvbiwKPj4+
IHdoaWNoIFF1YWxjb21tIHNlZW1zIHRvIGhhdmUuCj4+Cj4+IEl0IGJyZWFrcyB0aGUgY3VycmVu
dCBRdWFsY29tbSBudW1iZXJpbmcgb24gbnVtZXJvdXMgYm9hcmRzLgo+IAo+IFllcy4gSXQgYnJl
YWtzIF9ldmVyeW9uZV8gdXNpbmcgdGhlIGN1cnJlbnQgbnVtYmVyaW5nIGluIHRoZSBzZW5zZSB0
aGF0Cj4gdGhleSBhcmUgbm8gbG9uZ2VyIHZhbGlkLCBidXQgc2hvdWxkIG5vdCBhZmZlY3QgYWN0
dWFsIHVzYWdlLgoKT2xkZXIgRFQgYXJlIHN1cHBvc2VkIHRvIGJlIHdvcmtpbmcgb24gbmV3IGtl
cm5lbHMsIHlvdSB3aWxsIGJyZWFrIEFCSQphbmQgd2lsbCBicmVhayB1c2FnZSBpZiB0aGUgcG9y
dCBudW1iZXJpbmcgaXMgZW5mb3JjZWQgdG8gZW5hYmxlZCBlbWJlZGRlZApodWJzIGZvciBleGFt
cGxlLgoKTmVpbAoKPiAKPiBUaGlzIGNvbW1lbnQgcmVmZXJzIHRvICJtdWx0aXBvcnQiIGNvbnRy
b2xsZXJzIGZyb20gUXVhbGNvbW0gWzFdLCB3aGljaAo+IHdvdWxkIGhhdmUgcG9ydHMgYmV5b25k
IDEgYW5kIDIuCj4gCj4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI0MDQyMDA0
NDkwMS44ODQwOTgtOC1xdWljX2tyaXNrdXJhQHF1aWNpbmMuY29tLwo+IAo+IAo+Pj4gLS0tCj4+
PiAgICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL3NucHMsZHdjMy1jb21t
b24ueWFtbCB8IDQgKystLQo+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3VzYi9zbnBzLGR3YzMtY29tbW9uLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvdXNiL3NucHMsZHdjMy1jb21tb24ueWFtbAo+Pj4gaW5kZXggNmMw
YjhiNjUzODI0Li40YjYzMDRiZDJlYzEgMTAwNjQ0Cj4+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvdXNiL3NucHMsZHdjMy1jb21tb24ueWFtbAo+Pj4gKysrIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9zbnBzLGR3YzMtY29tbW9uLnlhbWwK
Pj4+IEBAIC00MTAsMTEgKzQxMCwxMSBAQCBwcm9wZXJ0aWVzOgo+Pj4gICAgICAgICAgcHJvcGVy
dHkgaXMgdXNlZC4KPj4+Cj4+PiAgICAgICAgcHJvcGVydGllczoKPj4+IC0gICAgICBwb3J0QDA6
Cj4+PiArICAgICAgcG9ydEAxOgo+Pj4gICAgICAgICAgICAkcmVmOiAvc2NoZW1hcy9ncmFwaC55
YW1sIy9wcm9wZXJ0aWVzL3BvcnQKPj4+ICAgICAgICAgICAgZGVzY3JpcHRpb246IEhpZ2ggU3Bl
ZWQgKEhTKSBkYXRhIGJ1cy4KPj4+Cj4+PiAtICAgICAgcG9ydEAxOgo+Pj4gKyAgICAgIHBvcnRA
MjoKPj4+ICAgICAgICAgICAgJHJlZjogL3NjaGVtYXMvZ3JhcGgueWFtbCMvcHJvcGVydGllcy9w
b3J0Cj4+PiAgICAgICAgICAgIGRlc2NyaXB0aW9uOiBTdXBlciBTcGVlZCAoU1MpIGRhdGEgYnVz
Lgo+Pj4KPj4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1h
bWxvZ2ljCg==
