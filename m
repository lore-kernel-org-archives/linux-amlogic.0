Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68AC2C433F5
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Mar 2022 07:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cm8wBllAUKKvk81yx1gyKWk3fn+u3zjHMGj1Q7C+Adc=; b=lzDypfbUAUDIYV
	LvaQvEtwsV8+xQlaqrnYF0xXbGG/MenA9Zc3UgJOgjAXKy1qT4pcd1BoxA5arbL/AaB8pxfaU3tWm
	U9hH+SKcP8M3TuEI+9XochmBv/qd+DHL06qA2VNX90I76qXKcZWAZvWZX4XVHUiHaDpq0PR8rvxuV
	UcIIn9KIHQiX24zy63/bAnh2M6zuLFKY4fFU+wjqYXr3sflx8n2JX47cuig/epQ7KWenCLwuhre38
	Be4TVIZ43UOvHDOUV0cg2BAsRJ8pPufZerThgDVjLaSFrlXt93k+NA/TB6DfBXRmwXzm3XQ1FuXWj
	6zeZioC3wdW7dMjiN8Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOwrA-00FI28-JB; Tue, 01 Mar 2022 07:23:36 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOwr4-00FHzs-Uu
 for linux-amlogic@lists.infradead.org; Tue, 01 Mar 2022 07:23:34 +0000
Received: by mail-wr1-x42f.google.com with SMTP id j17so18987320wrc.0
 for <linux-amlogic@lists.infradead.org>; Mon, 28 Feb 2022 23:23:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=rIE4EFGbZL6WUGzIqVirpqO3d5o889rX0VfU2ArstBs=;
 b=DSMA/InOe8DCAy1FOXo5Q8hNYk7jctcE1mLmlLYJv5dAfQy31qvAqddYdd7rechXhB
 3Pc9dbphWXWCcJ5wC7I92H4YOW9zubI0SWOGYxiVP4zXH4v3VxYSD40owx8Jsnvv/DXX
 L148TZGUl4KY93X5CeCNHtb5VpbpsPMHMm+/l2bQ1Cf02gd1PrcM+8TgmfEHVo3jjNLW
 IYmGfptof/UBwShwv91RcKES1B4mNj/FsMVXVVBlYB0oQbZ07d6Dcqy3sHjU/XN/32jl
 6oNSrqQdRdySGEfapDN/9ZFCsi4MKpxiAd4Pz04BsB7Ldq8+eF9H/OesOI+7IgGj47SG
 ZNtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rIE4EFGbZL6WUGzIqVirpqO3d5o889rX0VfU2ArstBs=;
 b=NoBjKvIZ1NxS19qZS07sJ2CVPPGT+pKrMHUe6SxB613+51cf69SN8t/kDETNe0OM5f
 piWE0YNRSJIdKelMy/AzFHGb0YEPKZ3z74nperoWMJRz9PS9KwUBSavyOiSRCYjf5DJ/
 AZEhB1ZzEDKv2TxVmAdxLxdDySnZFHGWZrVkRaAevp9eRWo+N3xXI7rImxgxutmxCGd1
 xPlTK9FJNNsbCyfxBC4HMbFhRJxRPDtuaCZgOLvdxv/kIscSip1C5XctAdDlEO1H/5I3
 Kd6loU+VWfkhtTd6A1AwSIcXBve4Jp7st4bev7b7uRtP1dvOG91c9UDONIPyFyWDO7q9
 oJ+w==
X-Gm-Message-State: AOAM532DFNYLOe1CmAriEmAJeJxTzi0bHV/3Cfpb1kOtTGE+mcyOBIBk
 ZBkZnG9ojoIJ1JhENJNPS04H5g==
X-Google-Smtp-Source: ABdhPJy+QZiDJNqpcz0wGmi44+WOjQ0ZF8WegPcQOAe5tKXgKNVBB/+c5PQ4y6VD8Lpv6d8js3NZLw==
X-Received: by 2002:a5d:4578:0:b0:1ed:bf30:40f3 with SMTP id
 a24-20020a5d4578000000b001edbf3040f3mr18812678wrc.669.1646119408164; 
 Mon, 28 Feb 2022 23:23:28 -0800 (PST)
Received: from ?IPV6:2001:861:44c0:66c0:f9e4:b6da:2b53:5858?
 ([2001:861:44c0:66c0:f9e4:b6da:2b53:5858])
 by smtp.gmail.com with ESMTPSA id
 i5-20020a1c3b05000000b00382871cf734sm186554wma.25.2022.02.28.23.23.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 23:23:27 -0800 (PST)
Message-ID: <8747c5c6-a129-3a26-8ebb-9e21a18236ec@baylibre.com>
Date: Tue, 1 Mar 2022 08:23:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: [PATCH V3] tty: serial: meson: Fix the compile link error
 reported by kernel test robot
Content-Language: fr
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Yu Tu <yu.tu@amlogic.com>, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 kernel test robot <lkp@intel.com>, Dan Carpenter <dan.carpenter@oracle.com>
References: <20220228135530.6918-1-yu.tu@amlogic.com>
 <29b34655-f820-39c9-4363-878481cd3f63@baylibre.com>
 <Yh087tJhakKHs88e@kroah.com>
From: Neil Armstrong <narmstrong@baylibre.com>
In-Reply-To: <Yh087tJhakKHs88e@kroah.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_232331_076337_8A856E15 
X-CRM114-Status: GOOD (  12.08  )
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

SGkgR3JlZywKCkxlIDI4LzAyLzIwMjIgw6AgMjI6MjEsIEdyZWcgS3JvYWgtSGFydG1hbiBhIMOp
Y3JpdMKgOgo+IE9uIE1vbiwgRmViIDI4LCAyMDIyIGF0IDAzOjEzOjQ4UE0gKzAxMDAsIE5laWwg
QXJtc3Ryb25nIHdyb3RlOgo+PiBIaSwKPj4KPj4gT24gMjgvMDIvMjAyMiAxNDo1NSwgWXUgVHUg
d3JvdGU6Cj4+PiBEZXNjcmliZXMgdGhlIGNhbGN1bGF0aW9uIG9mIHRoZSBVQVJUIGJhdWQgcmF0
ZSBjbG9jayB1c2luZyBhIGNsb2NrCj4+PiBmcmFtZS4gRm9yZ290IHRvIGFkZCBpbiBLY29uZmln
IGtlcm5lbCB0ZXN0IFJvYm90IGNvbXBpbGF0aW9uIGVycm9yCj4+PiBkdWUgdG8gQ09NTU9OX0NM
SyBkZXBlbmRlbmN5Lgo+Pj4KPj4+IEZpeGVzOiAoInR0eTogc2VyaWFsOm1lc29uOiBEZXNjcmli
ZXMgdGhlIGNhbGN1bGF0aW9uIG9mIHRoZSBVQVJUIGJhdWQgcmF0ZSBjbG9jayB1c2luZyBhIGNs
b2NrIGZyYW1l4oCcKQo+Pgo+PiBBcyBJIGFscmVhZHkgcmVwbGllZCBvbiBWMiBvZiB0aGlzIHBh
dGNoLCB5b3UncmUgaW52aXRlZCB0byBhcHBseSB0aGVzZSBmaXhlcyBkaXJlY3RseQo+PiBvbiB0
aGUgbmV4dCB2ZXJzaW9uIG9mIHlvdXIgIlVzZSBDQ0YgdG8gZGVzY3JpYmUgdGhlIFVBUlQgYmF1
ZCByYXRlIGNsb2NrIiBwYXRjaHNldAo+PiBhbmQgbm90IGFzIGEgc2VwYXJhdGUgcGF0Y2guCj4g
Cj4gTm8sIHRoaXMgaXMgYnJva2VuIGluIGxpbnV4LW5leHQgbm93IGFzIHRoZSBwYXRoIGxpc3Rl
ZCBoZXJlIGlzIGluIG15Cj4gdHJlZSByaWdodCBub3cuCgpPaCwgSSB3YXNuJ3QgYXdhcmUgeW91
IHRvb2sgdGhpcyBwYXRjaHNldC4KCj4gCj4gSSBuZWVkIGEgZml4IGZvciBpdCwgb3IgSSBjYW4g
cmV2ZXJ0IHRoZSBvcmlnaW5hbC4KClBsZWFzZSByZXZlcnQgdGhlIHdob2xlIHBhdGNoc2V0LCBp
dCdzIG5vdCByZWFkeSB5ZXQsIG5laXRoZXIgZnVsbHkgcmV2aWV3ZWQgYW5kcyBidWdneQpvbiBv
bGQgU29Dcy4KClRoYW5rcywKTmVpbAoKPiAKPiB0aGFua3MsCj4gCj4gZ3JlZyBrLWgKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMg
bWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
