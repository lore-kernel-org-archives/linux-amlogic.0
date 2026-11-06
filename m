Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA49606A32C
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Nov 2026 10:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BRQPmCJp;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=f/uXcEf+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BN65Ci46ZeJrwhEuA9PFmtg98LfWZZ2inN5mk9bCVcU=; b=BRQPmCJpglRJ+Ia0SKOufqgZ6l
	o0iwZ4jtyUerZ5p3ijBLnf20aF9WUNa0UVduUoKas6WWkNbcYQ7Ar59bAJgf0WbBkXkGNlqq4NWlG
	L/1aPW2uT6XzUJNtJLQx70OoNH+tGd8qdWRI95uSkbuy8faCGc2VDZUw4SUVczfz+aMCKjkspaOsv
	85On5txsqWRhqzfkxAKZEyCLle5M40WZGKl6BgypDg7Aa8HS1ZfvuX2Fk1ERBCRd592Zd/m4kg+qX
	MU9Jld5Jmj3zzIl+qZ1zLiJr55PWZhLDMbEDHRKyMgDI0++kgXN6t/HSww8I+HbkiqIb7y1SYp0Uj
	vzYQL4WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHaD-0000000C31F-0HU3;
	Fri, 06 Nov 2026 10:54:09 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHaA-0000000C2yw-1Nut
	for linux-amlogic@lists.infradead.org;
	Fri, 06 Nov 2026 10:54:07 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso3852625e9.0
        for <linux-amlogic@lists.infradead.org>; Fri, 06 Nov 2026 02:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793962444; x=1794567244; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WGZXSsiRoZs5M7Tq/hSmEqWmQ4g9AUNQW2RxywPyv0U=;
        b=f/uXcEf+35YGvAKMzbYmxoycRVGR5zt8b53Zx9WGwrbXScj8UdBcVI7UW2Fxn//q3a
         0qOplklVj65HWUBFkj0YS8GMNL3BRvTffom9gxRCMX6dRy5bjEoSPxUYMt4pauyzD8mF
         uPr0jkBOA6A0Goxgn1OWqhZpguj+c5eNV4FxB0YT1dNjAKorVf7GpvKIb1y/EYQma8TC
         Fw3F4ZP2TIdsK7JkUuwMAU+gHSGwB35DmQ9fCisP6oaXddruyZLBjV9mBcduwVEiFBNo
         YoDYqfbSFNeQHNSn4lVG0cUtgP967gWpPT8wa6iFGyJA7YXmAbP3J97aOgDVUnFRJP9E
         86iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793962444; x=1794567244;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WGZXSsiRoZs5M7Tq/hSmEqWmQ4g9AUNQW2RxywPyv0U=;
        b=PGRw5YVJ5drNNA3n8biaFuhpd32vCL8LxL8yql0JfhVIFWbVGyqsGby3DNtIMWjwJD
         wh4P4srJ7/4i9YaTjyqGpMPLy52b/7I0jEH5aft+IJn3pJaTaYSzbMpilwYWywnU+7Lh
         kRULPmyTLxfewYve+OYfzoBAgogPdYcvJ69bl1O57YksF4eZSIqSgrmBbxeoj4YuYZnB
         VJZOFNG0JK5liICv6/+MDzoMkCrnNcr/rMiyapQyF69R8UIAU3YT2jVg3wAvh3xLsLbP
         k090/n2atpUt2WKNavZ803ajMk7VtKYqqEScreiakwNcFt/338k0Sv4CnCJmsErjUVPs
         OPng==
X-Forwarded-Encrypted: i=1; AKwUvByz324EE1hoROLxN6UtDGNlG7jqjbU61NtPTxvNmGF3UMZSaKfF+7MziO2FAha9JjEOwTlmGqh6ns3ONNpY@lists.infradead.org
X-Gm-Message-State: APuU4Z9vCB5FFxjovmlzDoYxo/YAUaFvSVTiajWSJpwdbOLJraPrGgQa
	+CIvTd+cNdkc65bz+MizXpzRVgZOz7mBA25zdjbwYNXhwSGs1Zx/PX0UKsz/z6KKpCg=
X-Gm-Gg: AYBFou1iFYL4t9uq5oALEuehPQmH/FBRcXoLOG3VWT8VTmThQR16pbijJ0Ob0+a7vpf
	2xIHO/dJYETbxD6/hXJxnKc3ajPtHRAEg9J20r6gLj8FSE+gx3yXQkG17FDZvshE2FUbG6/JbpE
	bgV9Eep1xK/U1wA63X4UTFQCbi0xG2tkx9uYS2+yPIuMlyHcpDid2NVZ1YcIzouyyAAF6RT9r3u
	2LuefNbgrQjBhJzHuvGwECdg20pt0QFDeyuSMcy25cq4+YTdis+Vg2D/ef2S0xz6T1FAepc8+Qs
	sfO63gS3hI1A02fHhFttTsxMJR0WDobs1nq1izgfSCEXzVIHwRrA8xU9oGbNB5BC7Z0T23aep0P
	D8DG6ly4cB7uhAuB9UG4QxRPi8UGzcZvDNtKy9VI8qNPpsH952YUSpjbVY/cvK7ASkABRrbJaBj
	X4n5ZYEDvkOCDD/7WsLpdtHyWPWQdXKRnYr9tKO47js82Ptp3sPxOjHsgf62AUpvN+dLzKy7GHq
	jDCbn9dTfMzj60+mlejLs4pCeru6h0qiCfJcPP98wAifuQ0OZhSpQLUuonslptXQvJqFQZSGRUC
	lqGjzNyfHpMtIkCUq0Qi8/71ZHnjCnOCM0oN5dOpHBrqgZFi5wbC7HZlXamlbXvWcOVGPMEpliR
	qP1YRhM7H
X-Received: by 2002:a05:600c:8b33:b0:4a2:267:25b3 with SMTP id 5b1f17b1804b1-4b6e0edffd5mr33716705e9.35.1793962444315;
        Fri, 06 Nov 2026 02:54:04 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:9df2:2e39:58f0:72ca? ([2a01:e0a:106d:1080:9df2:2e39:58f0:72ca])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4932901d9c9sm2031660f8f.59.2026.11.06.02.54.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 02:54:04 -0800 (PST)
Message-ID: <608dd5f2-4136-4f3e-8546-2242f43cfbaf@linaro.org>
Date: Fri, 6 Nov 2026 11:54:03 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 03/10] arm64: dts: amlogic: meson-s4: add the PSCI CPU
 idle state
To: christian.koever-draxl@student.uibk.ac.at, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 =?UTF-8?Q?Christian_Stefan_K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
References: <20261106104659.54656-1-christian.koever-draxl@student.uibk.ac.at>
 <20261106104659.54656-4-christian.koever-draxl@student.uibk.ac.at>
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
In-Reply-To: <20261106104659.54656-4-christian.koever-draxl@student.uibk.ac.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_025406_404176_490A4470 
X-CRM114-Status: GOOD (  16.00  )
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
QG91dGxvb2suZGU+Cj4gCj4gVGhlIGZpcm13YXJlIGltcGxlbWVudHMgUFNDSSAxLjAgd2l0aG91
dCBPUy1pbml0aWF0ZWQgbW9kZS4gQWRkIHRoZQo+IGNvcmUgcG93ZXItZG93biBzdGF0ZSB0aGUg
dmVuZG9yIGtlcm5lbCB1c2VzIChwb3dlciBzdGF0ZSAweDEwMDAwKS4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBDaHJpc3RpYW4gU3RlZmFuIEvDtnbDqXItRHJheGwgPGNrb2V2ZXJAb3V0bG9vay5kZT4K
PiAtLS0KPiAgIGFyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1zNC5kdHNpIHwgMjQg
KysrKysrKysrKysrKysrKysrKysrKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCAyNCBpbnNlcnRpb25z
KCspCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1z
NC5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLXM0LmR0c2kKPiBpbmRl
eCA2NzVkYjAyYThkNWUuLjU3MjcwZmJmYjRhNyAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybTY0L2Jv
b3QvZHRzL2FtbG9naWMvbWVzb24tczQuZHRzaQo+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMv
YW1sb2dpYy9tZXNvbi1zNC5kdHNpCj4gQEAgLTIyLDYgKzIyLDcgQEAgY3B1MDogY3B1QDAgewo+
ICAgCQkJY29tcGF0aWJsZSA9ICJhcm0sY29ydGV4LWEzNSI7Cj4gICAJCQlyZWcgPSA8MHgwIDB4
MD47Cj4gICAJCQllbmFibGUtbWV0aG9kID0gInBzY2kiOwo+ICsJCQljcHUtaWRsZS1zdGF0ZXMg
PSA8JmNwdV9zbGVlcD47Cj4gICAJCQlkLWNhY2hlLWxpbmUtc2l6ZSA9IDw2ND47Cj4gICAJCQlk
LWNhY2hlLXNpemUgPSA8MHg4MDAwPjsKPiAgIAkJCWQtY2FjaGUtc2V0cyA9IDwxMjg+Owo+IEBA
IC0zNiw2ICszNyw3IEBAIGNwdTE6IGNwdUAxIHsKPiAgIAkJCWNvbXBhdGlibGUgPSAiYXJtLGNv
cnRleC1hMzUiOwo+ICAgCQkJcmVnID0gPDB4MCAweDE+Owo+ICAgCQkJZW5hYmxlLW1ldGhvZCA9
ICJwc2NpIjsKPiArCQkJY3B1LWlkbGUtc3RhdGVzID0gPCZjcHVfc2xlZXA+Owo+ICAgCQkJZC1j
YWNoZS1saW5lLXNpemUgPSA8NjQ+Owo+ICAgCQkJZC1jYWNoZS1zaXplID0gPDB4ODAwMD47Cj4g
ICAJCQlkLWNhY2hlLXNldHMgPSA8MTI4PjsKPiBAQCAtNTAsNiArNTIsNyBAQCBjcHUyOiBjcHVA
MiB7Cj4gICAJCQljb21wYXRpYmxlID0gImFybSxjb3J0ZXgtYTM1IjsKPiAgIAkJCXJlZyA9IDww
eDAgMHgyPjsKPiAgIAkJCWVuYWJsZS1tZXRob2QgPSAicHNjaSI7Cj4gKwkJCWNwdS1pZGxlLXN0
YXRlcyA9IDwmY3B1X3NsZWVwPjsKPiAgIAkJCWQtY2FjaGUtbGluZS1zaXplID0gPDY0PjsKPiAg
IAkJCWQtY2FjaGUtc2l6ZSA9IDwweDgwMDA+Owo+ICAgCQkJZC1jYWNoZS1zZXRzID0gPDEyOD47
Cj4gQEAgLTY0LDYgKzY3LDcgQEAgY3B1MzogY3B1QDMgewo+ICAgCQkJY29tcGF0aWJsZSA9ICJh
cm0sY29ydGV4LWEzNSI7Cj4gICAJCQlyZWcgPSA8MHgwIDB4Mz47Cj4gICAJCQllbmFibGUtbWV0
aG9kID0gInBzY2kiOwo+ICsJCQljcHUtaWRsZS1zdGF0ZXMgPSA8JmNwdV9zbGVlcD47Cj4gICAJ
CQlkLWNhY2hlLWxpbmUtc2l6ZSA9IDw2ND47Cj4gICAJCQlkLWNhY2hlLXNpemUgPSA8MHg4MDAw
PjsKPiAgIAkJCWQtY2FjaGUtc2V0cyA9IDwxMjg+Owo+IEBAIC04Miw2ICs4NiwyNiBAQCBsMjog
bDItY2FjaGUwIHsKPiAgIAkJCWNhY2hlLWxpbmUtc2l6ZSA9IDw2ND47Cj4gICAJCQljYWNoZS1z
ZXRzID0gPDEwMjQ+Owo+ICAgCQl9Owo+ICsKPiArCQkvKgo+ICsJCSAqIFRoZSBmaXJtd2FyZSBy
ZXBvcnRzIFBTQ0kgMS4wIHdpdGhvdXQgT1NJLCBzbyB0aGUgcGxhdGZvcm0KPiArCQkgKiBpdHNl
bGYgZGVjaWRlcyBob3cgZGVlcCB0byBnbyBhbmQgdGhlIGtlcm5lbCBvbmx5IGhhcyB0aGlzCj4g
KwkJICogb25lIGNvcmUgc3RhdGUgdG8gb2ZmZXIuIFRoZSBzdXNwZW5kIHBhcmFtZXRlciBpcyBp
biB0aGUKPiArCQkgKiBvcmlnaW5hbCBmb3JtYXQgLSBiaXQgMTYgYXNrcyBmb3IgYSBwb3dlciBk
b3duIGF0IGFmZmluaXR5Cj4gKwkJICogbGV2ZWwgMCAtIGFuZCBtYXRjaGVzIHdoYXQgdGhlIHZl
bmRvciBrZXJuZWwgcGFzc2VzLgo+ICsJCSAqLwoKRHJvcCB0aGlzIGNvbW1lbnQgYW5kIG1vdmUg
aXQgdG8gdGhlIGNvbW1pdCBtZXNzYWdlCgo+ICsJCWlkbGUtc3RhdGVzIHsKPiArCQkJZW50cnkt
bWV0aG9kID0gInBzY2kiOwo+ICsKPiArCQkJY3B1X3NsZWVwOiBjcHUtc2xlZXAgewo+ICsJCQkJ
Y29tcGF0aWJsZSA9ICJhcm0saWRsZS1zdGF0ZSI7Cj4gKwkJCQlhcm0scHNjaS1zdXNwZW5kLXBh
cmFtID0gPDB4MDAwMTAwMDA+Owo+ICsJCQkJbG9jYWwtdGltZXItc3RvcDsKPiArCQkJCWVudHJ5
LWxhdGVuY3ktdXMgPSA8NDAwMD47Cj4gKwkJCQlleGl0LWxhdGVuY3ktdXMgPSA8NTAwMD47Cj4g
KwkJCQltaW4tcmVzaWRlbmN5LXVzID0gPDEwMDAwPjsKPiArCQkJfTsKPiArCQl9Owo+ICAgCX07
Cj4gICAKPiAgIAl0aW1lciB7CgpXaXRoIHRoYXQ6ClJldmlld2VkLWJ5OiBOZWlsIEFybXN0cm9u
ZyA8bmVpbC5hcm1zdHJvbmdAbGluYXJvLm9yZz4KClRoYW5rcywKTmVpbAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5n
IGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
