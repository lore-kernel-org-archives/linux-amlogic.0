Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CFA5C83F1B
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Jul 2025 07:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DjD3qdXsvyhoQYx6itrOQ6K8nlGPHOEoPpiP0i8IvHc=; b=2h1spDPT8tvHpy
	D2yK/tFoF2qs5+H3qQiNb0gvuBq0oqIf3LACWys/9pnCp4t9IxIAdq62lZ/U4t3zHPk8TNLYy90tI
	iutIQ1nmKTy911ThJHASL7tMw33AdtVcnf6GRQfEqo+3HTbCU/+dMznBofkt5tvY+FXVJbz2IMO8g
	U/6r0hppSn0Xuf4atEEICDNGPf/LdW5I/kFhJPSKH3+W6hUnNmuz9AUUIUejc9EGluwn4MXqNUnFK
	kLGv5ncbXvZTK0aQlQT0BmWBIVxAhPKQQzchrivww2UFmyARccv6DspCQKqkdVFG8wzhMwfY+AUgs
	a+bYJjU0Fubl5LiXHAdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubwkl-000000072Qm-0f5C;
	Wed, 16 Jul 2025 07:40:35 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubwib-000000072Ez-2HDw
	for linux-amlogic@lists.infradead.org;
	Wed, 16 Jul 2025 07:38:22 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4550709f2c1so33434855e9.3
        for <linux-amlogic@lists.infradead.org>; Wed, 16 Jul 2025 00:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752651499; x=1753256299; darn=lists.infradead.org;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JTZyE17KIP8MeS2UO3NBP08211fLukiUHXp1mSFEsMA=;
        b=Ldwbr91D5KSNQx7lPLctIAEW5aJruZv7jkE/TagywBQFDyu6Sqi9dOkRYH8M4Sf9To
         tJcJQt+rIQ4neXpaPVMJem6vkdFS3XT4H7TH4dUMF24IHm07DV2Z8qu4VnkmRdeMERMi
         BOK7SFS3h850oYFiXGn2ULd2rSmfj4+E7ZPn+x4LQC0Eg6Jz872KM8B3lh20BMBgZj0a
         QhGK4vxO8vxWTKmj48rUFcdUnHC8cBftxuaC/Hxa8pjNh7+asQmSyClaPhkfc+ceSBoa
         QNw0N7vg1awoNDsUu03onw4wAAL7xPOL8ticBSGSaqj5AVbqlxwFyVyZLLavemQSBXn8
         gfpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752651499; x=1753256299;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JTZyE17KIP8MeS2UO3NBP08211fLukiUHXp1mSFEsMA=;
        b=PEY/KsVYSsWhkGQ/XONyOJgS/YOYu585dJO9kInSumQtN+rYXPv4zOlA8IjinfPgPW
         4CZlSjRwT4cBj1VfXVyTHsYFOqno5XTLKTMYHosfIQfS/ivGm6ZBKFlB1q5YbUQq/GnR
         GQK71o0EsB91U50XKIM1WllSk+1q6bfN78Kgt81XQij9APHk65leWzzfzD/pJSlh5mgn
         FQ0BANpjlijBPAYlztqcKN6JbRmYpfsAK+tjTQ33GWC60YzTFDxThUNxD/gTpNN32F/s
         NDRcQHB6Vya1Grczp7uGA+HRD4UXjbe9mperhMxH4PSGikn0T7hZJWfx91im0JPor6o/
         QkoQ==
X-Gm-Message-State: AOJu0YwNBTaiK7ch8i/QDW5bt0BN0tg1niYMthcnFxHIhz27vEfhW+Ya
	kajKq7HdQRUkTQb0COKLvQSFJ6wovUPdM7Pdse6om/CRe8qNp5opbenfpZXmyk96TqA=
X-Gm-Gg: ASbGncs5odQ/suCFMGZWYNRp2eHpofIf7HBfHHtqX8PoGgQuewyp3iz7y3bBcsPfCun
	dGjAOsqldCteci9uopJwYS6WCv3O43ZGvkCQkneWbvsJqLABy+0eOkG1gwPYdoVXl8TQk8o0/AJ
	u+ivk72vPMfuXyREi+PQYufCGuypTFYSZIkDlN/KUT6PhhL6pq/VB2kbbrj4e/4MJYIoG4FojNj
	1isjeomactYHy11tRUBU7LYTO7jCyiI2qsdVyxynD4EWJcyF+q2u/YdZ6khUh0h7Zg4XOn69pK2
	IQ6D//tTFPu1INhoBPY5LQB7Xs7eZrxH+Xn3Rg/KbMIo2gMHPnpmAPFdTJpFGFXvzB8LQqg1H6R
	O+pwa71+bXIGDnBf5Rwh72gd3f/wJGZknACr3ZkXf/xN5L8j3AspD/hG+I7f9wSygufpJBjHDJ1
	s=
X-Google-Smtp-Source: AGHT+IF5VHjUdfZNwYUlg6vQGhBqdvVW29xEpVXshvZF1iijy/MsoFJlMDLl1aBwa+n3fGJrEvN4ig==
X-Received: by 2002:a05:600c:3b29:b0:453:7713:546a with SMTP id 5b1f17b1804b1-4562f164b1bmr11491165e9.14.1752651499326;
        Wed, 16 Jul 2025 00:38:19 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:91d5:1399:613c:fd4a? ([2a01:e0a:3d9:2080:91d5:1399:613c:fd4a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8e1e135sm17207431f8f.72.2025.07.16.00.38.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jul 2025 00:38:19 -0700 (PDT)
Message-ID: <3d93b621-9544-4a68-85db-6f87a9e8fa5c@linaro.org>
Date: Wed, 16 Jul 2025 09:38:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic ARM64 DT updates for v6.17
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_003821_580642_4A35E909 
X-CRM114-Status: UNSURE (   9.28  )
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGksCgpIZXJlJ3Mgc21hbGwgYnV0IGxhdGUgUFIgZm9yIHRoZSBBbWxvZ2ljIEFSTTY0IERUIGNo
YW5nZXMsIGFkZGluZyB0aGUgUzkxMiBiYXNlZCBVZ29vcyBBTTMKYm9hcmQsIGFkZGluZyBwaW5j
dHJsIHN1cHBvcnQgZm9yIG5ldyBTb0NzIGFuZCBmaW5hbGx5IGVuYWJsaW5nIHRoZSBOUFUgb24g
dGhlIEFsdGEKYW5kIFZJTTMgQW1sb2dpYyBHMTJCIGJhc2VkIGJvYXJkcyBub3cgdGhlIGtlcm5l
bCBkcml2ZXIgYW5kIHVzZXJzcGFjZSBtZXNhIHN1cHBvcnRzCnRoZSBOUFUgY29ycmVjdGx5LgoK
VGhhbmtzLApOZWlsCgpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IDE5MjcyYjM3
YWE0ZjgzY2E1MmJkZjljMTZkNWQ4MWJkZDEzNTQ0OTQ6CgogICBMaW51eCA2LjE2LXJjMSAoMjAy
NS0wNi0wOCAxMzo0NDo0MyAtMDcwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0
b3J5IGF0OgoKICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9n
aXQvYW1sb2dpYy9saW51eC5naXQgdGFncy9hbWxvZ2ljLWFybTY0LWR0LWZvci12Ni4xNwoKZm9y
IHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDU4N2MxYzAwZjc1NTY1NTY3ZDFmMjZhMzMzYTMz
OTJmN2EyMWMyOGM6CgogICBhcm02NDogZHRzOiBhbWxvZ2ljOiBFbmFibGUgdGhlIG5wdSBub2Rl
IGZvciBBbHRhIGFuZCBWSU0zICgyMDI1LTA3LTA0IDE3OjEwOjE2ICswMjAwKQoKLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpB
bWxvZ2ljIEFSTTY0IERUIGZvciB2Ni4xNzoKLSBBbGlnbiB3aWZpIG5vZGUgbmFtZSB3aXRoIGJp
bmRpbmdzCi0gQWRkIHBpbmN0cmwgbm9kZXMgZm9yIEFtbG9naWMgUzcvUzdEL1M2IG5vZGVzCi0g
RW5hYmxlIHRoZSBOUFUgbm9kZXMgb24gQWx0YSAmIFZJTTMKLSBOZXcgYm9hcmRzOgogICAtIFVn
b29zIEFNMwoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQpKLiBOZXVzY2jDpGZlciAoMik6CiAgICAgICBkdC1iaW5kaW5nczog
YXJtOiBhbWxvZ2ljOiBBZGQgVWdvb3MgQU0zCiAgICAgICBhcm02NDogZHRzOiBhbWxvZ2ljOiBB
ZGQgVWdvb3MgQU0zCgpLcnp5c3p0b2YgS296bG93c2tpICgxKToKICAgICAgIGFybTY0OiBkdHM6
IGFtbG9naWM6IEFsaWduIHdpZmkgbm9kZSBuYW1lIHdpdGggYmluZGluZ3MKClRvbWV1IFZpem9z
byAoMSk6CiAgICAgICBhcm02NDogZHRzOiBhbWxvZ2ljOiBFbmFibGUgdGhlIG5wdSBub2RlIGZv
ciBBbHRhIGFuZCBWSU0zCgpYaWFud2VpIFpoYW8gKDMpOgogICAgICAgZHRzOiBhcm02NDogYW1s
b2dpYzogYWRkIFM3IHBpbmN0cmwgbm9kZQogICAgICAgZHRzOiBhcm02NDogYW1sb2dpYzogYWRk
IFM3RCBwaW5jdHJsIG5vZGUKICAgICAgIGR0czogYXJtNjQ6IGFtbG9naWM6IGFkZCBTNiBwaW5j
dHJsIG5vZGUKCiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9hbWxvZ2lj
LnlhbWwgfCAgMSArCiAgYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL01ha2VmaWxlICAgICAg
ICAgICAgICAgfCAgMSArCiAgYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL2FtbG9naWMtczYu
ZHRzaSAgICAgICAgfCA5NyArKysrKysrKysrKysrKysrKysrKysrCiAgYXJjaC9hcm02NC9ib290
L2R0cy9hbWxvZ2ljL2FtbG9naWMtczcuZHRzaSAgICAgICAgfCA4MSArKysrKysrKysrKysrKysr
KysKICBhcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvYW1sb2dpYy1zN2QuZHRzaSAgICAgICB8
IDkwICsrKysrKysrKysrKysrKysrKysrCiAgLi4uL2R0cy9hbWxvZ2ljL21lc29uLWcxMmItYTMx
MWQta2hhZGFzLXZpbTMuZHRzICAgfCAgNCArCiAgLi4uL2R0cy9hbWxvZ2ljL21lc29uLWcxMmIt
YTMxMWQtbGlicmV0ZWNoLWNjLmR0cyAgfCAgNCArCiAgLi4uL2FybTY0L2Jvb3QvZHRzL2FtbG9n
aWMvbWVzb24tZ3gtcDIzeC1xMjB4LmR0c2kgfCAgMiArLQogIGFyY2gvYXJtNjQvYm9vdC9kdHMv
YW1sb2dpYy9tZXNvbi1neG0tcmJveC1wcm8uZHRzIHwgIDIgKy0KICAuLi4vYXJtNjQvYm9vdC9k
dHMvYW1sb2dpYy9tZXNvbi1neG0tdWdvb3MtYW0zLmR0cyB8IDkxICsrKysrKysrKysrKysrKysr
KysrCiAgMTAgZmlsZXMgY2hhbmdlZCwgMzcxIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1n
eG0tdWdvb3MtYW0zLmR0cwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtYW1sb2dpYwo=
