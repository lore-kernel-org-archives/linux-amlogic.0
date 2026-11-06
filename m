Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789E9606D823
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Nov 2026 10:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mMwJ/KyN;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=tyhPt8PP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QX6w3Zy0Ie/bA4N4HylQwED+UEp/pPguz0LLZtybLTQ=; b=mMwJ/KyN3+gVwgqg54jcA4TkXk
	B+1mohh3Sc51nxsHhHh+v1y6uh3fFNvbuDcQVKorXnv8w3Buo9NnAlvQq2IWyEnB4WQi5uWimYyPT
	7cPDwf9d5m3CMuf/lRgreKsAOZmkm7C/3/5q5dC9uE5Z0OuJU8zAzd6HUCzbPySUFfyciAPBgeDnM
	QOTx5r89OZLD6GlYZb9kGMeqaw64anyVdTvqeyaFqSyUei/wPGsT8ebyXvhwI4nOwYu65DkKubZ38
	Bp3sRwCeRFNVK5umfQS/AngKRtZh3I1P7etELvhwiWvskX19p8KfBPrVVkVH19cZizpfq+3NGRnE+
	D0O2qqZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHbq-0000000C3jb-3E4u;
	Fri, 06 Nov 2026 10:55:50 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHbk-0000000C3hH-2IIA
	for linux-amlogic@lists.infradead.org;
	Fri, 06 Nov 2026 10:55:48 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso230542f8f.2
        for <linux-amlogic@lists.infradead.org>; Fri, 06 Nov 2026 02:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793962543; x=1794567343; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l/EtuhWrNppGiDVt+KKWYShvtLcO6NX4s7sOY4Stz8U=;
        b=tyhPt8PPG6TGQTJN1zdJ0YFkPwxuUuKrf2PXcW+ZP7e16puehNPfRMkryhQBtLzMeP
         SCq9jEUwcCw2UTKVbI/lOk4/1bndAhwx483o2z6KQnlFAJ3L+brj7iaRzlaXC4x8myYC
         dEZAQgjQ+FbB+keK8NWYz7wYp1civsAUgJWWooFxIXHUdBAkEOWAzzBUfeLLyz0H/7rj
         LJwYnj2Njz6PdWFJg3ZhpJ4YpS5Tv/U5tXbiweJmwk716bUENcbS4ogr2+dP6t/lxuSU
         eUFBRf7t8qJxsgVwWBu6S+tQP8wKIhXI/09iuBcgI+72Jedp60Jv2akvsxPEZOGGba6+
         1cOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793962543; x=1794567343;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=l/EtuhWrNppGiDVt+KKWYShvtLcO6NX4s7sOY4Stz8U=;
        b=vs6K0+SSUhJAAZpeAAw+xjz9bEjpCoAWJEr/h7SQi/n14GVJcRLGpARy56uDXdGJf7
         OdtBxoEcbu++xa1qNEYhxCUplVc6+IIxNE3FycfytUz65HUzkDVptsP4dCSUU6BWIfMN
         toVhtgprCxQh9XZgrJx3e6/ecB4Ozh7VqC8Ulj4luvuL6IoqIXFc604v5PZBSfqe1HVI
         QwQqindiPJ1liV4781mKnDGHhJ6yPhGeCtMkVe/d99/U0gP0LliIH8PEQDISPYhEfFWx
         sxr/kEJZht5T7QiGOzwYQPCbT3fS41RBjHtBW5NJu1CJJz687tYZHPWiHriPcHCYYatf
         R5RQ==
X-Forwarded-Encrypted: i=1; AL+hErHlcgPRCJDIuI6paMb3y/vSfTsk9HfYd6hSq6pS+v5oraw9B2JpLFBg/Xbrx9vZQq9Atatt4iUt3AcZ+GWM@lists.infradead.org
X-Gm-Message-State: APuU4Z/N2j/lxPaH/yhbeZ2E0gHtrQs+DJa7ufgbAYO4jwjP++ORPLk7
	1+6LnB7HnVTbPrL6AldwI2E0XI+L7kvXP/Si9CEo69Lt7dRM0p+qomBNCp9POlp8u+s=
X-Gm-Gg: AYBFou11QPSfj/343iVGsaIQRqg5cFUmEtoAFSdGc8iftuXklqmYvysdf/RBMQ+EWYT
	BvE2qOGgEYu7o0qxEWjFaT8AhmwDua61+jZN4ITq8xvZoJ0ekfmkaYpwO4moiiGMxD6FdPf9rJi
	gZXus4rUjfM2X89cdhp4nrutpddVuIK/EvaZRu+F/CzY9/gRMTGA1zcwv7a2yGHqb9VFUWNY/+C
	xPWXdBqaTYKz/yAhTH1TXMODoQk6bsEauON6UPqCIty3wodtdzDVUtBGVGxWH6jrcgss3GWbhCn
	GypPx8xyqSmBFDhS/o/rRSwnEuTM1BWw5yWHK/Tujr1stZzrbJ+PkIO/f0e9kdvnJNDCL9On7QR
	4VUOnCkOgZJE5b+HM3uY/QiLmOwX9N1hJCdfA5TZksUfoC33J7WEqrJIU3OuWrAZ3vKzaz/hZI7
	VhW3HnWwmEdMALZYWv15rgEIpFUML7sl8HkqgsnKef3Uy1mM5/XsMGkLcwMPKM4iULCAqZwRc8Y
	TFRgYkUK80qXbBEa/8PJOtgn9/6UGukQHRpil7GEnI0x/35paF9kSfaPfSX6YAjeDHo8jmV22rD
	I0S4CT3M5FLK3tqWJkoRq3lpwLorG+fveRYXm0lLlnFMT4QgExqst7Sdym6FsKBAqRYB6Futz2B
	bot/q+7gldxrnBBGeQzPkVazgGyPh2A==
X-Received: by 2002:a05:6000:4312:b0:48e:4300:c6d4 with SMTP id ffacd0b85a97d-492784552d7mr4914008f8f.53.1793962542588;
        Fri, 06 Nov 2026 02:55:42 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:9df2:2e39:58f0:72ca? ([2a01:e0a:106d:1080:9df2:2e39:58f0:72ca])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d6d63b79sm3100072f8f.20.2026.11.06.02.55.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 02:55:42 -0800 (PST)
Message-ID: <3018aa97-ba40-498b-8292-122476fbd3a5@linaro.org>
Date: Fri, 6 Nov 2026 11:55:41 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 09/10] arm64: dts: amlogic: meson-s4: add the AO CEC
 controller
To: christian.koever-draxl@student.uibk.ac.at, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 =?UTF-8?Q?Christian_Stefan_K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
References: <20261106104659.54656-1-christian.koever-draxl@student.uibk.ac.at>
 <20261106104659.54656-10-christian.koever-draxl@student.uibk.ac.at>
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
In-Reply-To: <20261106104659.54656-10-christian.koever-draxl@student.uibk.ac.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_025544_651947_A24BBFB2 
X-CRM114-Status: GOOD (  11.11  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gMTEvNi8yNiAxMTo0NiwgY2hyaXN0aWFuLmtvZXZlci1kcmF4bEBzdHVkZW50LnVpYmsuYWMu
YXQgd3JvdGU6Cj4gRnJvbTogQ2hyaXN0aWFuIFN0ZWZhbiBLw7Z2w6lyLURyYXhsIDxja29ldmVy
QG91dGxvb2suZGU+Cj4gCj4gQWRkIHRoZSBBT19DRUNfQSBjb250cm9sbGVyIGFuZCBpdHMgcGlu
IGdyb3VwLgo+IAo+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBTdGVmYW4gS8O2dsOpci1EcmF4
bCA8Y2tvZXZlckBvdXRsb29rLmRlPgo+IC0tLQo+ICAgYXJjaC9hcm02NC9ib290L2R0cy9hbWxv
Z2ljL21lc29uLXM0LmR0c2kgfCAyNCArKysrKysrKysrKysrKysrKysrKysrKwo+ICAgMSBmaWxl
IGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9i
b290L2R0cy9hbWxvZ2ljL21lc29uLXM0LmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9n
aWMvbWVzb24tczQuZHRzaQo+IGluZGV4IDE1NTk5NzY0OWRjMy4uZGQ1MWU3ODZkMjlkIDEwMDY0
NAo+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1zNC5kdHNpCj4gKysr
IGIvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLXM0LmR0c2kKPiBAQCAtNzQ3LDYg
Kzc0NywxNCBAQCBtdXggewo+ICAgCQkJCQl9Owo+ICAgCQkJCX07Cj4gICAKPiArCQkJCWFvX2Nl
Y19hX3BpbnM6IGFvLWNlYy1hIHsKPiArCQkJCQltdXggewo+ICsJCQkJCQlncm91cHMgPSAiYW9f
Y2VjX2EiOwo+ICsJCQkJCQlmdW5jdGlvbiA9ICJhb19jZWNfYSI7Cj4gKwkJCQkJCWJpYXMtZGlz
YWJsZTsKPiArCQkJCQl9Owo+ICsJCQkJfTsKPiArCj4gICAJCQl9Owo+ICAgCj4gICAJCQlncGlv
X2ludGM6IGludGVycnVwdC1jb250cm9sbGVyQDQwODAgewo+IEBAIC05NzAsNiArOTc4LDIyIEBA
IHNlY19hbzogYW8tc2VjdXJlQDEwMjIwIHsKPiAgIAkJCQlhbWxvZ2ljLGhhcy1jaGlwLWlkOwo+
ICAgCQkJfTsKPiAgIAo+ICsJCQljZWNfYTogY2VjQDQ0MDAwIHsKPiArCQkJCWNvbXBhdGlibGUg
PSAiYW1sb2dpYyxtZXNvbi1neC1hby1jZWMiOwo+ICsJCQkJcmVnID0gPDB4MCAweDQ0MDAwIDB4
MCAweDE0PjsKPiArCQkJCWludGVycnVwdHMgPSA8R0lDX1NQSSAxNzkgSVJRX1RZUEVfRURHRV9S
SVNJTkc+Owo+ICsJCQkJY2xvY2tzID0gPCZjbGtjX3BlcmlwaHMgQ0xLSURfQ0VDQV8zMktfQ0xL
T1VUPjsKPiArCQkJCWNsb2NrLW5hbWVzID0gImNvcmUiOwo+ICsJCQkJYXNzaWduZWQtY2xvY2tz
ID0gPCZjbGtjX3BlcmlwaHMgQ0xLSURfQ0VDQV8zMktfRElWPiwKPiArCQkJCQkJICA8JmNsa2Nf
cGVyaXBocyBDTEtJRF9DRUNBXzMyS19TRUxfUFJFPiwKPiArCQkJCQkJICA8JmNsa2NfcGVyaXBo
cyBDTEtJRF9DRUNBXzMyS19TRUw+Owo+ICsJCQkJYXNzaWduZWQtY2xvY2stcGFyZW50cyA9IDww
PiwKPiArCQkJCQkJCSA8JmNsa2NfcGVyaXBocyBDTEtJRF9DRUNBXzMyS19ESVY+LAo+ICsJCQkJ
CQkJIDwmY2xrY19wZXJpcGhzIENMS0lEX0NFQ0FfMzJLX1NFTF9QUkU+Owo+ICsJCQkJYXNzaWdu
ZWQtY2xvY2stcmF0ZXMgPSA8MzI3Njg+LCA8MD4sIDwwPjsKPiArCQkJCXN0YXR1cyA9ICJkaXNh
YmxlZCI7Cj4gKwkJCX07Cj4gKwo+ICAgCQkJaXI6IGlyQDg0MDQwIHsKPiAgIAkJCQljb21wYXRp
YmxlID0gImFtbG9naWMsbWVzb24tczQtaXIiOwo+ICAgCQkJCXJlZyA9IDwweDAgMHg4NDA0MCAw
eDAgMHgzMD47CgpSZXZpZXdlZC1ieTogTmVpbCBBcm1zdHJvbmcgPG5laWwuYXJtc3Ryb25nQGxp
bmFyby5vcmc+CgpUaGFua3MsCk5laWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LWFtbG9naWMK
