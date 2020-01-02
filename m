Return-Path: <SRS0=tZMI=2X=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECFCFC2D0DE
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Jan 2020 00:17:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4B0620672
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Jan 2020 00:17:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jaJ/fvwv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bJLGjSX1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4B0620672
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jatGzDGBBBYIXC9ss1XWYkzkHhTie1Vg3Qh4M0eSY4c=; b=jaJ/fvwvFWuGR4iVFAoFAs5ZC
	I3CNe6D7D9wXf09D15LWRX8faJdDZEntl6A5mgPXE55DcbqMigme+LyOXLKNnkuB0L5joN+bg6xMg
	BokxKHXSoF4R4dxruCS/9qQWyIEcEzU82pkyTZ/a00xV4vAQLk7KPEckKc2TS27K/BtUwKPqjGsjS
	qzVP3IYjU4CD2LoHFmu8Yuv1BdAovwhnokrxYMdo1g9GDdXF8uzYh63NyzuO2ObKowLqdwEPpdfKi
	jdDNQ4kDEbtyo1EZEWQE4501+VFeul2VVz5HCXb6skXV2LPZHs7BG4wfiWFrKlZWkprVGI/ZUizIg
	ThP/+JDiw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1imoAk-0006QN-Lg; Thu, 02 Jan 2020 00:17:06 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1imoAh-0006PS-OL
 for linux-amlogic@lists.infradead.org; Thu, 02 Jan 2020 00:17:05 +0000
Received: by mail-pj1-x1041.google.com with SMTP id m13so2639549pjb.2
 for <linux-amlogic@lists.infradead.org>; Wed, 01 Jan 2020 16:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=d1gJTRoVgoW1Djfn0+eKQOtAeJxr3yzEp21FmQo3iog=;
 b=bJLGjSX1NTtdx2RtHiddA+PPX1L5Q+2fNTNMTTwwJAxfiY+VtfE9Wd3iYBTHf18YGh
 shzhFnZfDse9De87jj4z7vnSBrumu18Pg2+NuWV6wLt2bAyussn3n6O10gFPSQBKk+8i
 2VM7mTfanItETYa22ZZ7OA5FFcw/j78Y+30S3lbJGvRGAF/aj2u6S4QRce2/2zwV1sSo
 UqcM8rv+nz8q9f/apuet5beWCvWoe/4VzhpPleoZo3ZNwe2yplhhvPtIZQ4NS3XTL3LL
 3snBNIKof6MYBWoAbp/36Rp872n2VCQsdUmxSGGldUziioRw9YEa9fplKSRzxayO47E7
 FvcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=d1gJTRoVgoW1Djfn0+eKQOtAeJxr3yzEp21FmQo3iog=;
 b=d2hnEmjDHBjeNhKGZQASsHzFiEiSdUE1Vc5Pg5HxjYSfDhwGVdEeC9+gxOOq/w6lci
 Xpd6SjohyGRbuI5JdpL1t0BEUd4gyX3dWFzhgFfKA2SQ6XNLEl4PVulnTmUmS91PJIgK
 rbjCeHHnNcmw3BHpra9jEYr0UMIiAS1u5ouR263jWImT1zkfX9X8KwhUoA1ds7jbCG1k
 L7qS162DEkE6sVOk6AYJKAvwYTdXuONBry2X71LugIsT/JAnV8bLnFIJ38gxst/syYcZ
 lzTjGb8/N0FMJMj+v9yXaC/VwvH5pQ8pQIWWn7iS8608kO2CtbtTW4UmxmYA59ejoEvk
 4oPw==
X-Gm-Message-State: APjAAAWeYwDzVg0jGjB+w2lvDQU2Mm2fI8ZwYZCEipo7aak5hdiW4lbo
 aEtYsy6+144bm1mDx7NfXfpu9Xp2
X-Google-Smtp-Source: APXvYqw5MxsFH79Dpzt3gkAZAFR73K098gFnuwWUNshFpGnLJnr9W4HqdqzJb2uKFnjIu3+znpw6KQ==
X-Received: by 2002:a17:902:728b:: with SMTP id
 d11mr69008988pll.49.1577924222281; 
 Wed, 01 Jan 2020 16:17:02 -0800 (PST)
Received: from ?IPv6:2402:b801:2855:200:f50e:18de:9586:8ea4?
 ([2402:b801:2855:200:f50e:18de:9586:8ea4])
 by smtp.gmail.com with ESMTPSA id h6sm56401513pgq.61.2020.01.01.16.17.00
 for <linux-amlogic@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jan 2020 16:17:01 -0800 (PST)
Subject: Re: [RFC-next 0/1] Odroid C2: Enable DVFS for cpu
To: linux-amlogic@lists.infradead.org
References: <20191101143126.2549-1-linux.amoon@gmail.com>
 <7hfthtrvvv.fsf@baylibre.com>
 <c89791de-0a46-3ce2-b3e2-3640c364cd0f@baylibre.com>
 <CANAwSgQx3LjQe60TGgKyk6B5BD5y1caS2tA+O+GFES7=qCFeKg@mail.gmail.com>
 <7hfthsqcap.fsf@baylibre.com>
 <CAFBinCBfgxXhPKpBLdoq9AimrpaneYFgzgJoDyC-2xhbHmihpA@mail.gmail.com>
 <7hpngvontu.fsf@baylibre.com>
 <4e1339b4-c751-3edc-3a2e-36931ad1c503@baylibre.com>
 <CAFBinCCgKcwXSLxS_CRvz9JZvQo8PcUGm=egBbabVZSrkSc30Q@mail.gmail.com>
 <CANAwSgSFR3kftWLPqyoYfyxdQ5dcp2W7NgRCaFNkMj-xEDY1Kw@mail.gmail.com>
 <83791a71-a45c-383d-0406-b0f4e0a0c215@baylibre.com>
From: Brad <bjharper@gmail.com>
Message-ID: <6fa964be-7222-66d6-2118-90b6e618b7d1@gmail.com>
Date: Thu, 2 Jan 2020 11:16:55 +1100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <83791a71-a45c-383d-0406-b0f4e0a0c215@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200101_161703_815662_D508D0C5 
X-CRM114-Status: GOOD (  16.02  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
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

Ck9uIDE0LzEyLzIwMTkgMTI6MjQgYW0sIE5laWwgQXJtc3Ryb25nIHdyb3RlOgo+Cj4gVGhpcyBp
cyB0aGUgcG9pbnQsIHRoZSBPZHJvaWQtQzIgaXMgKm5vdCogc3RhYmxlIGF0IDJHSHosCj4gYSBs
YXJnZSBhbW91bnQgb2YgYm9hcmQgZG9lc24ndCBzdXBwb3J0IDJHSHosIHRoaXMgaXMgd2h5IEFt
bG9naWMKPiBkcm9wcGVkIHRoZSBmcmVxID4gMS41MzYgR0h6IGZvciB0aGUgR1hCQiBmYW1pbHku
Cj4KPiBCdXQgSGFyZEtlcm5lbCBzdGlsbCBkZWxpdmVycyB0aGUgU0NQSSB0YWJsZSB3aXRoID4g
MS41MzYgR0h6IHdoaWNoIGJyZWFrcwo+IG9uIG1vc3Qgb2YgdGhlIGJvYXJkcywgYnV0IGRvZXNu
J3Qgb24gMy4xNCBzaW5jZSB0aGV5IGhhdmUgYSBoYWNrIGRpc2FibGluZwo+IGhpZ2hlciBmcmVx
cyB3aXRoIGEgY21kbGluZSBzZXQgaW4gYm9vdC5pbmkuCgpIaSBOZWlsLAoKSGFyZGtlcm5lbCBk
aWQgdXBkYXRlIHRoZXJlIGZpcm13YXJlIHRvIHJlc3RyaWN0IGZyZXF1ZW5jeSB0byAxLjUzNiBi
YWNrIAppbiAyMDE3IGJhY2sgaW4gdGhpcyBjb21taXQgCmh0dHBzOi8vZ2l0aHViLmNvbS9oYXJk
a2VybmVsL3UtYm9vdC9jb21taXQvMjA1YzdiMzI1OTU1OTI4MzE2MTcwM2ExYTIwMGI3ODdjMmM0
NDVhNSAKVmVyc2lvbnMgcHJpb3IgdG8gdGhpcyB3b3VsZCBydW5hd2F5IG9uIGJvb3QgdXAgdG8g
MkdoeiBhbmQgY3Jhc2guCgpUaGV5IGFsc28gYWRkZWQgYSBoaWRkZW4gZnVuY3Rpb24gdG8gdGhl
IFNDUElfQ01EX0dFVF9EVkZTX0lORk8gY2FsbCAKd2hpY2ggd29ya3MgYnkgY2hhbmdpbmcgdGhl
IGRvbWFpbiBudW1iZXIgaW4gdGhlIGNhbGwgdG8gcHVsbCBiYWNrIApkaWZmZXJlbnQgT1BQIHRh
Ymxlcy7CoCBEb21haW4gc2V0IHRvIDAgd2lsbCBsaW1pdCBmcmVxdWVuY3kgdG8gMS41MzYuwqAg
ClRoZXkgc2V0IHRoZSBoaWdoZXN0IGJpdCBpbiB0aGUgZG9tYWluIG51bWJlciB0byAxIHdoaWNo
IG9wZW5zIFNDUEkgCnRhYmxlIHRvIDIuMDE2R0h6LsKgIFRoaXMgaXMgZG9uZSBpbiB2aWEgQkwz
MDEgc28gaXQgbWlnaHQgYmUgcG9zc2libGUgCmZvciBtYWlubGluZSBrZXJuZWwgdG8gY2hlY2sg
dGhpcyBiaXQgYW5kIG9wZW4gdXAgdGhlIHRhYmxlIGFmdGVyIGJvb3QgCnVzaW5nIGEgc3BlY2lh
bCBkcml2ZXIuwqAgSm95IHBvc3RlZCBzb21lIGRldGFpbHMgaGVyZSAKaHR0cHM6Ly9mb3J1bS5v
ZHJvaWQuY29tL3ZpZXd0b3BpYy5waHA/Zj0xNDEmdD0yMzA0NCZzdGFydD0zNTAjcDE4MTAxNwoK
T2YgY291cnNlIGl0IHdvdWxkIHN0aWxsIGNhdXNlIHByb2JsZW1zIGZvciBib2FyZHMgcnVubmlu
ZyBhbiBvbGQgCnZlcnNpb24gb2YgdGhlIGZpcm13YXJlIGJ1dCBuZXdlciB2ZXJzaW9ucyBvZiB0
aGUgYm9vdGxvYWRlciBib290IGZpbmUgCmluIG1haW5saW5lIHdpdGggRFZGUyBlbmFibGVkIGFz
IGl0cyBsaW1pdGVkIHRvIDEuNTM2IGJ5IGRlZmF1bHQuCgo+IFRoZSB2YXJpb3VzIHRlc3RzIGdh
dmUgdmVyeSBsaXR0bGUgcGVyZiBlbmhhbmNlbWVudCBieSBnb2luZyA+IDEsNTM2IEdIeiwgc2Vy
aW91c2x5Cj4gaXQncyBub3Qgd29ydGggdGhlIHBhaW4uCj4KPiBOZWlsCgpNeSB0ZXN0cyBzaG93
ZWQgbXkgYm9hcmQgKHRoZXkgbWF5IHZhcnkpIHdhcyB2ZXJ5IHN0YWJsZSB1cCB0byAKMS42ODBH
aHoswqAgYXQgMS43NTJHaHogY291bGQgZ2V0IGl0IHRvIGNyYXNoIGlmIEkgdHJpZWQgdG8gYnVy
biBhbGwgNCAKY29yZXMgd2l0aCBoZWF2eSBORU9OIHN0cmVzcyB0ZXN0LiBBdCAxLjg5NkdIeiBJ
IHdvdWxkIGdldCByYW5kb20gCmZyZWV6ZXMgZXZlbiB3aXRoIG9ubHkgMSBjb3JlIGVuYWJsZWQg
YXQgYm9vdC7CoCBJIG11c3Qgc2F5IEkgbmV2ZXIgCnRlc3RlZCB3aXRoIE1hbGkgZW5hYmxlZCBz
byBpdCBtYXkgaW5mbHVlbmNlIHRoaW5ncy4KCkkgZG8gYWdyZWUgdGhvdWdoIGl0IG1pZ2h0IGNh
dXNlIG1vcmUgcGFpbiB0aGF0IGl0IGlzIHdvcnRoIGVzcGVjaWFsbHkgCndoZW4gb2xkIGZpcm13
YXJlIGlzIHVzZWQuCgotIEJyYWQKCj4+IC1BbmFuZAo+Pgo+Cj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlz
dAo+IGxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxp
c3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
