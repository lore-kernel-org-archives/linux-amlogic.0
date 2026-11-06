Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6EB606A32C
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Nov 2026 10:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aAC4+/jz;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=DfDlWLXg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xI8K0ArQZ+okS8vPAR9Zx/MaAT9Oy3F4J3/4YyVcm4s=; b=aAC4+/jz0HWMn+rSyfaEXiQv1Y
	VktzQGgtMy4jYyG61EvGPA3EQsls5VbOCShb48H2pRg+aD6nCLPX9OWDj2rLq0OlIbL5NQthcBTB2
	WFXUm5/qEh3lWE3XOHunwRyxwqaqwaWMxkW476mmw0qz6dLoYS0PjjbySnrq8cWA3a2YzBrvbMwD1
	u0cNKIedBrdrvsag36ulH0edQtA6ne8VC+Td1Cr1oKDrdmvRiQOPfNja8g64QDyQmFnTkGXJXrrXL
	+PVv/tORPK3xXcZXzJ0JyxpGbi4TR9LXB+EisZj9E+5hQwq0hBCYYHh7qN4ffznISp6GYjsR6Paw8
	vjBxs5cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHZB-0000000C2Wf-0Cwy;
	Fri, 06 Nov 2026 10:53:05 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHZ3-0000000C2SO-2LMl
	for linux-amlogic@lists.infradead.org;
	Fri, 06 Nov 2026 10:53:03 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so231977f8f.3
        for <linux-amlogic@lists.infradead.org>; Fri, 06 Nov 2026 02:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793962376; x=1794567176; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h6kLZ8i6rJjG0cT28y1NGxwCKUSmKTnRbGESAnsD4Hw=;
        b=DfDlWLXgcFs266cdVJb8qH6zKDj55yWP7dBOPuU8EhRyRYfPIaD1j0g+uEHETDoOCl
         HxhfadvCpVbo4pnVflyVGe01sb2Li8CwVJXeNs0Gh07RBMSBACi8BEc8oDyjymG2vqc0
         SApkAjsEGytriH4hW3EzcjRUQGXEGDYXTpgRVC2yNzi5EhS+6GdG42mvabig8GKPdTZN
         fWjSZd9P1yzw3Lzd806uKUYuFBNz6FmuMJjhv0FJ27FVh1tFmNlXCs0iGLU5gzWubc/v
         rCebOqnqmHoNiiqKwArXOrFHoz6/L/iv/S/o3xnx2WAswOcpVCK2Br4FaXpWj4Bwu3Ug
         Cytg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793962376; x=1794567176;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=h6kLZ8i6rJjG0cT28y1NGxwCKUSmKTnRbGESAnsD4Hw=;
        b=F+MZis1oj+wlRW3Ep77O/OwRtQ2wBye5f/oBIOnYWvg4GG6D0Aa0s8zmtzbyMZqgUC
         WC6RhfrAMXyQIg3ro+KEjhbcnX4TFW8InpwVSGmM2lb2jrc1zT9aLUXwR8Bcc9A/3R7r
         PgR5nqm9iBX878RPTF+Z9Cfs6Iy79+HQm0IWlDgqmqVWx98s5w+93vmUHf/ts3OQiTcl
         v25ZXnzQeZVO8sEcacuPIRx3jOwb5OgRz8DC4Sxd3AotXh7xOGqfLUkwxW9t1m3P4gqo
         hi72rzqfiJKtkffWPpzRq7YL7SF9QpGuJ+AaDLweURGaOfa9Mg5tRJC4We1250Vu44Il
         te/g==
X-Forwarded-Encrypted: i=1; AL+hErHr2xdtju0kwUnUbLrxPTtzOUWtwyjnmrFdixOxVky8NJxOiUrQyWb+SCga0TqSqOQp89sl1zwy5zRLadMi@lists.infradead.org
X-Gm-Message-State: APuU4Z+GnKu5Z2ekuUkx1ARttokPVmvjJbKTkfzKq1JO2bJZlkqR9c7y
	8NUbu3Q/SWH5q9W5umoSNR0xZTTX92hFXfWy3b04Gv+hXLnMa++PZ/UPNfru5XTi8uw=
X-Gm-Gg: AYBFou3N0Y6ZBohb3xhdSrrJFTiK6SDCK34lO4x+TMuT1t+19OSCkS3ZYw1xyZHk/H2
	jhGa1TpX8P31FShq5NPIfuFX/dYlMqJgoZLFjL0AklN0LwMXoNrsLxECJM7y5Cctkfq3PYTarz0
	IqC+75rYj/qVauI31lfMZN+pFoknPWN8BbtqEdSciWtqjZ2mYJXELqx5NL0Ry5hHCxdPExgDYec
	UAZbzciEcqYp+jdViO9Nx3QdzCxrQtAcxpCoh2bwnFFTqaQCKbTnDs2NvLMKiM0XKdAdg2grdWX
	beFgSK3zwxkUVOG88EkxxfxrMwCY0bC65UO1S9mgyks28w17MgbiRj576nYy0YrNVJXTiObRxaI
	zk26bLbHKULJRTWOVDu+gCkC+cvIVJqK4ePslg3IJbCYtyeSfyJigeF7D/IkwLlSmMxHIb4oy0s
	F5jZ9UMgFjguBlS8Oy8jXKnHvjlorhgkyIS0JK8b8bwJDKrYALcHcZO9/cvW66t7z3Dst2uANxl
	09HEh3BBtNyyka73Y+Rrl5GCMKQvyyi9x/8yhNJ3q5Pgu+m3DG8mSqbgekU6QemRwLVGSocZlmx
	y2skaIZWGlhY4eSi0e6f1xq28SM7t1uVFkPiUskJVtuW3z72amp38Nfpwd9H7LznrEoKpPnfzEP
	fuJBUVNU=
X-Received: by 2002:a05:6000:4a06:b0:48d:f034:7fcd with SMTP id ffacd0b85a97d-49278a136fbmr4487405f8f.51.1793962375440;
        Fri, 06 Nov 2026 02:52:55 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:9df2:2e39:58f0:72ca? ([2a01:e0a:106d:1080:9df2:2e39:58f0:72ca])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492fc80e017sm2563298f8f.34.2026.11.06.02.52.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 02:52:55 -0800 (PST)
Message-ID: <cd5c6354-58c2-4e41-b7b5-af1e2910be57@linaro.org>
Date: Fri, 6 Nov 2026 11:52:54 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 02/10] arm64: dts: amlogic: meson-s4: describe the CPU
 caches
To: christian.koever-draxl@student.uibk.ac.at, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 =?UTF-8?Q?Christian_Stefan_K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
References: <20261106104659.54656-1-christian.koever-draxl@student.uibk.ac.at>
 <20261106104659.54656-3-christian.koever-draxl@student.uibk.ac.at>
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
In-Reply-To: <20261106104659.54656-3-christian.koever-draxl@student.uibk.ac.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_025257_640403_BA87309F 
X-CRM114-Status: GOOD (  12.41  )
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
QG91dGxvb2suZGU+Cj4gCj4gRGVzY3JpYmUgdGhlIHBlci1jb3JlIEwxIGNhY2hlcyBhbmQgdGhl
IHNoYXJlZCA1MTIgS2lCIEwyIGNhY2hlLCB3aXRoCj4gdGhlIGdlb21ldHJ5IHRoZSBjb3JlcyBy
ZXBvcnQgaW4gQ0NTSURSX0VMMSBvbiBhbiBTOTA1VzIuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hy
aXN0aWFuIFN0ZWZhbiBLw7Z2w6lyLURyYXhsIDxja29ldmVyQG91dGxvb2suZGU+Cj4gLS0tCj4g
ICBhcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tczQuZHRzaSB8IDM4ICsrKysrKysr
KysrKysrKysrKysrKysrCj4gICAxIGZpbGUgY2hhbmdlZCwgMzggaW5zZXJ0aW9ucygrKQo+IAo+
IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tczQuZHRzaSBi
L2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1zNC5kdHNpCj4gaW5kZXggMmE2ZmJk
NTMwODM2Li42NzVkYjAyYThkNWUgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9h
bWxvZ2ljL21lc29uLXM0LmR0c2kKPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMv
bWVzb24tczQuZHRzaQo+IEBAIC0yMiw2ICsyMiwxMyBAQCBjcHUwOiBjcHVAMCB7Cj4gICAJCQlj
b21wYXRpYmxlID0gImFybSxjb3J0ZXgtYTM1IjsKPiAgIAkJCXJlZyA9IDwweDAgMHgwPjsKPiAg
IAkJCWVuYWJsZS1tZXRob2QgPSAicHNjaSI7Cj4gKwkJCWQtY2FjaGUtbGluZS1zaXplID0gPDY0
PjsKPiArCQkJZC1jYWNoZS1zaXplID0gPDB4ODAwMD47Cj4gKwkJCWQtY2FjaGUtc2V0cyA9IDwx
Mjg+Owo+ICsJCQlpLWNhY2hlLWxpbmUtc2l6ZSA9IDw2ND47Cj4gKwkJCWktY2FjaGUtc2l6ZSA9
IDwweDgwMDA+Owo+ICsJCQlpLWNhY2hlLXNldHMgPSA8MjU2PjsKPiArCQkJbmV4dC1sZXZlbC1j
YWNoZSA9IDwmbDI+Owo+ICAgCQl9Owo+ICAgCj4gICAJCWNwdTE6IGNwdUAxIHsKPiBAQCAtMjks
NiArMzYsMTMgQEAgY3B1MTogY3B1QDEgewo+ICAgCQkJY29tcGF0aWJsZSA9ICJhcm0sY29ydGV4
LWEzNSI7Cj4gICAJCQlyZWcgPSA8MHgwIDB4MT47Cj4gICAJCQllbmFibGUtbWV0aG9kID0gInBz
Y2kiOwo+ICsJCQlkLWNhY2hlLWxpbmUtc2l6ZSA9IDw2ND47Cj4gKwkJCWQtY2FjaGUtc2l6ZSA9
IDwweDgwMDA+Owo+ICsJCQlkLWNhY2hlLXNldHMgPSA8MTI4PjsKPiArCQkJaS1jYWNoZS1saW5l
LXNpemUgPSA8NjQ+Owo+ICsJCQlpLWNhY2hlLXNpemUgPSA8MHg4MDAwPjsKPiArCQkJaS1jYWNo
ZS1zZXRzID0gPDI1Nj47Cj4gKwkJCW5leHQtbGV2ZWwtY2FjaGUgPSA8JmwyPjsKPiAgIAkJfTsK
PiAgIAo+ICAgCQljcHUyOiBjcHVAMiB7Cj4gQEAgLTM2LDYgKzUwLDEzIEBAIGNwdTI6IGNwdUAy
IHsKPiAgIAkJCWNvbXBhdGlibGUgPSAiYXJtLGNvcnRleC1hMzUiOwo+ICAgCQkJcmVnID0gPDB4
MCAweDI+Owo+ICAgCQkJZW5hYmxlLW1ldGhvZCA9ICJwc2NpIjsKPiArCQkJZC1jYWNoZS1saW5l
LXNpemUgPSA8NjQ+Owo+ICsJCQlkLWNhY2hlLXNpemUgPSA8MHg4MDAwPjsKPiArCQkJZC1jYWNo
ZS1zZXRzID0gPDEyOD47Cj4gKwkJCWktY2FjaGUtbGluZS1zaXplID0gPDY0PjsKPiArCQkJaS1j
YWNoZS1zaXplID0gPDB4ODAwMD47Cj4gKwkJCWktY2FjaGUtc2V0cyA9IDwyNTY+Owo+ICsJCQlu
ZXh0LWxldmVsLWNhY2hlID0gPCZsMj47Cj4gICAJCX07Cj4gICAKPiAgIAkJY3B1MzogY3B1QDMg
ewo+IEBAIC00Myw2ICs2NCwyMyBAQCBjcHUzOiBjcHVAMyB7Cj4gICAJCQljb21wYXRpYmxlID0g
ImFybSxjb3J0ZXgtYTM1IjsKPiAgIAkJCXJlZyA9IDwweDAgMHgzPjsKPiAgIAkJCWVuYWJsZS1t
ZXRob2QgPSAicHNjaSI7Cj4gKwkJCWQtY2FjaGUtbGluZS1zaXplID0gPDY0PjsKPiArCQkJZC1j
YWNoZS1zaXplID0gPDB4ODAwMD47Cj4gKwkJCWQtY2FjaGUtc2V0cyA9IDwxMjg+Owo+ICsJCQlp
LWNhY2hlLWxpbmUtc2l6ZSA9IDw2ND47Cj4gKwkJCWktY2FjaGUtc2l6ZSA9IDwweDgwMDA+Owo+
ICsJCQlpLWNhY2hlLXNldHMgPSA8MjU2PjsKPiArCQkJbmV4dC1sZXZlbC1jYWNoZSA9IDwmbDI+
Owo+ICsJCX07Cj4gKwo+ICsJCS8qIEdlb21ldHJ5IGFzIENDU0lEUl9FTDEgcmVwb3J0cyBpdCBv
biBTOTA1VzIuICovCj4gKwkJbDI6IGwyLWNhY2hlMCB7Cj4gKwkJCWNvbXBhdGlibGUgPSAiY2Fj
aGUiOwo+ICsJCQljYWNoZS1sZXZlbCA9IDwyPjsKPiArCQkJY2FjaGUtdW5pZmllZDsKPiArCQkJ
Y2FjaGUtc2l6ZSA9IDwweDgwMDAwPjsgLyogTDIuIDUxMiBLQiAqLwo+ICsJCQljYWNoZS1saW5l
LXNpemUgPSA8NjQ+Owo+ICsJCQljYWNoZS1zZXRzID0gPDEwMjQ+Owo+ICAgCQl9Owo+ICAgCX07
Cj4gICAKClJldmlld2VkLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmVpbC5hcm1zdHJvbmdAbGluYXJv
Lm9yZz4KClRoYW5rcywKTmVpbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtYW1sb2dpYwo=
