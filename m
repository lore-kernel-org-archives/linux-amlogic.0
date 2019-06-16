Return-Path: <SRS0=LsuB=UP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86EDDC31E50
	for <linux-amlogic@archiver.kernel.org>; Sun, 16 Jun 2019 18:58:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10C9620665
	for <linux-amlogic@archiver.kernel.org>; Sun, 16 Jun 2019 18:58:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cfhklBvE";
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=aplu.fr header.i=@aplu.fr header.b="Fgew7YfL";
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=aplu.fr header.i=@aplu.fr header.b="Fgew7YfL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10C9620665
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=aplu.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qZsDCyLG2m45PDzIOlT9VEtT6yGxHN8aFGRuFOKPIno=; b=cfhklBvEEo4HAM
	sOvJ5/m/NQT342yYmBz5e8eOXAtAlJcZ2GTIZnzliwY1DnYby040SxQVT3W8ea6efeoeOIUTMQJC3
	N9v5v8zAAkj6iDGYiKe0pCLDCmU8VTpsai0OwXln4y2F3NpwToB/qjoaUzrYm5F5a0jJhoJP3YeG9
	t7r5j5/EvHAy63QJ1aGQfre614/8+GUXLYY7V7LPwhgv5JP0SIuwC980+ceTjg1OBa3fix5Rmrb+U
	BTZ/SPNTn47pHLq14VdfnjxQReCQxA56qJM5wsr4GPEb25lXvZDb0wqrvZFna2EbNP7EL9u656HYi
	HCiXAtrRHeVpmK1XfhOA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hcaLl-0008UF-19; Sun, 16 Jun 2019 18:57:57 +0000
Received: from eva.aplu.fr ([91.224.149.41])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hcaLi-0008Tt-Eo
 for linux-amlogic@lists.infradead.org; Sun, 16 Jun 2019 18:57:56 +0000
Received: from eva.aplu.fr (localhost [127.0.0.1])
 by eva.aplu.fr (Postfix) with ESMTP id 6952EE27;
 Sun, 16 Jun 2019 20:57:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aplu.fr; s=s4096;
 t=1560711467; bh=4JQDhztJGj9DPFBHVjpBL70Tb1FtxqlQENv6XKETv7o=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Fgew7YfL3MfYcKjyp7qhUkKCrHOEmEzz3HNQnX8NBT1zGD3J1t1frlPe8fefYo9bE
 eMHC+SbOfHCxH/OVR6B9doTkz4An7nTPa+yBiRFCLq3RVwuHiBCDJ5k2yYCeSkgHfr
 OI9TZiPOkRtIbGjSOITl7ReL/vDOXxRpmmfLBVAC8dcAu8F2w0udbgMTA41r/mPaJ1
 Ug4ndlxw+v32XgkyZRBFouvxT7TDx/jKFcVswXun7rEA0M78lQTrRLN6NLh8Uhhxga
 cw8q1VeoPE1K2WGdpxbcFKw/jguASdm9C+nHTeeCst+zSDh/HIxaEyfyewtjzbkkDw
 IbH3BrQNy2x8JYS7vkcm8OudIRjMcCOPsRgDw04Dj9mQfSV75rxi4ZXrutWujjxy9G
 AYmSgcFy0sRctu8NY6loN3y03Z5zp5W5meAlAe5CpKj2wLQ0i26Ln43y+1qHsby8/Q
 ZwMwWBExMJ2Q+f2CElP8lnvjdUX/s0QglYpT2vNseturLF/20wr2qfGS29I2+0KH3M
 lPunywnguEHYQMYGNOEIw11I7kyLni76V5HJjGGK1mfAThde90GBVfDlkclS4AIQbG
 Vp+qiugG0rtrmODlrPOtu25eZdDv2O6HJVcPlJA5u+1tBJN5mhQPpuM1rdFjZhkDE1
 DT0efOp/FGGKYvxrvZmvR1P0=
Received: from [IPv6:2a03:7220:8081:2901::1003] (unknown
 [IPv6:2a03:7220:8081:2901::1003])
 by eva.aplu.fr (Postfix) with ESMTPSA id E2F13E1C;
 Sun, 16 Jun 2019 20:57:46 +0200 (CEST)
Authentication-Results: eva.aplu.fr;
 dmarc=fail (p=none dis=none) header.from=aplu.fr
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aplu.fr; s=s4096;
 t=1560711467; bh=4JQDhztJGj9DPFBHVjpBL70Tb1FtxqlQENv6XKETv7o=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Fgew7YfL3MfYcKjyp7qhUkKCrHOEmEzz3HNQnX8NBT1zGD3J1t1frlPe8fefYo9bE
 eMHC+SbOfHCxH/OVR6B9doTkz4An7nTPa+yBiRFCLq3RVwuHiBCDJ5k2yYCeSkgHfr
 OI9TZiPOkRtIbGjSOITl7ReL/vDOXxRpmmfLBVAC8dcAu8F2w0udbgMTA41r/mPaJ1
 Ug4ndlxw+v32XgkyZRBFouvxT7TDx/jKFcVswXun7rEA0M78lQTrRLN6NLh8Uhhxga
 cw8q1VeoPE1K2WGdpxbcFKw/jguASdm9C+nHTeeCst+zSDh/HIxaEyfyewtjzbkkDw
 IbH3BrQNy2x8JYS7vkcm8OudIRjMcCOPsRgDw04Dj9mQfSV75rxi4ZXrutWujjxy9G
 AYmSgcFy0sRctu8NY6loN3y03Z5zp5W5meAlAe5CpKj2wLQ0i26Ln43y+1qHsby8/Q
 ZwMwWBExMJ2Q+f2CElP8lnvjdUX/s0QglYpT2vNseturLF/20wr2qfGS29I2+0KH3M
 lPunywnguEHYQMYGNOEIw11I7kyLni76V5HJjGGK1mfAThde90GBVfDlkclS4AIQbG
 Vp+qiugG0rtrmODlrPOtu25eZdDv2O6HJVcPlJA5u+1tBJN5mhQPpuM1rdFjZhkDE1
 DT0efOp/FGGKYvxrvZmvR1P0=
Subject: Re: Meson8b network not stable at gigabit
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <2878d188-4c06-b1a3-4ba9-00a274cd2018@aplu.fr>
 <CAFBinCAV=UuX4vovuUqb+hs+sbHth4asQT_idBq2XiBKBeVbGw@mail.gmail.com>
 <c6684037-7d06-457e-2931-9e375128b2e7@aplu.fr>
 <CAFBinCDJ0oAhrficayP0aMWrUsasU-NT6RkGH3x1BLw8U3h6pA@mail.gmail.com>
From: Aymeric <mulx@aplu.fr>
Openpgp: preference=signencrypt
Autocrypt: addr=mulx@aplu.fr; prefer-encrypt=mutual; keydata=
 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
Message-ID: <22a14736-d363-f5a8-fdb3-fec5400cb6a8@aplu.fr>
Date: Sun, 16 Jun 2019 20:57:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAFBinCDJ0oAhrficayP0aMWrUsasU-NT6RkGH3x1BLw8U3h6pA@mail.gmail.com>
Content-Language: fr
X-AV-Checked: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190616_115754_947809_2334A3D9 
X-CRM114-Status: UNSURE (   9.63  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGVsbG8gTWFydGluLAoKTGUgMTYvMDYvMjAxOSDDoCAxODozMCwgTWFydGluIEJsdW1lbnN0aW5n
bCBhIMOpY3JpdMKgOgo+IE9uIFN1biwgSnVuIDE2LCAyMDE5IGF0IDY6MDUgUE0gQXltZXJpYyA8
bXVseEBhcGx1LmZyPiB3cm90ZToKPiBbLi4uXQo+PiBUaGUgcmVzdWx0IGZyb20gL3Byb2MvaW50
ZXJydXB0cyBhYm92ZSBhcmUgd2hlbiBJJ20gY29ubmVjdGVkIHRvIG15Cj4+IG9wZXJhdG9yIGJv
eCwgZnJvbSB0aGUgZC1saW5rIHRoZSB2YWx1ZSBkb2Vzbid0IGNoYW5nZSBhbnkgbW9yZS4KPj4K
Pj4gQWNjb3JkaW5nIHRvIHRoZSAiYWJvdXQgcGFnZSIgb2YgdGhlIGludGVybmV0IGJveCwgdGhp
cyBpcyBhIFNhZ2VtY29tCj4+IChMaXZlYm94IDMpLgo+Pgo+PiBTbyBpdCBsb29rIGxpa2UgdGhl
cmUgYSBpbmNvbXBhdGliaWxpdHkgYmV0d2VlbiB0aGUgUmVhbHRlayBSVEw4MjExRiBhbmQKPj4g
dGhlICJTYWdlbWNvbSIgYnV0IG5vdCB3aXRoIGEgInN0dXBpZCIgZC1saW5rIHN3aXRjaOKApi4K
PiBjYW4geW91IHRyeSB0byBkaXNhYmxlIEVFRSAoZW5lcmd5IGVmZmljaWVudCBFdGhlcm5ldCkg
Zm9yIEdiaXQgbGlua3M/Cj4geW91IG5lZWQgdG8gcmVidWlsZCB0aGUgLmR0YiAodHlwaWNhbGx5
IGJ1aWx0IHRvZ2V0aGVyIHdpdGggdGhlCj4ga2VybmVsKSBmb3IgdGhhdDoKPiAtIG9wZW4gYXJj
aC9hcm0vYm9vdC9kdHMvbWVzb244Yi1vZHJvaWRjMS5kdHMKPiAtIGdvIHRvIHRoZSAiZXRoX3Bo
eSIgbm9kZSAoZm9yIGV4YW1wbGU6IFswXSkKPiAtIGJlbG93IHRoZSAicmVnID0gPDA+OyIgbGlu
ZSBhZGQ6IGVlZS1icm9rZW4tMTAwMHQ7Cj4gLSByZWJ1aWxkIHRoZSBrZXJuZWwgdG8gZ2V0IGFu
IHVwZGF0ZWQgLmR0Ygo+IC0gYm9vdCB0aGUga2VybmVsIHdpdGggdGhhdCAuZHRiCgpUZXN0IGRv
bmUgb24gNS4yLjAtcmM0LCB0aGF0IGRpZG4ndCBjaGFuZ2UgYW55dGhpbmcgKEkndmUgZG91Ymxl
CmNoZWNrZWQsIHRoaXMgaXMgdGhlIG5ldyAuZHRiIEknbSB1c2luZykuCgotLSAKQXltZXJpYwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1s
b2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
