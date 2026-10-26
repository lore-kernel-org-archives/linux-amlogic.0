Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F71606A320
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Oct 2026 08:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mYc9qXyj;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=vN9tbcqZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=shX3MDapNhwf4Q3w/Mw/syD5b8k/N9FlW0fxaca44OA=; b=mYc9qXyjkvE6vHGxEcaDdD74LM
	zYmgJgfuk1VW+FaySO335xcOopmuZoX7VCQi/OY2S4nYhlx/VtgRc5GfaE1sLsiZzvHwBQBl3o34p
	hzVnDiJIay9K3qq5xbRtyrx34KtztlC3d1Q4fJ1/ocC6RYNO4Uc1zAT28aWd7RjpniMKkVK7en+Vf
	mTZxU4DX7tltPLP4aQcl2VwCOG7aCyo17ub/qTy/gHY3LC49Fp2U8eSO3Vgxfzd4TVuhYeQfbtpPL
	os6Qhj5G6oGlHvYYSPV0f+PB4a/Dgr0rPWAGPuNn9G8nGjm3CteVuZvpUASEzi3JrV9KMXZ8JquDC
	ymMQaGtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLGLG-00000001ykg-0cPK;
	Mon, 26 Oct 2026 08:46:06 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLGLD-00000001yjI-3MDp
	for linux-amlogic@lists.infradead.org;
	Mon, 26 Oct 2026 08:46:05 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so16677975e9.2
        for <linux-amlogic@lists.infradead.org>; Mon, 26 Oct 2026 01:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793004361; x=1793609161; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xx6QZm0MpIiWVJS1fPo0ifp1Q7/9tPC6QD5e4OqszSM=;
        b=vN9tbcqZUi5b4voR5If2+6C76MbiWhjnxecdYp/4PEZXVuS7l+pS473jCD3eSt92iy
         TLPHPE4vmNJCH3iSWoqWzDPHGpQd2dt3QKkMdr3M1Wh3qW1DwOAvC6WD54pw8hLDVDPS
         UGV6KRXNBE/erFG/OARDCnXkm+UPuM5WfRCit/cvWExDj8HfdwfpqkTP5rAcE+Y7HctU
         WopFugHiAd3V5l+C13o7qe7EFGG17HyNwDRnTq21ZYGOx3cCbRdmQUCr1naGig5a/pZH
         I/2N61qF5ASYx2a1iCffVKnCaT/zgN2czYl81brLuCyU9wXHtX8Q3OW9M8Re7J5a6bgX
         R02Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793004361; x=1793609161;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xx6QZm0MpIiWVJS1fPo0ifp1Q7/9tPC6QD5e4OqszSM=;
        b=gGTpdw5bB8H62EeukSqDQg7TpgKtfadMNLA2Z9x7/cmL/WqWwoYnr6VKc8MlZFUMEm
         2f4hqhVlod3KotEEdhrEo/Y0jVGFAd0dH2dMp2c7uLDox+X9C3gXtOjH3AnMPw4sN8gm
         7/AK+5b+n3OI3OBhdPXW/zedS6M8h23HdA1A6q3LmYlIYbzihljUF7azz1dVvPTxzWAL
         xcFtgFdFVnajrC6LucDh9/1tFDhB6cZf7ifgJDyl0hmFLC//TcACoYnlD8zLwzubo3Rk
         17IxEdB9TdNt+JUGId4u3CSnYwinPloNB8eT+sXXq2J5fEvlRC5kuY0TR8hLO6zVlTEa
         qt5g==
X-Forwarded-Encrypted: i=1; AKwUvBzvqODDqsfSQkwBrf1q7xHgQfMm/ydB4CkarxTSWGEoCfPRqG4w4uBWvq82+Dqnxgs0uKwPu+nlc9UqnwRv@lists.infradead.org
X-Gm-Message-State: AFq9FYKiKkcsfCQ/+zMgzEF/V/77aI/Dp2OmRRIbgxLtCin14bHz21ud
	LFELB9x2f2i20nK/VYGfYVsVsnC+KSdRdybMyhduCYzKaAJW0RP8yWchSCjXwoZAzy4=
X-Gm-Gg: AYBFou152yh2om3kyWidbc+xaS82VJiJvCf2zdLs+pQvaTzvAn3xlIEYPy/9avKGfu/
	HfIVv60p6Ho8oe05agB88xHXODQDJ4BDzaHVFg751+V1c1BnAWs0hj4MoGp5bnQHgZkLxIWM/P8
	IQ6+5NdDIGMEjdPVmK1TaMegbnv9yl4+n2ykwIthYbWdKKzn2KYgb9UUZM/ddN+VJ/LyQs8O0DS
	wKqU5JGkNarAacOk+UoMgq7dzfmsqgQA5eZgje5iGaS0TGLRzv3yNV0qPljVs2qctGiqiStVWQo
	rmLvsUJ0a4V5xeHxouPa/NwTMWPoiP76VvL7T/HLxVv+yceFQqG/lgikCpW42fZD44FyEpf6NYZ
	b7nR4BQyc33AiJWj6xkZlgnSOcrsSHMEFG5XV3kgg7Gl+GAlbL8JxmkEH/DDPpeb906HI+xOhf1
	HJux/gOHxrPN4KxplolW2zLcLC7TVq67gHx6IwkwTAJSRFLgc3yBY2fa3Du/NmSZ+whEAVSw8GU
	BbUweEn3JCgdU5SEOjfu4JqptZN5wmV33oA5jbaCKufixKUYiRWRNypTe1leAfTJ8ima7idq9Qc
	rnIXd0G3nmCKYfILvlQ8kMcN5T56XBWjXdAnvixkxNNPDtChpQQW49pJCQ==
X-Received: by 2002:a05:600d:8:b0:4a5:ef46:1603 with SMTP id 5b1f17b1804b1-4a5ef461bc1mr39933435e9.30.1793004361333;
        Mon, 26 Oct 2026 01:46:01 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:d07e:c128:5c21:78f2? ([2a01:e0a:106d:1080:d07e:c128:5c21:78f2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f25fsm14707652f8f.2.2026.10.26.01.46.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 01:46:00 -0700 (PDT)
Message-ID: <151f4185-c7d6-4ccc-a320-7b77ff89b859@linaro.org>
Date: Mon, 26 Oct 2026 09:46:03 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] dt-bindings: media: amlogic,axg-ge2d: add S4 support
To: christian.koever-draxl@student.uibk.ac.at, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Christian_Stefan_K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
References: <20261025192302.209354-1-christian.koever-draxl@student.uibk.ac.at>
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
In-Reply-To: <20261025192302.209354-1-christian.koever-draxl@student.uibk.ac.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_014603_879326_1142C29D 
X-CRM114-Status: GOOD (  20.67  )
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
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gMTAvMjUvMjYgMjA6MjMsIGNocmlzdGlhbi5rb2V2ZXItZHJheGxAc3R1ZGVudC51aWJrLmFj
LmF0IHdyb3RlOgo+IEZyb206IENocmlzdGlhbiBTdGVmYW4gS8O2dsOpci1EcmF4bCA8Y2tvZXZl
ckBvdXRsb29rLmRlPgo+IAo+IFRoZSBTNCBHRTJEIGlzIGNvbXBhdGlibGUgd2l0aCB0aGUgQVhH
IG9uZSwgYnV0IHNpdHMgaW4gYSBwb3dlciBkb21haW4KPiBvZiBpdHMgb3duLiBBZGQgYW4gUzQg
Y29tcGF0aWJsZSB3aXRoIHRoZSBBWEcgb25lIGFzIGZhbGxiYWNrLCBhbmQKPiBhbGxvdyBhIHBv
d2VyIGRvbWFpbi4KClRoZSBBWEcgR0UyRCBpcyBhIHNwZWNpYWwgdmVyc2lvbiBmb3IgQVhHIHdo
aWNoIGRvZXNuJ3QgdXNlIHRoZSBDYW52YXMKdG8gcmVhZCBhbmQgd3JpdGUgYnVmZmVycywgc28g
aXQgbWF5IHdvcmsgb24gUzQgYnV0IHRoZXkgYXJlIG5vdCBzdHJpY2x5CmNvbXBhdGlibGUuCgpT
byBwbGVhc2UgYWRkIGEgc2VwYXJhdGUgY29tcGF0aWJsZSBlbnRyeSBhbmQgZHJvcCB0aGUgZmFs
bGJhY2suCgpOZWlsCgo+IAo+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBTdGVmYW4gS8O2dsOp
ci1EcmF4bCA8Y2tvZXZlckBvdXRsb29rLmRlPgo+IC0tLQo+IFRvb2wgdXNlIChEb2N1bWVudGF0
aW9uL3Byb2Nlc3MvZ2VuZXJhdGVkLWNvbnRlbnQucnN0KToKPiBUaGlzIHdvcmsgd2FzIGRvbmUg
d2l0aCB0aGUgaGVscCBvZiBhbiBBSSBjb2RpbmcgYXNzaXN0YW50LCBDbGF1ZGUKPiAoQW50aHJv
cGljKSwgdXNlZCB0aHJvdWdoIENsYXVkZSBDb2RlIG92ZXIgbWFueSBzZXNzaW9ucy4gSXQgZGlk
IGEgbGFyZ2UKPiBwYXJ0IG9mIHRoZSBoYW5kcy1vbiB3b3JrOiBpdCByZWFkIHRoZSB2ZW5kb3Ig
a2VybmVsIGFuZCB0aGUgZmlybXdhcmUKPiBpbnRlcmZhY2VzLCBwcm9iZWQgcmVnaXN0ZXJzIG9u
IHRoZSBib2FyZCwgZHJhZnRlZCB0aGUgY29kZSBhbmQgdGhlCj4gY2hhbmdlbG9ncywgYW5kIHJh
biB0aGUgYnVpbGRzLCBjaGVja3BhdGNoLCBkdF9iaW5kaW5nX2NoZWNrIGFuZCB0aGUKPiB0ZXN0
cyBvbiB0aGUgaGFyZHdhcmUuIEkgZGlyZWN0ZWQgdGhlIHdvcmssIHJldmlld2VkIGV2ZXJ5IGNo
YW5nZSBhbmQKPiB0aGUgZmluYWwgcGF0Y2hlcywgYW5kIHRha2UgcmVzcG9uc2liaWxpdHkgZm9y
IHRoZW0uIFRoZXJlIGlzIG5vIHNpbmdsZQo+IHByb21wdCB0byBxdW90ZTsgdGhlIHNlc3Npb25z
IHdlcmUgb2YgdGhlIGZvcm0gImZpbmQgb3V0IHdoeSBYIGZhaWxzIG9uCj4gdGhpcyBib2FyZCwg
Zml4IGl0LCB0ZXN0IGl0IG9uIHRoZSBib3giLgo+IAo+IFRlc3RlZCBvbiBhbiBBbWVkaWF0ZWNo
IFg5OFEgVFYgYm94IChBbWxvZ2ljIFM5MDVXMiwgUzQgZmFtaWx5LCAyIEdpQiksCj4gdmVuZG9y
IFUtQm9vdCBhbmQgQkwzMS9PUC1URUUsIExpbnV4IDcuMyBwbHVzIHRoaXMgd29yay4KPiAKPiAg
IC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL2FtbG9naWMsYXhnLWdlMmQueWFtbCAgICB8
IDEwICsrKysrKysrLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9tZWRpYS9hbWxvZ2ljLGF4Zy1nZTJkLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvbWVkaWEvYW1sb2dpYyxheGctZ2UyZC55YW1sCj4gaW5kZXggZjIzZmE2ZDA2
YWQwLi4yMmRlY2I2Nzg3OWQgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL21lZGlhL2FtbG9naWMsYXhnLWdlMmQueWFtbAo+ICsrKyBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9hbWxvZ2ljLGF4Zy1nZTJkLnlhbWwKPiBAQCAt
MTIsOCArMTIsMTEgQEAgbWFpbnRhaW5lcnM6Cj4gICAKPiAgIHByb3BlcnRpZXM6Cj4gICAgIGNv
bXBhdGlibGU6Cj4gLSAgICBlbnVtOgo+IC0gICAgICAtIGFtbG9naWMsYXhnLWdlMmQKPiArICAg
IG9uZU9mOgo+ICsgICAgICAtIGNvbnN0OiBhbWxvZ2ljLGF4Zy1nZTJkCj4gKyAgICAgIC0gaXRl
bXM6Cj4gKyAgICAgICAgICAtIGNvbnN0OiBhbWxvZ2ljLHM0LWdlMmQKPiArICAgICAgICAgIC0g
Y29uc3Q6IGFtbG9naWMsYXhnLWdlMmQKPiAgIAo+ICAgICBpbnRlcnJ1cHRzOgo+ICAgICAgIG1p
bkl0ZW1zOiAxCj4gQEAgLTI3LDYgKzMwLDkgQEAgcHJvcGVydGllczoKPiAgICAgY2xvY2tzOgo+
ICAgICAgIG1pbkl0ZW1zOiAxCj4gICAKPiArICBwb3dlci1kb21haW5zOgo+ICsgICAgbWF4SXRl
bXM6IDEKPiArCj4gICByZXF1aXJlZDoKPiAgICAgLSBjb21wYXRpYmxlCj4gICAgIC0gcmVnCj4g
Cj4gYmFzZS1jb21taXQ6IDdiZTRiYzUyZmQ5ZTBlNTVkYzlhMmUwMjMyYjg5NDI3ZDJjNGI2MTQK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1h
bWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==
