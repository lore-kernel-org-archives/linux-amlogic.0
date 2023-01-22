Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D000C25B4E
	for <linux-amlogic@archiver.kernel.org>; Sun, 22 Jan 2023 10:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aIaODkejc61zkeGepf3/PlkDNGCZOq/Xj/JYMZz4TMM=; b=J5g0csNbma/0MU
	EutxMTdOKgUD3kNcx/Qb54BD0gdS5zySMHoY9y1GFW+K4wmGs/JTWyEuP+Nty8rsuQ7OxLNMBvID0
	naQItVhEXijzGH/kGvNUJZMeCAhgE332hnqyzSs9lLZRih5+Cc0zD1FdC0LTz9V9WLFkhLTX91n49
	fOphfGB6h+ILycokYoPCHYSJ14+mJtucNSrxqFBr7/BEs8UaKj3MWy+R5UVqgeYdnzPp0seSP3N8x
	iSo8LwsrZMOkEsLXQCQMzH4WcYUwFDtWVkbjhig219PrWrAx5PtfCd7mTdqibJYuyhLqzhrv9YTCM
	oTYdfnYSesNxd1T9AmOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJXZA-00FBPF-Tw; Sun, 22 Jan 2023 10:27:12 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJXZ7-00FBOr-NP
	for linux-amlogic@lists.infradead.org; Sun, 22 Jan 2023 10:27:11 +0000
Received: by mail-wm1-x332.google.com with SMTP id d4-20020a05600c3ac400b003db1de2aef0so6581269wms.2
        for <linux-amlogic@lists.infradead.org>; Sun, 22 Jan 2023 02:27:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wk6FsWIS4ZBuHEZu7VBYzgcq+EAfdiuejIfyOd1Hk5E=;
        b=AvvxbjdHDNGMEyInF1jUPZciIJLhzXxvaXY0aE2s3mtSn/7bS5uY9lpfP+99xxM0Ye
         OuF0hvXklqQt3oUK2I2xENY5foY8idkQ7iSSNUoWQIqesMdPYOyuNvJHed9b6afS4vpd
         zJtL7l1F5qMnzMaskk9AH9ZxLL+UcTpI++TA2Lx8UPCLt45DvAxSKdCYk34BKW4n9fqQ
         D7j/EZZJ6mGCBIt4FXDhoWw0LeebBK7wV8AzzZsT3aftC4lauTJKi4Pu+WYzmoXLan8R
         9iFOfRU4wEGq7OZ9b+LnIUIvFF6tmK0H5L5p4Azc7voJq/sWzy1h5aDiRM5Pwetuz6YD
         UsUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wk6FsWIS4ZBuHEZu7VBYzgcq+EAfdiuejIfyOd1Hk5E=;
        b=TaJC+BGYocKWD7SGUxi85XbBTHEfVk7NdojwFPbq7bb+iYWL4b7hJhLfxejLsH2LUb
         gnIaHysPMkaptZqrnAR1Uo3/j4L1DVjR2mYo5sc/3hzI60AAONuJMeBNPaWxGraGgBAU
         04SilvIPvT2hj01nTqejMrLkL1T1LGy1+xlABqEjFH8VGq0Uj4kfWSUhwAHt60TSBVoL
         rtzw9rMQsRlN5D6UB2n8Tfe4MTEfIxx8Ij0/NIKie58S+CvOEzDZW37lBMu3iXPHaHpB
         75RdWVmk4mv9aT86BKKdrI0oTBiK9x2/9GWxgsxb0EpLkNAPzbdmgaZymNkEl/4n3x++
         w4aw==
X-Gm-Message-State: AFqh2koos65mhZO6P0ZF9MCk9frf0NSDuam/B1dqDHCMZU5Tviwi7Nx/
	SO/QvGzwrxNNrwZdZrIJP0+NvP+JKHKKYxf8SWA=
X-Google-Smtp-Source: AMrXdXufeQ1l3yMZGTGYOH/bch9Vp41bF/B1oCR5n7kI9uEbR3lnWcAoKkQFXjBTRAjjMVOHGhG/eg==
X-Received: by 2002:a05:600c:4e16:b0:3db:15b1:fafd with SMTP id b22-20020a05600c4e1600b003db15b1fafdmr14785595wmq.24.1674383224217;
        Sun, 22 Jan 2023 02:27:04 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:3095:3ab6:8d3f:21f? ([2a01:e0a:982:cbb0:3095:3ab6:8d3f:21f])
        by smtp.gmail.com with ESMTPSA id p16-20020a05600c359000b003da105437besm8101471wmq.29.2023.01.22.02.27.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Jan 2023 02:27:03 -0800 (PST)
Message-ID: <665b1349-531b-2c6b-8711-1300ecd42b7f@linaro.org>
Date: Sun, 22 Jan 2023 11:27:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v3 0/9] Used onboard HUB to reset and add power to hub
Content-Language: fr
To: Anand Moon <linux.amoon@gmail.com>
Cc: linux-amlogic@lists.infradead.org, Matthias Kaehlcke <mka@chromium.org>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Johan Hovold <johan@kernel.org>
References: <20230121175639.12818-1-linux.amoon@gmail.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <20230121175639.12818-1-linux.amoon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230122_022709_840714_7C11FEC4 
X-CRM114-Status: GOOD (  14.56  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGkgQW5hbmQsCgpMZSAyMS8wMS8yMDIzIMOgIDE4OjU2LCBBbmFuZCBNb29uIGEgw6ljcml0wqA6
Cj4gQW1sb2dpYyBib2FyZCB1c2UgZ3Bpby1ob2cgdG8gcmVzZXQgdGhlIFVTQiBodWIuCj4gc28g
dXNpbmcgb25ib2FyZCBodWIgd2UgY291bGQgcmVzZXQgdGhlIFVTQiBodWIgYW5kCj4gYWxzbyBl
bmFibGUgcG93ZXIgdG8gdGhlIFVTQiBodWIuCj4gdjM6IEZpeCBzb21lIHNtYWxsIGNoYW5nZXMg
aW4gJHN1YmplY3QKPiAgICAgIGFkZHJlc3MgdGhlIGlucHV0IGZyb20gTmVpbAo+ICAgICAgZml4
IHRoZSB2aWFsYWIgZGV2aWNlIHRyZWUgYmluZGluZyBhcyBwZXIgS3J6eXN6dG9mIGlucHV0cy4K
PiAKPiB2MjogT2Ryb2lkIEMxIC8gQzIgOiB1c2IgaHViIHJlc2V0IHdvcmtpbmcgYXMgZXhwZWN0
ZWQuCj4gICAgICBPZHJvaWQgTjIgOiBkcm9wcGVkIHVzYiBodWIgY2hhbmdlcywgc2luY2UgbXkg
Ym9hcmQgVVNCIGh1Ygo+ICAgICAgICAgICAgICAgICAgaXMgaGl0dGluZyByZWdyZXNzaW9uLgo+
ICAgICAgT2Ryb2lkIEM0IDogRml4IHRoZSBkZXZpY2UgdHJlZSBiaW5kaW5nIGFuZCB1c2VkIHBl
ZXItaHViIGZvcgo+ICAgICAgICAgICAgICAgICAgdXNiMi4wIGFuZCB1c2IzLjAgaHViLgo+IFsx
XSBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMzAxMTgwNDQ0MTguODc1LTEwLWxpbnV4
LmFtb29uQGdtYWlsLmNvbQo+IAo+IHYxOiBPZHJvaWQgQzEgLyBDMiA6IHdlcmUgbm90IHdvcmtp
bmcgYXMgZXhwZWN0ZWQuCj4gICAgICBPZHJvaWQgTjIgOiB1c2VkIHNpbmdsZSBVU0IgMy4wIGh1
YiByZXNldC4KPiAgICAgIE9kcm9pZCBDNCA6IHVzZWQgc2luZ2xlIFVTQiAzLjAgaHViIHJlc2V0
Lgo+IAo+IFswXSBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtYW1s
b2dpYy9saXN0Lz9zZXJpZXM9NzA3MjkyCj4gCj4gQW55IGlucHV0cyBmb3IgdGhlc2UgY2hhbmdl
cyA/CgpNb3N0IG9mIHRoZSBwYXRjaGVzIGhhdmUgYmVlbiBhcHBsaWVkIGJ5IEdyZWcsIHNvIHJl
YmFzZSB0aGlzIHNlcmllIG9uCnRoZSBsYXN0ZXN0IGxpbnV4LW5leHQgYW5kIHNlbmQgb25seSB0
aGUgcmVtYWluaW5nIHBhdGNoZXMuCgpOZWlsCgo+IAo+IFRoYW5rcwo+IC1BbmFuZAo+IAo+IEFu
YW5kIE1vb24gKDkpOgo+ICAgIGR0LWJpbmRpbmdzOiB1c2I6IEFkZCBkZXZpY2UgaWQgZm9yIEdl
bmVzeXMgTG9naWMgaHViIGNvbnRyb2xsZXIKPiAgICBBUk06IGR0czogYW1sb2dpYzogVXNlZCBv
bmJvYXJkIHVzYiBodWIgcmVzZXQgb24gb2Ryb2lkIGMxCj4gICAgYXJtNjQ6IGR0czogYW1sb2dp
YzogVXNlZCBvbmJvYXJkIHVzYiBodWIgcmVzZXQgb24gb2Ryb2lkIGMyCj4gICAgdXNiOiBtaXNj
OiBvbmJvYXJkX3VzYl9odWI6IGFkZCBHZW5lc3lzIExvZ2ljIEdMODUyRyBodWIgc3VwcG9ydAo+
ICAgIHZlbmRvci1wcmVmaXhlczogQWRkIFZJQSBMYWJzLCBJbmMuCj4gICAgZHQtYmluZGluZ3M6
IHVzYjogQWRkIFZpYSBsYWIgVkw4MTcgaHViCj4gICAgYXJtNjQ6IGR0czogYW1sb2dpYzogVXNl
ZCBvbmJvYXJkIHVzYiBodWIgcmVzZXQgb24gb2Ryb2lkIGM0Cj4gICAgdXNiOiBtaXNjOiBvbmJv
YXJkX3VzYl9odWI6IGFkZCBWSUEgTEFCIFZMODE3IGh1YiBzdXBwb3J0Cj4gICAgYXJtNjQ6IGRl
ZmNvbmZpZzogRW5hYmxlIFVTQiBvbmJvYXJkIEhVQiBkcml2ZXIKPiAKPiAgIC4uLi9iaW5kaW5n
cy91c2IvZ2VuZXN5cyxnbDg1MGcueWFtbCAgICAgICAgICB8ICAxICsKPiAgIC4uLi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3VzYi92aWFsYWIsdmw4MTcueWFtbCB8IDcxICsrKysrKysrKysrKysrKysr
KysKPiAgIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3ZlbmRvci1wcmVmaXhlcy55YW1sICB8ICAy
ICsKPiAgIGFyY2gvYXJtL2Jvb3QvZHRzL21lc29uOGItb2Ryb2lkYzEuZHRzICAgICAgICB8IDIz
ICsrKy0tLQo+ICAgLi4uL2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZ3hiYi1vZHJvaWRjMi5kdHMg
IHwgMjUgKysrLS0tLQo+ICAgLi4uL2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tc20xLW9kcm9pZC1j
NC5kdHMgIHwgMzMgKysrKystLS0tCj4gICBhcmNoL2FybTY0L2NvbmZpZ3MvZGVmY29uZmlnICAg
ICAgICAgICAgICAgICAgfCAgMSArCj4gICBkcml2ZXJzL3VzYi9taXNjL29uYm9hcmRfdXNiX2h1
Yi5jICAgICAgICAgICAgfCAgNCArKwo+ICAgZHJpdmVycy91c2IvbWlzYy9vbmJvYXJkX3VzYl9o
dWIuaCAgICAgICAgICAgIHwgMTEgKysrCj4gICA5IGZpbGVzIGNoYW5nZWQsIDEzMSBpbnNlcnRp
b25zKCspLCA0MCBkZWxldGlvbnMoLSkKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL3ZpYWxhYix2bDgxNy55YW1sCj4gCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBt
YWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
