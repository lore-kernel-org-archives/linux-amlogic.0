Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A994CC433EF
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Mar 2022 08:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0jNtT/+pQJ91i1kOhus0AvMn7jBI7TFLnbOnzqOuBzA=; b=iJXpaBRV9gu98l
	xIi8/UE6TbCvr6gTtVsstNAqtxNws9HrSCAErR/dbeT55/O4TnAUoEMKyissYs2ljRO4geM99pyDz
	nBTU404DDEKCKhdLs98SkrDFqNywSYan920MMwpRpksb85w6pz8EbsfwDV/E4AvShnZkt0wUuOua+
	Khy2BB3Ynmjikj7eXNjG4NLVJA+96ylBF5B/EgBrKST/yovjatysmxd0DybvAGedie6QsG+EoW3jn
	Bvn02xitA2V0GO74dZe+XDi9b8EN3hWNnlFncwBWIa9L/emJw19wlErKkBk3O3NVnCwMnGLv8VWkz
	TgHrrDazu0AmVIeazIFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPgWY-005hxR-6T; Thu, 03 Mar 2022 08:09:22 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPgWV-005hvG-EA
 for linux-amlogic@lists.infradead.org; Thu, 03 Mar 2022 08:09:20 +0000
Received: by mail-wr1-x429.google.com with SMTP id x15so6443691wru.13
 for <linux-amlogic@lists.infradead.org>; Thu, 03 Mar 2022 00:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Z6JyIRyQjmSUtkW88pmcBmgAMAjTfjaBSIAjcjL9OVw=;
 b=E0Npjfox6oARCXqef/ki4z3U3S3pEMaz9/n9UG3aUZ68amCdmjwb18hcpdSqSONxsL
 8DiOVPd4/4R4r4i6UPOAvZZMdhBda8JQ9ldoYTMThxhhCSuwbrG2BLYfTUhT607oVgT1
 RA0m/RxXVYdURAuD7CQKjpD5o2O/Aljz6s3W0sIkxg3U63aq+Ch3c8JKO9WQnG5+IkgZ
 sqmWVGmYEN4zC+TXwlfCpNPXytgMtXZaKVmx+xgjiQv8yRIZ15bfVbwyZli2CRtFd1rs
 8QylsKiDChLpoWpkpmc66/O+ywCUSiEemr+i8IiQTiN+husZB2kbV78tV43Emgbih7NT
 AXXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Z6JyIRyQjmSUtkW88pmcBmgAMAjTfjaBSIAjcjL9OVw=;
 b=Cy6Len/uYEUpllFPVUUb5cNaMUcZ6AAFmn86qHv/yCPOwwpM5s4xOdax9kr9ID+c9n
 bwAv1GwRgfjJbgktdJOxzmHPwKhnRNEqmuZ7zrGgkKI8SkiHbwiR1xKWT3Ti4oj+e446
 rojcoElUcfhNaO46gaTgZUm4ISDn0VJ7BGx3iaaAGRA+XueqvgxrsoOk7Q4sCmXICwuT
 qN3kId9bfsuYjOb13vp2BsIZQZ7TMsObImQzH5A9ErQsuA7Ni5vkKAi1zRk8F0XjhoF8
 6hkVDOMon1IVTM7EWpruHsdxjOAy+OVQP9WVAcWDuD7ROMcmEgM/+LzHpY/XWq65nvvk
 OPGw==
X-Gm-Message-State: AOAM532zzcx75/v+QNRdM0o3clyixII39wpRagl7qMC6ZTo1/WRh1ZTO
 xDEhos9irnCroB0o6PfvnztDYg==
X-Google-Smtp-Source: ABdhPJxPM3kI13wFwt3A6IcMRrK7MK6qxv6UEHqOpofmJc3dylmW24GXvKuHRZ7VaPAAsLhhSBWpDA==
X-Received: by 2002:a5d:4ec6:0:b0:1f0:5929:7f53 with SMTP id
 s6-20020a5d4ec6000000b001f059297f53mr950008wrv.400.1646294957944; 
 Thu, 03 Mar 2022 00:09:17 -0800 (PST)
Received: from ?IPV6:2001:861:44c0:66c0:37d4:6d61:9015:27a5?
 ([2001:861:44c0:66c0:37d4:6d61:9015:27a5])
 by smtp.gmail.com with ESMTPSA id
 c4-20020adfef44000000b001ef93c7bbb8sm1277168wrp.30.2022.03.03.00.09.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Mar 2022 00:09:17 -0800 (PST)
Message-ID: <3c1dc535-37f5-89e0-4a75-a4b7d1cd1721@baylibre.com>
Date: Thu, 3 Mar 2022 09:09:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH V3] tty: serial: meson: Fix the compile link error
 reported by kernel test robot
Content-Language: en-US
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
 <8747c5c6-a129-3a26-8ebb-9e21a18236ec@baylibre.com>
 <Yh6KzOU4xsSB0lRf@kroah.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <Yh6KzOU4xsSB0lRf@kroah.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220303_000919_497866_AC0C66A4 
X-CRM114-Status: GOOD (  12.81  )
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

SGksCgpPbiAwMS8wMy8yMDIyIDIyOjA2LCBHcmVnIEtyb2FoLUhhcnRtYW4gd3JvdGU6Cj4gT24g
VHVlLCBNYXIgMDEsIDIwMjIgYXQgMDg6MjM6MjZBTSArMDEwMCwgTmVpbCBBcm1zdHJvbmcgd3Jv
dGU6Cj4+IEhpIEdyZWcsCj4+Cj4+IExlIDI4LzAyLzIwMjIgw6AgMjI6MjEsIEdyZWcgS3JvYWgt
SGFydG1hbiBhIMOpY3JpdMKgOgo+Pj4gT24gTW9uLCBGZWIgMjgsIDIwMjIgYXQgMDM6MTM6NDhQ
TSArMDEwMCwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cj4+Pj4gSGksCj4+Pj4KPj4+PiBPbiAyOC8w
Mi8yMDIyIDE0OjU1LCBZdSBUdSB3cm90ZToKPj4+Pj4gRGVzY3JpYmVzIHRoZSBjYWxjdWxhdGlv
biBvZiB0aGUgVUFSVCBiYXVkIHJhdGUgY2xvY2sgdXNpbmcgYSBjbG9jawo+Pj4+PiBmcmFtZS4g
Rm9yZ290IHRvIGFkZCBpbiBLY29uZmlnIGtlcm5lbCB0ZXN0IFJvYm90IGNvbXBpbGF0aW9uIGVy
cm9yCj4+Pj4+IGR1ZSB0byBDT01NT05fQ0xLIGRlcGVuZGVuY3kuCj4+Pj4+Cj4+Pj4+IEZpeGVz
OiAoInR0eTogc2VyaWFsOm1lc29uOiBEZXNjcmliZXMgdGhlIGNhbGN1bGF0aW9uIG9mIHRoZSBV
QVJUIGJhdWQgcmF0ZSBjbG9jayB1c2luZyBhIGNsb2NrIGZyYW1l4oCcKQo+Pj4+Cj4+Pj4gQXMg
SSBhbHJlYWR5IHJlcGxpZWQgb24gVjIgb2YgdGhpcyBwYXRjaCwgeW91J3JlIGludml0ZWQgdG8g
YXBwbHkgdGhlc2UgZml4ZXMgZGlyZWN0bHkKPj4+PiBvbiB0aGUgbmV4dCB2ZXJzaW9uIG9mIHlv
dXIgIlVzZSBDQ0YgdG8gZGVzY3JpYmUgdGhlIFVBUlQgYmF1ZCByYXRlIGNsb2NrIiBwYXRjaHNl
dAo+Pj4+IGFuZCBub3QgYXMgYSBzZXBhcmF0ZSBwYXRjaC4KPj4+Cj4+PiBObywgdGhpcyBpcyBi
cm9rZW4gaW4gbGludXgtbmV4dCBub3cgYXMgdGhlIHBhdGggbGlzdGVkIGhlcmUgaXMgaW4gbXkK
Pj4+IHRyZWUgcmlnaHQgbm93Lgo+Pgo+PiBPaCwgSSB3YXNuJ3QgYXdhcmUgeW91IHRvb2sgdGhp
cyBwYXRjaHNldC4KPj4KPj4+Cj4+PiBJIG5lZWQgYSBmaXggZm9yIGl0LCBvciBJIGNhbiByZXZl
cnQgdGhlIG9yaWdpbmFsLgo+Pgo+PiBQbGVhc2UgcmV2ZXJ0IHRoZSB3aG9sZSBwYXRjaHNldCwg
aXQncyBub3QgcmVhZHkgeWV0LCBuZWl0aGVyIGZ1bGx5IHJldmlld2VkIGFuZHMgYnVnZ3kKPj4g
b24gb2xkIFNvQ3MuCj4gCj4gWWVzLCB3aWxsIGdvIGRvIHNvIG5vdywgdGhhbmtzIGZvciBsZXR0
aW5nIG1lIGtub3cgYW5kIHNvcnJ5IGFib3V0IGFsbAo+IG9mIHRoaXMuCgpUaGFua3MsIHdlJ2xs
IG1ha2Ugc3VyZSBpdCB3b24ndCBoYXBwZW4gYWdhaW4gYW5kIHdpbGwgd29yayB0b2F3cmRzIGEg
d29ya2luZyBzb2x1dGlvbgoKTmVpbAoKPiAKPiBncmVnIGstaAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0
CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
